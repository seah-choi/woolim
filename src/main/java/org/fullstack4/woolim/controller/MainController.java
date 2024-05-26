package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.criteria.Criteria;
import org.fullstack4.woolim.criteria.PageMakerDTO;
import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.fullstack4.woolim.service.lecture.LectureServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
public class MainController {
    private final LectureServiceIf lectureService;
    private final MemberServiceIf memberService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model, Criteria cri, @RequestParam (defaultValue="1")String sorting, PageRequestDTO pageRequestDTO, @RequestParam(defaultValue = "9") int page_size
                        , @RequestParam(defaultValue = "s01") String search_word) {
        System.out.println("#####");
        log.info("-----------------------");
        log.info("-----LectureController-----" +"-> GETList() ");

        if(cri.getViewSorting() != null) {
            cri.setAmount(Integer.parseInt(cri.getViewSorting()));
        }
        log.info("----category---" + cri.getCategory());
        List<LectureDTO> lectureDTOS = null;
        int total = 0;
        if(cri.getCategory() != null && cri.getCategory() != ""){
            lectureDTOS  = lectureService.getListCategory(cri);
            total = lectureService.getLectureKeywordCategory(cri);
        } else{
            lectureDTOS =  lectureService.getList(cri);
            total = lectureService.getLectureKeyword(cri);
        }

        String member_type = "teacher";
        pageRequestDTO.setPage_size(page_size);
        pageRequestDTO.setMember_type(member_type);
        pageRequestDTO.setSearch_word(search_word);
        pageRequestDTO.setSearch_type("u");
        log.info(pageRequestDTO);

        PageResponseDTO<MemberDTO> responseDTO = memberService.MemberList(pageRequestDTO);

        log.info(responseDTO);
        model.addAttribute("responseDTO", responseDTO);


        PageMakerDTO pageMakerDTO = new PageMakerDTO(cri,total);

        /*log.info("---lectureDTOS-------" + lectureDTOS);*/

        model.addAttribute("list",lectureDTOS);
        model.addAttribute("pageMaker",pageMakerDTO);
        model.addAttribute("cri",cri);

        return "home";
    }
}
