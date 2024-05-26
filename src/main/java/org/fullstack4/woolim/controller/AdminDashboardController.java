package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.OrderVO;
import org.fullstack4.woolim.service.AdminServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/admin")
@RequiredArgsConstructor
public class AdminDashboardController {
    private final AdminServiceIf adminServiceIf;
    @GetMapping("/dashboard")
    public String GETDashboard(Model model) {
        int totalOrders  = adminServiceIf.adminTotalOrder();
        int totalSales = adminServiceIf.adminTotalsales();
        int totalClass = adminServiceIf.adminTotalClass();
        int totalMembers = adminServiceIf.adminTotalMember();
        int monthNewMembers = adminServiceIf.monthNewMembers();
        int weekNewMembers = adminServiceIf.weekNewMembers();
        int todayNewMembers = adminServiceIf.todayNewMembers();
        int monthOrders = adminServiceIf.monthOrders();
        int weekOrders = adminServiceIf.weekOrders();
        int todayOrders = adminServiceIf.todayOrders();
        int monthSales = adminServiceIf.monthSales();
        int weekSales = adminServiceIf.weekSales();
        int todaySales = adminServiceIf.todaySales();


        model.addAttribute("totalOrders", totalOrders);
        model.addAttribute("totalSales", totalSales);
        model.addAttribute("totalClass", totalClass);
        model.addAttribute("totalMembers", totalMembers);
        model.addAttribute("monthNewMembers", monthNewMembers);
        model.addAttribute("weekNewMembers", weekNewMembers);
        model.addAttribute("todayNewMembers", todayNewMembers);
        model.addAttribute("monthOrders", monthOrders);
        model.addAttribute("weekOrders", weekOrders);
        model.addAttribute("todayOrders", todayOrders);
        model.addAttribute("monthSales", monthSales);
        model.addAttribute("weekSales", weekSales);
        model.addAttribute("todaySales", todaySales);



        return "admin/dashboard";
    }

    @GetMapping("/regist")
    public void GETRegist() {

    }

    @GetMapping("/view")
    public void GETView() {

    }

    @GetMapping("/modify")
    public void GETModify() {

    }

    @GetMapping("/delete")
    public void GETDelete() {

    }
}
