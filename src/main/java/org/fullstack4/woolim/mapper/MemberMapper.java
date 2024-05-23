package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.MemberVO;
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
}
