package org.fullstack4.woolim.service.lecture;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.criteria.Criteria;
import org.fullstack4.woolim.domain.*;

import org.fullstack4.woolim.dto.*;

import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.VideoDTO;

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
        log.info("-----" + cri);
        List<LectureDTO> list = lectureMapper.getList(cri).stream().map(vo->modelMapper.map(vo, LectureDTO.class)).collect(Collectors.toList());

        return list;

    }

    @Override
    public int getLectureKeyword(Criteria cri) {
        int total = lectureMapper.getLectureKeyword(cri);
        return total;
    }

    @Override
    public List<LectureDTO> getListCategory(Criteria cri) {
        log.info("-----" + cri);
        List<LectureDTO> list = lectureMapper.getListCategory(cri).stream().map(vo->modelMapper.map(vo, LectureDTO.class)).collect(Collectors.toList());

        return list;
    }
    @Override
    public int getLectureKeywordCategory(Criteria cri) {
        int total = lectureMapper.getLectureKeywordCategory(cri);
        return total;
    }

    @Override
    public LectureDTO lectureView(int idx) {
        LectureVO lectureVO = lectureMapper.lectureView(idx);
        LectureDTO lectureDTO = modelMapper.map(lectureVO, LectureDTO.class);

        return lectureDTO;
    }

    @Override
    public PageResponseDTO<ClassDTO> gradeListByPage(PageRequestDTO pageRequestDTO) {
        List<ClassVO> voList =lectureMapper.gradeListByPage(pageRequestDTO);
        log.info("voList" + voList);
        List<ClassDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo, ClassDTO.class)).collect(Collectors.toList());
        log.info("dtoList" + dtoList);

        int total_count = lectureMapper.grade_count(pageRequestDTO);
        log.info("total_count" + total_count);

        PageResponseDTO<ClassDTO> responseDTO = PageResponseDTO.<ClassDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();

        log.info("responseDTO :" +responseDTO);
        return responseDTO;
    }

    @Override
    public int modify(GradeDTO gradeDTO) {
        GradeVO vo = modelMapper.map(gradeDTO, GradeVO.class);
        int result = lectureMapper.modify(vo);
        return result;
    }

    @Override
    public int regist(GradeDTO gradeDTO) {
        GradeVO vo = modelMapper.map(gradeDTO, GradeVO.class);
        int result = lectureMapper.modify(vo);
        return result;
    }

    @Override
    public int delete(String[] grade_idx) {
        return lectureMapper.delete(grade_idx);
    }


    @Override
    public ClassDTO getGrade(int class_idx) {
        ClassVO vo = lectureMapper.getGrade(class_idx);
        ClassDTO dto = modelMapper.map(vo, ClassDTO.class);
        return dto;
    }

    @Override
    public List<VideoDTO> lectureVideo(int lecture_idx) {
        List<VideoDTO> list = lectureMapper.lectureVideo(lecture_idx).stream().map(vo->modelMapper.map(vo, VideoDTO.class)).collect(Collectors.toList());

        return list;

    }

    @Override
    public OrderDetailDTO lectureStatus(int lecture_idx, String member_id) {
        OrderDetailVO vo = lectureMapper.lectureStatus(lecture_idx,member_id);
        OrderDetailDTO dto = modelMapper.map(vo, OrderDetailDTO.class);
        return dto;
    }
}


