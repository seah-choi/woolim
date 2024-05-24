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
        List<CartVO> cartVO = cartDTO.stream().map(dto->modelMapper.map(dto,CartVO.class)).collect(Collectors.toList());
        PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);


        for(LectureDTO lectureDTO : lectureDTOList){
            orderDTO.setPrice(lectureDTO.getLecture_sale_price());
            orderDTO.setLecture_idx(lectureDTO.getLecture_idx());
            OrderDetailVO orderDetailVO = modelMapper.map(orderDTO, OrderDetailVO.class);
            int exist =orderMapper.exist(orderDetailVO);
            log.info(exist);
            if(exist > 0){
                throw new InsufficientStockException("이미 수강중인 강좌가 있습니다.");
            }
            orderMapper.DoOrderDetail(orderDetailVO);
            orderMapper.Enrolment(orderDetailVO);
        }

        orderMapper.DoOrder(orderVO);
        orderMapper.InsertPayment(paymentVO);
        memberMapper.changePoint(memberVO);

        for (CartVO cartVO1 : cartVO) {
            cartMapper.deleteCartOrJjim(cartVO1);
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
}
