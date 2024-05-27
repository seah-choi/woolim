package org.fullstack4.woolim.service.lecture;

import org.fullstack4.woolim.criteria.Criteria;

import org.fullstack4.woolim.domain.ClassVO;





import org.fullstack4.woolim.domain.GradeVO;

import org.fullstack4.woolim.dto.*;

import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.VideoDTO;


import java.util.List;

public interface LectureServiceIf {

    List<LectureDTO> getList(Criteria cri);
    List<LectureDTO> getListCategory(Criteria cri);

    int getLectureKeyword(Criteria cri);
    int getLectureKeywordCategory(Criteria cri);

    LectureDTO lectureView(int idx);

    PageResponseDTO<ClassDTO> gradeListByPage(PageRequestDTO pageRequestDTO);
    int modify(GradeDTO gradeDTO);
    int regist(GradeDTO gradeDTO);
    int delete(int grade_idx);

    ClassDTO getGrade(int class_idx);

    List<VideoDTO> lectureVideo(int lecture_idx);

    OrderDetailDTO lectureStatus(int lecture_idx, String member_id);
}
