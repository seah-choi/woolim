package org.fullstack4.woolim.mapper;

import org.fullstack4.woolim.domain.StudyScheduleVO;

import java.util.List;

public interface StudyScheduleMapper {
    int addEvent(StudyScheduleVO studyScheduleVO);
    List<StudyScheduleVO> getList(int member_idx);
}
