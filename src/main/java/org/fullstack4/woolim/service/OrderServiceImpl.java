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
    public void DoOrder(OrderDTO orderDTO, MemberDTO memberDTO, PaymentDTO paymentDTO, List<CartDTO> cartDTO, List<LectureDTO> lectureDTOList) throws InsufficientStockException {
        OrderVO orderVO = modelMapper.map(orderDTO, OrderVO.class);
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        List<CartVO> cartVO = cartDTO.stream().map(dto->modelMapper.map(dto,CartVO.class)).collect(Collectors.toList());
        PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);

        log.info(orderVO.toString());
        log.info(memberVO.toString());
        log.info(cartVO.toString());
        log.info(paymentVO.toString());

        log.info(orderDTO);
        for(LectureDTO lectureDTO : lectureDTOList){
            orderDTO.setPrice(lectureDTO.getLecture_sale_price());
            orderDTO.setLecture_idx(lectureDTO.getLecture_idx());
            log.info(orderDTO);
            OrderDetailVO orderDetailVO = modelMapper.map(orderDTO, OrderDetailVO.class);
            log.info(orderDetailVO);
            orderMapper.DoOrderDetail(orderDetailVO);
            orderMapper.Enrolment(orderDetailVO);
        }

        log.info("OrderVO :{}", orderVO.toString());
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
}
