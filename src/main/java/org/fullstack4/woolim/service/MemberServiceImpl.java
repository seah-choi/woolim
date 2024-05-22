package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.springframework.stereotype.Service;


@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf{

    private final MemberMapper memberMapper;

    @Override
    public boolean login(MemberDTO memberDTO) {
        String id = memberDTO.getMember_id();
        MemberVO vo = memberMapper.view(memberDTO);
        log.info("memberVO :{}" , vo);
        if(vo.getMember_pwd().equals(memberDTO.getMember_pwd())){
            return true;
        }else {
            return false;
        }
    }
}
