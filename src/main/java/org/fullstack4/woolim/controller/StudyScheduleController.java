package org.fullstack4.woolim.controller;

import jdk.internal.event.Event;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.StudyScheduleDTO;
import org.fullstack4.woolim.service.StudyScheduleServiceIf;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Log4j2
@Controller
@RequestMapping(value="/events")
@RequiredArgsConstructor
public class StudyScheduleController {
    private final StudyScheduleServiceIf scheduleServiceIf;

    @PostMapping("/addEvent")
    @ResponseBody
    public int addEvent(@RequestParam(name = "study_content")String study_content,
                        @RequestParam(name = "start_date")String start_date,
                        @RequestParam(name = "end_date")String end_date
                        ){
        log.info("StudyScheduleController >> addEvent");
        StudyScheduleDTO scheduleDTO = StudyScheduleDTO.builder()
                .study_content(study_content)
                .start_date(LocalDate.parse(start_date))
                .end_date(LocalDate.parse(end_date)).build();
        int result = scheduleServiceIf.addEvent(scheduleDTO);
        log.info("result : "+ result);
        log.info("scheduleDTO :"+scheduleDTO);
        return result;
    }
}
