package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.criteria.Criteria;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.domain.ClassVO;
import org.fullstack4.woolim.domain.GradeVO;
import org.fullstack4.woolim.domain.LectureVO;
import org.fullstack4.woolim.dto.PageRequestDTO;

import java.util.List;

public interface LectureMapper {
    List<LectureVO> getList(Criteria cri);
    List<LectureVO> getListCategory(Criteria cri);

    int getLectureKeyword(Criteria cri);
    int getLectureKeywordCategory(Criteria cri);

    LectureVO lectureView(int idx);

    List<ClassVO> gradeListByPage(PageRequestDTO pageRequestDTO);
    int grade_count(PageRequestDTO pageRequestDTO);
    int modify(GradeVO gradeVO);
    int regist(GradeVO gradeVO);
    int delete(int grade_idx);
    ClassVO getGrade(int class_idx);
}