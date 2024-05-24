package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.StudyScheduleVO;
import org.fullstack4.woolim.dto.StudyScheduleDTO;
import org.fullstack4.woolim.mapper.StudyScheduleMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class StudyScheduleServiceImpl implements StudyScheduleServiceIf{
    private final StudyScheduleMapper studyScheduleMapper;
    private final ModelMapper modelMapper;
    @Override
    public int addEvent(StudyScheduleDTO studyScheduleDTO) {
        StudyScheduleVO studyScheduleVO = modelMapper.map(studyScheduleDTO, StudyScheduleVO.class);
        int result = studyScheduleMapper.addEvent(studyScheduleVO);
        log.info("studyScheduleVO : "+studyScheduleVO);
        log.info("studyScheduleDTO : "+studyScheduleDTO);
        return result;
    }
}
