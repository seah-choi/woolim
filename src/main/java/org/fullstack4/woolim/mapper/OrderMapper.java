package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.OrderDetailVO;
import org.fullstack4.woolim.domain.OrderVO;
import org.fullstack4.woolim.domain.PaymentVO;

@Mapper
public interface OrderMapper {
    int DoOrder(OrderVO orderVO);
    int DoOrderDetail(OrderDetailVO orderDetailVO);
    int Enrolment(OrderDetailVO orderDetailVO);
    int InsertPayment(PaymentVO paymentVO);
}
