package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/mystudy")
@RequiredArgsConstructor
public class MystudyController {

    @GetMapping("/classlist")
    public void GETClassList() {

    }

    @GetMapping("/classview")
    public void GETClassView() {

    }

    @GetMapping("/boardlist")
    public void GETBoardList() {

    }

    @GetMapping("/replyslist")
    public void GETReplyList() {

    }

    @GetMapping("/studyPlanList")
    public void GETStudyPlanList() {

    }

    @GetMapping("/studyPlanRegist")
    public void GETStudyPlanRegist() {

    }

    @GetMapping("/studyPlanView")
    public void GETStudyPlanView() {

    }

    @GetMapping("/studyPlanList")
    public void GETStudyPlanModify() {

    }

    @GetMapping("/gradeView")
    public void GETGradePlanView() {

    }

    @GetMapping("/gradeModify")
    public void GETGradeModify() {

    }
}
