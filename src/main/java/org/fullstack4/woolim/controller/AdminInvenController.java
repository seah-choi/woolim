package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/admin/inven")
@RequiredArgsConstructor
public class AdminInvenController {

    @GetMapping("/list")
    public void GETList() {

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
