package org.fullstack4.woolim.service.lectureAdmin;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.mapper.LectureAdminMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
public class LectureAdminServiceImpl implements LectureAdminService{
    @Autowired
    private LectureAdminMapper lectureAdminMapper;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<MemberDTO> getTeacherList() {
        List<MemberDTO> list = lectureAdminMapper.getTeacherList().stream().map(vo->modelMapper.map(vo,MemberDTO.class)).collect(Collectors.toList());


        return list;
    }
}
