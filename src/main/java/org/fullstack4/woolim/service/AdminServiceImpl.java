package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.OrderVO;
import org.fullstack4.woolim.dto.OrderDTO;
import org.fullstack4.woolim.mapper.AdminMapper;
import org.fullstack4.woolim.mapper.OrderMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminServiceIf{
    private final AdminMapper adminMapper;
    private final ModelMapper modelMapper;

    @Override
    public int adminTotalOrder() {
        return adminMapper.adminTotalOrder();
    }

    @Override
    public int adminTotalsales() {
        return adminMapper.adminTotalsales();
    }

    @Override
    public int adminTotalClass() {
        return adminMapper.adminTotalClass();
    }

    @Override
    public int adminTotalMember() {
        return adminMapper.adminTotalMember();
    }

    @Override
    public int monthNewMembers() {
        return adminMapper.monthNewMembers();
    }

    @Override
    public int weekNewMembers() {
        return adminMapper.weekNewMembers();
    }

    @Override
    public int todayNewMembers() {
        return adminMapper.todayNewMembers();
    }

    @Override
    public int monthOrders() {
        return adminMapper.monthOrders();
    }

    @Override
    public int weekOrders() {
        return adminMapper.weekOrders();
    }

    @Override
    public int todayOrders() {
        return adminMapper.todayOrders();
    }

    @Override
    public int monthSales() {
        return adminMapper.monthSales();
    }

    @Override
    public int weekSales() {
        return adminMapper.weekSales();
    }

    @Override
    public int todaySales() {
        return adminMapper.todaySales();
    }
}
