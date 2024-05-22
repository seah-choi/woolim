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
    public void GETDelete() {

    }
}
