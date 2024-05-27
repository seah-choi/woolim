package org.fullstack4.woolim.service.lecture;

import org.fullstack4.woolim.criteria.Criteria;

import org.fullstack4.woolim.dto.*;

import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.VideoDTO;


import java.util.List;

public interface LectureServiceIf {

    List<LectureDTO> getList(Criteria cri);
    List<LectureDTO> getListCategory(Criteria cri);
    List<VideoDTO> lectureVideo(int lecture_idx);

    int getLectureKeyword(Criteria cri);
    int getLectureKeywordCategory(Criteria cri);

    LectureDTO lectureView(int idx);

    PageResponseDTO<GradeDTO> gradeListByPage(PageRequestDTO pageRequestDTO);
}
