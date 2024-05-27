package org.fullstack4.woolim.service.lecture;

import org.fullstack4.woolim.criteria.Criteria;
<<<<<<< HEAD

=======
import org.fullstack4.woolim.domain.GradeVO;
>>>>>>> cc5d5a1ea4b4fa15ad45df0cf57fab061bbcebd8
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

    PageResponseDTO<ClassDTO> gradeListByPage(PageRequestDTO pageRequestDTO);
    int modify(GradeDTO gradeDTO);
    int regist(GradeDTO gradeDTO);
    int delete(int grade_idx);
}
