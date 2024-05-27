package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.criteria.Criteria;
import org.fullstack4.woolim.domain.*;

import org.fullstack4.woolim.dto.PageRequestDTO;

import org.fullstack4.woolim.dto.VideoDTO;


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
    int delete(String[] grade_idx);

    ClassVO getGrade(int class_idx);

    List<VideoVO> lectureVideo(int lecture_idx);

    OrderDetailVO lectureStatus(int lecture_idx , String member_id);
}