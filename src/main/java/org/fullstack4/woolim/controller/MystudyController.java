package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.service.BbsServiceIf;
import org.fullstack4.woolim.service.MyStudyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j2
@Controller
@RequestMapping(value="/mystudy")
@RequiredArgsConstructor
public class MystudyController {
    private final MyStudyServiceIf myStudyService;

    @GetMapping("/classList")
    public void GETClassList(PageRequestDTO pageRequestDTO, Model model,HttpServletRequest req) {

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("member_id");
        pageRequestDTO.setMember_id(id);

        PageResponseDTO<LectureDTO> responseDTO = myStudyService.LectureListByPage(pageRequestDTO);
        log.info("responseDTO:{}",responseDTO);
        model.addAttribute("responseDTO", responseDTO);
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
    public void GETGradeList(PageRequestDTO pageRequestDTO, Model model,HttpServletRequest req) {

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("member_id");
        pageRequestDTO.setMember_id(id);

        PageResponseDTO<GradeDTO> bbsList = myStudyService.gradeListByPage(pageRequestDTO);
        model.addAttribute("bbsList", bbsList);

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
    public void GETcommentList(PageRequestDTO pageRequestDTO, Model model,HttpServletRequest req) {

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("member_id");
        pageRequestDTO.setMember_id(id);

        PageResponseDTO<BbsReplyDTO> bbsList = myStudyService.replyListByPage(pageRequestDTO);
        model.addAttribute("reply", bbsList);

    }
    @GetMapping("/getGrade")
    @ResponseBody
    public GradeDTO getGrade(@RequestParam(name = "grade_idx", defaultValue = "") int grade_idx) throws IOException {
        log.info("---------------------");
        log.info("MemberController => idCheck()");

        GradeDTO dto = myStudyService.getGrade(grade_idx);

        return dto;

    }
}
