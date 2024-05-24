package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;

@Log4j2
@Controller
@RequestMapping(value="/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberService;
    @GetMapping("/join")
    public void GETJoin() {

    }

    @PostMapping("/join")
    public String POSTJoin(@Valid MemberDTO memberDTO,
                         BindingResult bindingResult,
                         RedirectAttributes redirectAttributes) {
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("err", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/member/join";

        }
        log.info(memberDTO);
        int result = memberService.regist(memberDTO);
        return "redirect:/";
    }
    @GetMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam(name = "member_id", defaultValue = "") String member_id,
                        HttpServletResponse response) throws IOException {
        log.info("---------------------");
        log.info("MemberController => idCheck()");

        int result = memberService.id_check(member_id);
        log.info("result : " + result);
        log.info("---------------------");
        return result;

    }
    @GetMapping("/emailCheck")
    @ResponseBody
    public int emailCheck(@RequestParam(name = "member_email", defaultValue = "") String member_email,
                       HttpServletResponse response) throws IOException {
        log.info("---------------------");
        log.info("MemberController => idCheck()");

        int result = memberService.email_check(member_email);
        log.info("member_email : " + member_email);
        log.info("result : " + result);
        log.info("---------------------");
        return result;

    }



}
