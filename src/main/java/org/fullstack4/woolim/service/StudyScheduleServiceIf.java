package org.fullstack4.woolim.service;

import org.fullstack4.woolim.domain.StudyScheduleVO;
import org.fullstack4.woolim.dto.StudyScheduleDTO;

import java.util.List;

public interface StudyScheduleServiceIf {
    int addEvent(StudyScheduleDTO studyScheduleDTO);
    List<StudyScheduleDTO> getList(int member_idx);
    int delete(int study_idx);
    int modify(StudyScheduleDTO studyScheduleDTO);
}
