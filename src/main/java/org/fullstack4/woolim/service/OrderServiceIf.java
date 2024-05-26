package org.fullstack4.woolim.service;

import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.domain.OrderDetailVO;
import org.fullstack4.woolim.dto.*;

import java.util.List;

public interface OrderServiceIf {
    void DoOrder(OrderDTO orderDTO, MemberDTO memberDTO, PaymentDTO paymentDTO, List<CartDTO> cartDTO, List<LectureDTO> lectureDTOList) throws InsufficientStockException;
    int DoOrderDetail(OrderDTO orderDTO);
    int PointCharge(MemberDTO memberDTO);
    PageResponseDTO<PaymentDTO> getPayment(PageRequestDTO pageRequestDTO);
    PageResponseDTO<OrderDTO> viewOrderList(PageRequestDTO pageRequestDTO);
    List<OrderDTO> viewOrderDetailList(OrderDTO orderDTO);
    void DOrefund(OrderDTO orderDTO,MemberDTO memberDTO,PaymentDTO paymentDTO,LectureDTO lectureDTO) throws InsufficientStockException;
    void Dopurchase(OrderDTO orderDTO,ClassDTO classDTO,LectureDTO lectureDTO) throws InsufficientStockException;
}
