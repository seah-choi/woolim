package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.LectureVO;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.domain.TeacherSubjectVO;
import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;


import java.util.List;

@Mapper
public interface MemberMapper {
    int regist(MemberVO memberVO);
    MemberVO view(MemberDTO memberDTO);
    MemberVO memberView(String member_id);
    MemberVO google(String member_oauth);
    int google_modify(MemberVO memberVO);
    List<MemberVO> MemberListbyPage(PageRequestDTO requestDTO);
    int total_count(PageRequestDTO requestDTO);
    int leave(String member_id);
    List<MemberVO> adminMemberList(PageRequestDTO requestDTO);
    List<LectureVO> LectureListbyTeacherpage(PageRequestDTO requestDTO);
    int LectureListCountByT(PageRequestDTO requestDTO);

    int admin_total_count(PageRequestDTO requestDTO);

    int changePoint(MemberVO memberVO);

    int deleteMemberList(Integer[] idxList);

    int adminDetail(MemberVO memberVO);
    int id_check(String member_id);
    int email_check(String member_id);

    int modify(MemberVO memberVO);
    TeacherSubjectVO teacherIntroView(String member_id);
    int teacherIntroUpdate(TeacherSubjectVO teacherSubjectVO);

    int detailInsert(MemberVO memberVO);
    MemberVO adminMemberView(String member_id);
}
