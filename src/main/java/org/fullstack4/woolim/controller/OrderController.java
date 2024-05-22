package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/order")
@RequiredArgsConstructor
public class OrderController {
    @GetMapping("/order")
    public void GETOrder(){
        log.info("OrderController");
    }
}