package org.fullstack4.woolim.service.lectureAdmin;

import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.VideoDTO;

import java.util.List;

public interface LectureAdminService {
    List<MemberDTO> getTeacherList();
    List<LectureDTO> getList();

    int insertLecture(LectureDTO dto);

    int deleteLecture(int lecture_idx);
    int deleteLectureImage(int lecture_idx);

    int modifyLectureFile(LectureDTO dto);
    int modifyLecture(LectureDTO dto);

    int addVideo(VideoDTO dto);
}
