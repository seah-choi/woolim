package org.fullstack4.woolim.mapper;

import org.fullstack4.woolim.domain.OrderVO;
import org.fullstack4.woolim.dto.OrderDTO;

public interface AdminMapper {
    int adminTotalOrder();
    int adminTotalsales();
    int adminTotalClass();
    int adminTotalMember();
    int monthNewMembers();
    int weekNewMembers();
    int todayNewMembers();
    int monthOrders();
    int weekOrders();
    int todayOrders();
    int monthSales();
    int weekSales();
    int todaySales();
}
