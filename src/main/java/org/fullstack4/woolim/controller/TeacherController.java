package org.fullstack4.woolim.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.fullstack4.woolim.service.BbsServiceIf;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.fullstack4.woolim.service.MemberServiceImpl;
import org.fullstack4.woolim.service.QnaServiceIf;
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
    private final QnaServiceIf qnaServiceIf;
    private final BbsServiceIf bbsServiceIf;
    private final ModelMapper modelMapper;
    private final MemberMapper memberMapper;

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
    public void GETView(Model model, PageRequestDTO pageRequestDTO,@RequestParam(name="member_idx") int member_idx,@RequestParam(defaultValue = "9") int page_size
    ,@RequestParam(defaultValue="") String bbs_type) {
        pageRequestDTO.setMember_idx(member_idx);
        pageRequestDTO.setPage_size(page_size);
        pageRequestDTO.setBbs_teacher_yn("Y");

        log.info("member_idx :" +member_idx);
        MemberDTO IdDTO = MemberDTO.builder()
                .member_idx(pageRequestDTO.getMember_idx())
                .build();
        String member_id = memberMapper.view(IdDTO).getMember_id();


        pageRequestDTO.setMember_id(member_id);
        PageResponseDTO<LectureDTO> responseDTO = memberServiceIf.LectureListbyTeacherpage(pageRequestDTO);
        MemberDTO memberDTO = memberServiceIf.memberView(member_id);


        pageRequestDTO.setTeacher_id(member_id);
        pageRequestDTO.setBbs_type(bbs_type);
        PageResponseDTO<BbsDTO> bbsList = bbsServiceIf.bbsListByPage(pageRequestDTO);
        PageResponseDTO<QnaDTO> qnaList = qnaServiceIf.qnaListByPage(pageRequestDTO);

//        pageRequestDTO.setBbs_type("bbs04");
//        PageResponseDTO<BbsDTO> noticeListDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);
//        pageRequestDTO.setBbs_type("bbs03");
//        PageResponseDTO<BbsDTO> faqListDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);
//        pageRequestDTO.setBbs_type("bbs05");
//        PageResponseDTO<BbsDTO> invenListDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

//        log.info("noticeList:{}", noticeListDTO);
//        log.info("faqList:{}", faqListDTO);
//        log.info("invenList:{}", invenListDTO);

        log.info(responseDTO);
        log.info(memberDTO);
        log.info("bbsList:{}",bbsList);

//        model.addAttribute("noticeListDTO", noticeListDTO);
//        model.addAttribute("faqListDTO", faqListDTO);
//        model.addAttribute("invenListDTO", invenListDTO);
        model.addAttribute("qnaList", qnaList);
        model.addAttribute("bbsList", bbsList);
        model.addAttribute("memberDTO", memberDTO);
        model.addAttribute("responseDTO", responseDTO);
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
