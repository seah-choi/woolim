package org.fullstack4.woolim.service;

import org.fullstack4.woolim.domain.StudyScheduleVO;
import org.fullstack4.woolim.dto.StudyScheduleDTO;

public interface StudyScheduleServiceIf {
    int addEvent(StudyScheduleDTO studyScheduleDTO);
}
