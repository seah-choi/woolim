package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.fullstack4.woolim.common.CommonUtil;
import org.fullstack4.woolim.common.FileUtil;
import org.fullstack4.woolim.dto.*;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;

import org.fullstack4.woolim.service.AdminServiceIf;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

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

        PageResponseDTO<MemberDTO> memberList = memberServiceIf.adminMemberList(pageRequestDTO);

        model.addAttribute("memberList", memberList);

        log.info("memberList : " + memberList);

        log.info("AdminMemberController >> GETList() END");
        log.info("============================");
    }


    @GetMapping("/view")
    public void GETView(@RequestParam(name="member_id") String member_id,
                        @RequestParam(name = "member_idx", defaultValue = "0") int member_idx,
                        Model model) {
        log.info("========================");
        log.info("AdminMemberController >> view()");



        MemberDTO memberList = memberServiceIf.adminMemberView(member_id);
        model.addAttribute("memberList", memberList);

        TeacherSubjectDTO teacherDTO = memberServiceIf.teacherIntroView(member_id);

        model.addAttribute("teacherDTO", teacherDTO);
        log.info("teacherDTO : {} ",teacherDTO);



        log.info("memberList : "+memberList);

        log.info("AdminMemberController >> GETList() END");
        log.info("============================");
    }

    @PostMapping("/view")
    public String POSTView(@Valid MemberDTO memberDTO,
                           BindingResult bindingResult,

                           RedirectAttributes redirectAttributes,
                           HttpServletRequest req,
                           @RequestParam(name="member_idx", defaultValue = "0") int member_idx,
                           @RequestParam(name="teacher_intro") String teacher_intro,
                           @RequestParam(name="subject_category_code") String subject_category_code,
                           MultipartHttpServletRequest files,
                           Model model  )  {

        log.info("============================");
        log.info("AdminMemberController >> POSTView() START");


        List<MultipartFile> list = files.getFiles("files");
        String uploadFoler = CommonUtil.getUploadFolder(req, "teacher");


        int result = memberServiceIf.adminDetail(memberDTO);

        log.info("POSTModify result : " + result);

        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getSize() == 0) {
                break;
            }
            FileDTO fileDTO = FileDTO.builder()
                    .file(list.get(i))
                    .uploadFolder(uploadFoler)
                    .build();

            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            log.info("=======================");
            log.info("upload : " + map);
            log.info("=======================");
            if (map.get("result").equals("success")) {
                TeacherSubjectDTO teacherSubjectDTO = TeacherSubjectDTO.builder()
                        .member_idx(member_idx)
                        .teacher_image_file(map.get("newName"))
                        .teacher_intro(teacher_intro)
                        .subject_category_code(subject_category_code)
                        .build();
                memberServiceIf.teacherIntroUpdate(teacherSubjectDTO);
            }
        }

        log.info("AdminMemberController >> POSTView() END");
        log.info("============================");

        if (result > 0) {
            return "redirect:/admin/member/view?member_id=" + memberDTO.getMember_id();
        } else {
            return "redirect:/admin/member/view?member_id=" + memberDTO.getMember_id();
        }

    }


    @GetMapping("/modify")
    public void GETModify() {

    }

    @GetMapping("/delete")
    public String GETDelete(
                            @RequestParam(name = "member_idx", required = false) String idxList
                            ) {
        //체크박스 삭제
        String[] arrIdx = idxList.split(",");
        Integer[] newArr = Stream.of(arrIdx).mapToInt(Integer::parseInt).boxed().toArray(Integer[]::new);
        memberServiceIf.deleteMemberList(newArr);

        log.info("idxList : " + idxList);
        return "redirect:/admin/member/list";
    }


}
