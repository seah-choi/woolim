package org.fullstack4.woolim.service.lecture;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.criteria.Criteria;
import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.mapper.LectureMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
public class LectureServiceImpl implements LectureServiceIf {
    @Autowired
    private LectureMapper lectureMapper;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<LectureDTO> getList(Criteria cri) {

        List<LectureDTO> list = lectureMapper.getList(cri).stream().map(vo->modelMapper.map(vo, LectureDTO.class)).collect(Collectors.toList());

        return list;

    }

    @Override
    public int getLectureKeyword(Criteria cri) {
        int total = lectureMapper.getLectureKeyword(cri);
        return total;
    }
}
