package org.fullstack4.woolim.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.fullstack4.woolim.service.MemberServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Controller
@RequestMapping(value="/teacher")
@RequiredArgsConstructor
public class TeacherController {

    private final MemberServiceIf memberServiceIf;
    private final ModelMapper modelMapper;

    @GetMapping("/list")
    public void GETList(Model model, PageRequestDTO pageRequestDTO,@RequestParam(defaultValue = "9") int page_size) {
        String member_type = "teacher";
        pageRequestDTO.setPage_size(page_size);
        pageRequestDTO.setMember_type(member_type);
        log.info(pageRequestDTO);

        PageResponseDTO<MemberDTO> responseDTO = memberServiceIf.MemberList(pageRequestDTO);

        log.info(responseDTO);
        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/view")
    public void GETView() {

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
}
