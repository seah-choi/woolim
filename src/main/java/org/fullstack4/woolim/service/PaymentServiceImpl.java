package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.PaymentVO;
import org.fullstack4.woolim.dto.PaymentDTO;
import org.fullstack4.woolim.mapper.OrderMapper;
import org.fullstack4.woolim.mapper.PaymentMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentServiceIf{

    private final OrderMapper orderMapper;
    private final ModelMapper modelMapper;

    @Override
    public int InsertPayment(PaymentDTO paymentDTO) {
        PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);
        int result = orderMapper.InsertPayment(paymentVO);
        return result;
    }
}
