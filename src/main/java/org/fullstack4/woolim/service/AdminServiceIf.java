package org.fullstack4.woolim.service;

import org.fullstack4.woolim.dto.OrderDTO;

public interface AdminServiceIf {
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
