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

    @GetMapping("/classList")
    public void GETClassList() {

    }

    @GetMapping("/classView")
    public void GETClassView() {

    }

    @GetMapping("/boardList")
    public void GETBoardList() {

    }

    @GetMapping("/replyList")
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

    @GetMapping("/studyPlanModify")
    public void GETStudyPlanModify() {

    }

    @GetMapping("/gradeList")
    public void GETGradeList() {

    }

    @GetMapping("/gradeView")
    public void GETGradePlanView() {

    }

    @GetMapping("/gradeModify")
    public void GETGradeModify() {

    }

    @GetMapping("/freeList")
    public void GETfreeList() {

    }

    @GetMapping("/commentList")
    public void GETcommentList() {

    }
}
