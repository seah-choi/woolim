package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.MemberDTO;

@Mapper
public interface MemberMapper {
    int regist(MemberVO memberVO);
    MemberVO view(MemberDTO memberDTO);
}
