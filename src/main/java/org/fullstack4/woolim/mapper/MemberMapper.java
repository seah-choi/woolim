package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.MemberVO;

@Mapper
public interface MemberMapper {
    int regist(MemberVO memberVO);
}
