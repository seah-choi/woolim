package org.fullstack4.woolim.mapper;

import org.fullstack4.woolim.domain.LectureVO;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.LectureDTO;

import java.util.List;

public interface LectureAdminMapper {
    List<MemberVO> getTeacherList();
    List<LectureVO> getList();

    int insertLecture(LectureDTO dto);
}
