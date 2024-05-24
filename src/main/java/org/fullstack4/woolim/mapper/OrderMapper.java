package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.OrderDetailVO;
import org.fullstack4.woolim.domain.OrderVO;
import org.fullstack4.woolim.domain.PaymentVO;
import org.fullstack4.woolim.dto.OrderDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface OrderMapper {
    int DoOrder(OrderVO orderVO);
    int DoOrderDetail(OrderDetailVO orderDetailVO);
    int Enrolment(OrderDetailVO orderDetailVO);
    int InsertPayment(PaymentVO paymentVO);
    List<PaymentVO> GetPayment(PageRequestDTO pageRequestDTO);
    int total_count(PageRequestDTO pageRequestDTO);
    int exist(OrderDetailVO orderDetailVO);
    List<OrderVO> viewOrderList(PageRequestDTO pageRequestDTO);
}
