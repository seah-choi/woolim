package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.service.BbsServiceIf;
import org.fullstack4.woolim.service.MyStudyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Log4j2
@Controller
@RequestMapping(value="/mystudy")
@RequiredArgsConstructor
public class MystudyController {
    private final MyStudyServiceIf myStudyService;

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
    public void GETfreeList(@RequestParam(defaultValue = "") String bbs_type,
                            PageRequestDTO pageRequestDTO,
                            Model model, HttpServletRequest req) {
        log.info("============================");
        log.info("BoardController >> GETList() START");

        pageRequestDTO.setBbs_type(bbs_type);
        log.info("bbs_type" + bbs_type);

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("member_id");
        pageRequestDTO.setMember_id(id);

        PageResponseDTO<BbsDTO> bbsList = myStudyService.bbsListByPage(pageRequestDTO);

        model.addAttribute("bbsList", bbsList);
        model.addAttribute("bbs_type",bbs_type);

        if(bbsList.getSearch_types()!=null){
            model.addAttribute("search_type", bbsList.getSearch_types()[0]);
        }

        log.info("GETfreeList >> member_id :"+id);

        log.info("bbsList : " + bbsList);

        log.info("BoardController >> GETList() END");
        log.info("============================");
    }

    @GetMapping("/commentList")
    public void GETcommentList() {

    }
}
