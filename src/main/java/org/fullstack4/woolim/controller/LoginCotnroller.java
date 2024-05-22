package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.fullstack4.woolim.service.MemberServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Log4j2
@Controller
@RequestMapping(value="/login")
@RequiredArgsConstructor
public class LoginCotnroller {

    private final MemberServiceIf memberService;
    @GetMapping("/login")
    public void GETLogin() {

    }

    @PostMapping("/login")
    public void POSTLogin(MemberDTO memberDTO) {
        log.info("memberDTO" + memberDTO);
        boolean login = memberService.login(memberDTO);
        if (login) {
            log.info("로그인 성공");
        }else{
            log.info("로그인 실패");
        }
        
    }

    @GetMapping("/logout")
    public void GETLogout() {

    }


}
