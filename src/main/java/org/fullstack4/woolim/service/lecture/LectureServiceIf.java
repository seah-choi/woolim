package org.fullstack4.woolim.service.lecture;

import org.fullstack4.woolim.criteria.Criteria;
import org.fullstack4.woolim.dto.*;

import java.util.List;

public interface LectureServiceIf {

    List<LectureDTO> getList(Criteria cri);
    List<LectureDTO> getListCategory(Criteria cri);

    int getLectureKeyword(Criteria cri);
    int getLectureKeywordCategory(Criteria cri);

    LectureDTO lectureView(int idx);

    PageResponseDTO<ClassDTO> gradeListByPage(PageRequestDTO pageRequestDTO);
}
