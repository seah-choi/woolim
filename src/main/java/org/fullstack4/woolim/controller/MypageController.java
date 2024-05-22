package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/mypage")
@RequiredArgsConstructor
public class MypageController {

    @GetMapping("/view")
    public void GETView(){

    }
    @GetMapping("/writeList")
    public void GETWriteList() {

    }

    @GetMapping("/paymentList")
    public void GETPaymentList() {

    }

    @GetMapping("/BoardList")
    public void GETBoardList() {

    }

    @GetMapping("/cart")
    public void GETCartList() {

    }

    @GetMapping("/regist")
    public void GETRegist() {

    }

    @GetMapping("/modify")
    public void GETModify() {

    }

    @GetMapping("/delete")
    public void GETDelete() {

    }

    @GetMapping("/jjim")
    public void GETJjim() {

    }
    @GetMapping("/qnaList")
    public void GETQnaList(){

    }
}
