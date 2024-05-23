package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/admin/member")
@RequiredArgsConstructor
public class AdminMemberController {
    private final MemberServiceIf memberServiceIf;
    @GetMapping("/list")
    public void GETList(PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("AdminMemberController >> GETList() START");

        PageResponseDTO<MemberDTO> memberList = memberServiceIf.MemberList(pageRequestDTO);

        model.addAttribute("memberList", memberList);

        log.info("memberList : " + memberList);

        log.info("AdminMemberController >> GETList() END");
        log.info("============================");
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
