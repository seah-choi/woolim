package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;


@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf{

    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;

    @Override
    @Transactional(rollbackFor = {InsufficientStockException.class, Exception.class})
    public boolean login(String id, String pwd, HttpServletRequest req) throws InsufficientStockException {
        HttpSession session = req.getSession();
        MemberDTO memberDTO = MemberDTO.builder()
                .member_id(id)
                .member_pwd(pwd)
                .build();
        MemberVO vo = memberMapper.view(memberDTO);

        if(id.equals("") || id == null){
            throw new InsufficientStockException("아이디를 입력하세요.");
        }
        if(pwd.equals("") || pwd == null){
            throw new InsufficientStockException("비밀번호를 입력하세요.");
        }
        if(vo == null) {
            throw new InsufficientStockException("해당하는 정보가 없습니다.");
        }

        if (vo.getMember_pwd().equals(memberDTO.getMember_pwd())) {
            session.setAttribute("user_id", vo.getMember_id());
            session.setAttribute("user_name", vo.getMember_name());
            return true;
        }else
        {
            return false;
        }

    }

    @Override
    public PageResponseDTO<MemberDTO> MemberList(PageRequestDTO pageRequestDTO) {
        List<MemberVO> voList = memberMapper.MemberListbyPage(pageRequestDTO);
        List<MemberDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo,MemberDTO.class)).collect(Collectors.toList());
        int total_count = memberMapper.total_count(pageRequestDTO);
        PageResponseDTO<MemberDTO> responseDTO = PageResponseDTO.<MemberDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();


        return responseDTO;
    }
    @Override
    public int regist(MemberDTO memberDTO) {

        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        log.info(memberVO);
        int result = memberMapper.regist(memberVO);
        return result;
    }

    @Override
    public MemberDTO memberView(String member_id) {
        MemberVO memberVO = memberMapper.memberView(member_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        return memberDTO;
    }
}
