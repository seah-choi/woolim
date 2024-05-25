package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.CartVO;
import org.fullstack4.woolim.domain.StudyScheduleVO;
import org.fullstack4.woolim.dto.CartDTO;
import org.fullstack4.woolim.dto.StudyScheduleDTO;
import org.fullstack4.woolim.mapper.StudyScheduleMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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
        return studyScheduleVO.getStudy_idx();
    }

    @Override
    public List<StudyScheduleDTO> getList(int member_idx) {
        List<StudyScheduleVO> voList = studyScheduleMapper.getList(member_idx);
        List<StudyScheduleDTO> dtolist = voList.stream().map(vo -> modelMapper.map(vo, StudyScheduleDTO.class)).collect(Collectors.toList());

        return dtolist;
    }

    @Override
    public int delete(int study_idx) {
        return studyScheduleMapper.delete(study_idx);
    }

    @Override
    public int modify(StudyScheduleDTO studyScheduleDTO) {
        StudyScheduleVO studyScheduleVO = modelMapper.map(studyScheduleDTO, StudyScheduleVO.class);
        return studyScheduleMapper.modify(studyScheduleVO);

    }

}
