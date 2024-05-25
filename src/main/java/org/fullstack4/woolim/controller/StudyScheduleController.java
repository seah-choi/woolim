package org.fullstack4.woolim.controller;

import jdk.internal.event.Event;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.StudyScheduleDTO;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.fullstack4.woolim.service.StudyScheduleServiceIf;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;

@Log4j2
@Controller
@RequestMapping(value="/events")
@RequiredArgsConstructor
public class StudyScheduleController {
    private final StudyScheduleServiceIf scheduleServiceIf;
    private final MemberServiceIf memberServiceIf;

    @PostMapping("/addEvent")
    @ResponseBody
    public int addEvent(@RequestParam(name = "study_content")String study_content,
                        @RequestParam(name = "start_date")String start_date,
                        @RequestParam(name = "end_date")String end_date,
                        HttpServletRequest req
                        ){
        log.info("StudyScheduleController >> addEvent");
        HttpSession session = req.getSession();
        String member_id = (String)session.getAttribute("member_id");
        MemberDTO memberDTO = memberServiceIf.memberView(member_id);
        StudyScheduleDTO scheduleDTO = StudyScheduleDTO.builder()
                .member_idx(memberDTO.getMember_idx())
                .study_content(study_content)
                .start_date(LocalDate.parse(start_date))
                .end_date(LocalDate.parse(end_date)).build();
        int result = scheduleServiceIf.addEvent(scheduleDTO);
        log.info("result : "+ result);
        log.info("scheduleDTO :"+scheduleDTO);
        return result;
    }
    @GetMapping("/deleteEvent")
    @ResponseBody
    public int deleteEvent(@RequestParam(name = "study_idx")int study_idx,
                        HttpServletRequest req
    ){
        log.info("StudyScheduleController >> deleteEvent");
        int result = scheduleServiceIf.delete(study_idx);
        log.info("result : "+ result);
        return result;
    }
    @PostMapping("/modifyEvent")
    @ResponseBody
    public int modifyEvent(@RequestParam(name = "study_content")String study_content,
                           @RequestParam(name = "start_date")String start_date,
                           @RequestParam(name = "end_date")String end_date,
                           @RequestParam(name = "study_idx")int study_idx
    ){
        log.info("StudyScheduleController >> modifyEvent");
        StudyScheduleDTO scheduleDTO = StudyScheduleDTO.builder()
                .study_idx(study_idx)
                .study_content(study_content)
                .start_date(LocalDate.parse(start_date))
                .end_date(LocalDate.parse(end_date)).build();
        int result = scheduleServiceIf.modify(scheduleDTO);
        log.info("result : "+ result);
        return study_idx;
    }
}
