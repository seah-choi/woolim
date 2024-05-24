package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.service.BbsServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.stream.Stream;

@Log4j2
@Controller
@RequestMapping(value="/admin/board")
@RequiredArgsConstructor
public class AdminBoardController {

    private final BbsServiceIf bbsServiceIf;


    @GetMapping("/list")
    public void GETList(@RequestParam(defaultValue = "") String bbs_type,
                        PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("AdminBoardController >> GETList() START");

        pageRequestDTO.setBbs_type(bbs_type);
        pageRequestDTO.setBbs_teacher_yn("N");
        log.info("bbs_type" + bbs_type);

        PageResponseDTO<BbsDTO> bbsList = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("bbsList", bbsList);

        log.info("bbsList : " + bbsList);

        log.info("AdminBoardController >> GETList() END");
        log.info("============================");
    }

    @GetMapping("/regist")
    public void GETRegist() {

    }

    @GetMapping("/view")
    public void GETView() {

    }

    @GetMapping("/modify")
    public void GETModify() {

    }

    @GetMapping("/delete")
    public String GETDelete(@RequestParam(name="bbs_idx", required=false) String idxList) {
        String[] arrIdx = idxList.split(",");
        Integer[] newArr = Stream.of(arrIdx).mapToInt(Integer::parseInt).boxed().toArray(Integer[]::new);
        bbsServiceIf.deleteList(newArr);

        log.info("idxList : " + idxList);
        return "redirect:/admin/board/list";
    }
}
