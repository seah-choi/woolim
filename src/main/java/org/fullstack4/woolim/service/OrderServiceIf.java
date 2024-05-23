package org.fullstack4.woolim.service;

import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.*;

import java.util.List;

public interface OrderServiceIf {
    void DoOrder(OrderDTO orderDTO, MemberDTO memberDTO, PaymentDTO paymentDTO, List<CartDTO> cartDTO, List<LectureDTO> lectureDTOList) throws InsufficientStockException;
    int DoOrderDetail(OrderDTO orderDTO);
    int PointCharge(MemberDTO memberDTO);
    List<PaymentDTO> getPayment(String member_id);
}
