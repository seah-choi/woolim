package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.lang.reflect.Member;

@Log4j2
@Controller
@RequestMapping(value="/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberService;
    @GetMapping("/join")
    public String GETJoin(HttpSession session,
                          RedirectAttributes redirectAttributes,
                          @RequestParam(name = "flag", defaultValue = "0") String flag,
                          Model model) {
        if(session.getAttribute("member_id")!=null){
            MemberDTO memberDTO = (MemberDTO) model.getAttribute("memberDTO");
            model.addAttribute("memberDTO", memberDTO);
            return "redirect:/";
        }
        if(flag.equals("0")){
            MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
            model.addAttribute("memberDTO", memberDTO);
        }
        else{
            session.removeAttribute("memberDTO");
        }
        return "/member/join";

    }

    @PostMapping("/join")
    public String POSTJoin(@RequestParam(name = "flag", defaultValue = "0")String flag,
                           @Valid MemberDTO memberDTO,
                           BindingResult bindingResult,
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {
        if(flag.equals("0")) {
            int result = memberService.regist(memberDTO);
            if (result > 0) {
                redirectAttributes.addAttribute("joinOK", "1");
                return "redirect:/login/login";
            } else {
                redirectAttributes.addAttribute("joinOK", "0");
                return "redirect:/member/join";
            }
        }
        else{
            log.info("session : " + session.getAttribute("memberDTO"));
            MemberDTO googleMember = (MemberDTO)session.getAttribute("memberDTO");
            log.info(memberDTO);
            memberDTO.setMember_id(googleMember.getMember_id());
            memberDTO.setMember_name(googleMember.getMember_name());
            memberDTO.setMember_email(googleMember.getMember_email());
            memberDTO.setMember_email_addr(googleMember.getMember_email_addr());
            memberDTO.setMember_addr_detail(googleMember.getMember_addr_detail());
            memberDTO.setMember_oauth(googleMember.getMember_oauth());
            memberDTO.setMember_category("student");
            int result = memberService.regist(memberDTO);
            if(result>0){
                session.removeAttribute("memberDTO");
                session.setAttribute("member_id", memberDTO.getMember_id());
                session.setAttribute("user_id", memberDTO.getMember_id());
                session.setAttribute("member_name", memberDTO.getMember_name());
                return "redirect:/";
            }

            return "redirect:/member/join";
        }
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
