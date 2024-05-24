package org.fullstack4.woolim.controller;

import jdk.internal.event.Event;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.StudyScheduleDTO;
import org.fullstack4.woolim.service.StudyScheduleServiceIf;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Log4j2
@Controller
@RequestMapping(value="/events")
@RequiredArgsConstructor
public class StudyScheduleController {
    private final StudyScheduleServiceIf scheduleServiceIf;

    @PostMapping("/addEvent")
    @ResponseBody
    public String addEvent(@RequestBody StudyScheduleDTO scheduleDTO) {
        int result = scheduleServiceIf.addEvent(scheduleDTO);
        log.info("result : "+ result);
        log.info("scheduleDTO :"+scheduleDTO);
        return "redirect:/mystudy/studyPlanList";
    }
}
