package org.fullstack4.woolim.service;

import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface MemberServiceIf {
    boolean login(String id, String pwd, HttpServletRequest req) throws InsufficientStockException;
    PageResponseDTO<MemberDTO> MemberList(PageRequestDTO requestDTO);
    int regist(MemberDTO memberDTO);
    MemberDTO memberView(String member_id);

    PageResponseDTO<MemberDTO> adminMemberList(PageRequestDTO pageRequestDTO);

    int deleteMemberList(Integer[] idxList);

    int adminDetail(MemberDTO memberDTO);
    int id_check(String member_id);
    int email_check(String member_id);
}
