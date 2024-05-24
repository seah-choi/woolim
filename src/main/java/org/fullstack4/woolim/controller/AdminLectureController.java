package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.service.lectureAdmin.LectureAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/admin/lecture")
@RequiredArgsConstructor
public class AdminLectureController {
    @Autowired
    private LectureAdminService lectureAdminService;

    @GetMapping("/list")
    public void GETList() {

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
    @GetMapping("/teacherList")
    public void GETteacherList(Model model) {
        List<MemberDTO> list = lectureAdminService.getTeacherList();
        log.info("list---" + list);

        model.addAttribute("list" , list);
    }

}
