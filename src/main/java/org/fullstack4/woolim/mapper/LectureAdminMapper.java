package org.fullstack4.woolim.mapper;

import org.fullstack4.woolim.domain.LectureVO;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.LectureDTO;

import java.util.List;

public interface LectureAdminMapper {
    List<MemberVO> getTeacherList();
    List<LectureVO> getList();

    int insertLecture(LectureDTO dto);

    int deleteLecture(int lecture_idx);

    int deleteLectureImage(int lecture_idx);

    int modifyLectureFile(LectureDTO dto);

    int modifyLecture(LectureDTO dto);
}
