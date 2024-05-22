package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/board")
@RequiredArgsConstructor
public class BoardController {

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

    @GetMapping("/freeList")
    public void GETfreeList() {

    }

    @GetMapping("/freeRegist")
    public void GETfreeRegist() {

    }

    @GetMapping("/freeModify")
    public void GETfreeModify() {

    }

    @GetMapping("/freeView")
    public void GETfreeView() {

    }
}
