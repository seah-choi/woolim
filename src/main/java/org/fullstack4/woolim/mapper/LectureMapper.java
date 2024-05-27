package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.criteria.Criteria;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.domain.GradeVO;
import org.fullstack4.woolim.domain.LectureVO;

import org.fullstack4.woolim.dto.PageRequestDTO;

import org.fullstack4.woolim.domain.VideoVO;
import org.fullstack4.woolim.dto.VideoDTO;


import java.util.List;

public interface LectureMapper {
    List<LectureVO> getList(Criteria cri);
    List<LectureVO> getListCategory(Criteria cri);
    List<VideoVO> lectureVideo(int lecture_idx);

    int getLectureKeyword(Criteria cri);
    int getLectureKeywordCategory(Criteria cri);

    LectureVO lectureView(int idx);

    List<GradeVO> gradeListByPage(PageRequestDTO pageRequestDTO);
    int grade_count(PageRequestDTO pageRequestDTO);
}