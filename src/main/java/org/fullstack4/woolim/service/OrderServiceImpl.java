package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.domain.*;
import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.mapper.CartMapper;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.fullstack4.woolim.mapper.OrderMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderServiceIf{

    private final OrderMapper orderMapper;
    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;
    private final CartMapper cartMapper;

    @Override
    @Transactional(rollbackFor = {InsufficientStockException.class, Exception.class})
    public void DoOrder(OrderDTO orderDTO, MemberDTO memberDTO, PaymentDTO paymentDTO, List<CartDTO> cartDTO, List<LectureDTO> lectureDTOList) throws InsufficientStockException {
        OrderVO orderVO = modelMapper.map(orderDTO, OrderVO.class);
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);


        for(LectureDTO lectureDTO : lectureDTOList){
            orderDTO.setPrice(lectureDTO.getLecture_sale_price());
            orderDTO.setLecture_idx(lectureDTO.getLecture_idx());
            OrderDetailVO orderDetailVO = modelMapper.map(orderDTO, OrderDetailVO.class);
            int exist =orderMapper.exist(orderDetailVO);
            int exist2 = orderMapper.exist2(orderDetailVO);
            log.info(exist);
            LocalDate now = LocalDate.now();
            if(now.isAfter(lectureDTO.getLecture_start_date())){
                throw new InsufficientStockException("지금 수강신청 기간이 아닌 강좌가 있습니다.");
            }

            if(exist > 0){
                throw new InsufficientStockException("이미 결제한 강좌가 있습니다.");
            }
            if(exist2 > 0){
                throw new InsufficientStockException("이미 수강중인 강좌가 있습니다.");
            }
            orderMapper.DoOrderDetail(orderDetailVO);
//            orderMapper.Enrolment(orderDetailVO);
        }

        orderMapper.DoOrder(orderVO);
        orderMapper.InsertPayment(paymentVO);
        memberMapper.changePoint(memberVO);

        if(cartDTO != null) {
            List<CartVO> cartVO = cartDTO.stream().map(dto -> modelMapper.map(dto, CartVO.class)).collect(Collectors.toList());
            for (CartVO cartVO1 : cartVO) {
                cartMapper.deleteCartOrJjim(cartVO1);
            }
        }
    }

    @Override
    public int DoOrderDetail(OrderDTO orderDTO) {
        return 0;
    }

    @Override
    public int PointCharge(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO,MemberVO.class);
        int result = memberMapper.changePoint(memberVO);
        return result;
    }

    @Override
    public PageResponseDTO<PaymentDTO> getPayment(PageRequestDTO pageRequestDTO) {
        List<PaymentVO> paymentVO = orderMapper.GetPayment(pageRequestDTO);
        log.info("paymentVO: " + paymentVO);
        List<PaymentDTO> paymentDTO = paymentVO.stream()
                .map(vo->modelMapper.map(vo,PaymentDTO.class))
                .collect(Collectors.toList());

        int total_count = orderMapper.total_count(pageRequestDTO);
        PageResponseDTO<PaymentDTO> responseDTO = PageResponseDTO.<PaymentDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(paymentDTO)
                .build();

        return responseDTO;
    }

    @Override
    public PageResponseDTO<OrderDTO> viewOrderList(PageRequestDTO pageRequestDTO) {
        List<OrderVO> orderDTO = orderMapper.viewOrderList(pageRequestDTO);
        int total_count = orderMapper.OrderCount(pageRequestDTO);
        log.info("orderDTO: " + orderDTO);

        List<OrderDTO> dtoList = orderDTO.stream().map(vo->modelMapper.map(vo,OrderDTO.class)).collect(Collectors.toList());
        PageResponseDTO<OrderDTO> responseDTO = PageResponseDTO.<OrderDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();

        return responseDTO;
    }

    @Override
    public List<OrderDTO> viewOrderDetailList(OrderDTO orderDTO) {
        OrderDetailVO orderDetailVO = modelMapper.map(orderDTO, OrderDetailVO.class);
        log.info("orderDetailVO"+orderDetailVO);
        List<OrderDetailVO> voList = orderMapper.viewOrderDetailList(orderDetailVO);
        log.info("voList"+voList);
        List<OrderDTO> orderDTOList = voList.stream().map(vo->modelMapper.map(vo,OrderDTO.class)).collect(Collectors.toList());

        return orderDTOList;
    }

    @Override
    public void DOrefund(OrderDTO orderDTO, MemberDTO memberDTO, PaymentDTO paymentDTO,LectureDTO lectureDTO) throws InsufficientStockException {
        OrderDetailVO orderVO = modelMapper.map(orderDTO, OrderDetailVO.class);
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);

        LocalDate now = LocalDate.now();

        LocalDate lectureStartDate = lectureDTO.getLecture_start_date();
        LocalDate lectureEndDate = lectureDTO.getLecture_end_date();

// 강의 전체 기간(일 수)
        long totalDuration = ChronoUnit.DAYS.between(lectureStartDate, lectureEndDate);

// 현재 날짜부터 강의 시작일까지의 경과 일수
        long elapsedDuration = ChronoUnit.DAYS.between(lectureStartDate, now);

// 경과한 시간의 백분율
        double percentageElapsed = (double) elapsedDuration / totalDuration * 100;

        if(now.isAfter(lectureDTO.getLecture_end_date())){
            throw new InsufficientStockException("이미 수강기간이 종료된 강의입니다.");
        }
        if(percentageElapsed>50){
            throw new InsufficientStockException("지금은 환불이 불가능합니다.");
        }
        if(percentageElapsed>30){
            int price= Integer.parseInt(String.valueOf(orderVO.getPrice() * 0.5));
            orderVO.setPrice(price);
            memberVO.setMember_point(price);
            paymentVO.setPrice(price);
        }
        System.out.println("경과된 시간의 백분율: " + percentageElapsed + "%");
        
        


        orderMapper.UpdateStatus(orderVO);
        orderMapper.InsertPayment(paymentVO);
        memberMapper.changePoint(memberVO);
    }

    @Override
    public void Dopurchase(OrderDTO orderDTO, ClassDTO classDTO,LectureDTO lectureDTO) throws InsufficientStockException {
        OrderDetailVO orderVO = modelMapper.map(orderDTO, OrderDetailVO.class);
        ClassVO classVO = modelMapper.map(classDTO, ClassVO.class);


        orderMapper.insertGrade(classVO);
        orderMapper.UpdateStatus(orderVO);
        orderMapper.insertClass(classVO);
    }
}
