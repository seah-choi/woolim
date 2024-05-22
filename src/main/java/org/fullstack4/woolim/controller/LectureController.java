package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.service.lecture.LectureServiceIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/lecture")
public class LectureController {
    @Autowired
    private LectureServiceIf lectureServiceIf;
    @GetMapping("/list")
    public String GETList(Model model) {
        System.out.println("#####");
        log.info("-----------------------");
        log.info("-----LectureController-----" +"-> GETList() ");
        List<LectureDTO> lectureDTOS =  lectureServiceIf.getList();

        log.info("---lectureDTOS-------" + lectureDTOS);
        log.info("-----------------------");

        return "/lecture/list";
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
