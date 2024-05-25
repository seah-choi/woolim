package org.fullstack4.woolim.service.lectureAdmin;

import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.MemberDTO;

import java.util.List;

public interface LectureAdminService {
    List<MemberDTO> getTeacherList();
    List<LectureDTO> getList();

    int insertLecture(LectureDTO dto);

}
