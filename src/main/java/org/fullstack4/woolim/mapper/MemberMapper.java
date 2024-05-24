package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.LectureVO;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface MemberMapper {
    int regist(MemberVO memberVO);
    MemberVO view(MemberDTO memberDTO);
    MemberVO memberView(String member_id);
    List<MemberVO> MemberListbyPage(PageRequestDTO requestDTO);
    int total_count(PageRequestDTO requestDTO);

    List<MemberVO> adminMemberList(PageRequestDTO requestDTO);
    List<LectureVO> LectureListbyTeacherpage(PageRequestDTO requestDTO);
    int LectureListCountByT(PageRequestDTO requestDTO);

    int admin_total_count(PageRequestDTO requestDTO);

    int changePoint(MemberVO memberVO);

    int deleteMemberList(Integer[] idxList);

    int adminDetail(MemberVO memberVO);
    int id_check(String member_id);
    int email_check(String member_id);
}
