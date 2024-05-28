package org.fullstack4.woolim.service;

import com.google.gson.JsonObject;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.CommonUtil;
import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.domain.LectureVO;
import org.fullstack4.woolim.domain.MemberVO;

import org.fullstack4.woolim.domain.TeacherSubjectVO;


import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.mapper.MemberMapper;

import org.json.simple.parser.JSONParser;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.json.JSONObject;
import com.google.gson.JsonObject;

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
    public MemberDTO google(String member_oauth) {
        MemberVO memberVO = memberMapper.google(member_oauth);
        log.info(memberVO);
        if(memberVO != null) {
            MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
            return memberDTO;
        }
        return null;

    }

    @Override
    public MemberDTO memberView(String member_id) {
        MemberVO memberVO = memberMapper.memberView(member_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        return memberDTO;
    }

    @Override
    public int google_modify(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        return memberMapper.google_modify(memberVO);
    }

    @Override
    public MemberDTO teahcerview(int member_idx) {
        MemberVO memberVO = memberMapper.teahcerview(member_idx);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        return memberDTO;
    }

    @Override
    public PageResponseDTO<MemberDTO> adminMemberList(PageRequestDTO pageRequestDTO) {
        List<MemberVO> voList = memberMapper.adminMemberList(pageRequestDTO);
        List<MemberDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo,MemberDTO.class)).collect(Collectors.toList());
        int total_count = memberMapper.admin_total_count(pageRequestDTO);
        PageResponseDTO<MemberDTO> responseDTO = PageResponseDTO.<MemberDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();

        return responseDTO;
    }

    @Override
    public PageResponseDTO<LectureDTO> LectureListbyTeacherpage(PageRequestDTO pageRequestDTO) {
        List<LectureVO> voList = memberMapper.LectureListbyTeacherpage(pageRequestDTO);
        List<LectureDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo,LectureDTO.class)).collect(Collectors.toList());
        int total_count = memberMapper.LectureListCountByT(pageRequestDTO);

        PageResponseDTO<LectureDTO> responseDTO = PageResponseDTO.<LectureDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();

        return responseDTO;
    }

    @Override
    public int deleteMemberList(Integer[] idxList) {
        int result = memberMapper.deleteMemberList(idxList);
        log.info("MemberServiceImpl >> deleteMemberList : " + idxList);
        return result;
    }

    @Override
    public int leave(String member_id) {
        return memberMapper.leave(member_id);
    }

    @Override
    public int adminDetail(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.adminDetail(memberVO);

        log.info("MemberServiceImpl >> memberVO : " + memberVO.toString());
        log.info("MemberServiceImpl >> adminDetail : " + result);
        return result;
    }

    @Override
    public int id_check(String member_id) {
        return memberMapper.id_check(member_id);
    }

    @Override
    public int email_check(String member_id) {
        return memberMapper.email_check(member_id);
    }

    @Override
    public int modify(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.modify(memberVO);
        return result;
    }

    @Override
    public MemberDTO socialLogin(JSONObject member_info) throws IOException {


        String name = member_info.getString("name");
        String id = member_info.getString("id");
        boolean verifiedEmail = member_info.getBoolean("verified_email");
        String givenName = member_info.getString("given_name");
        String locale = member_info.getString("locale");
        String familyName = member_info.getString("family_name");
        String email = member_info.getString("email");
        String picture = member_info.getString("picture");
        log.info(email);

        MemberDTO memberDTO = google(id);

        if(memberDTO!= null){
            return memberDTO;
        }
        else{
            MemberDTO newDTO = MemberDTO.builder()
                    .member_id(email.split("@")[0])
                    .member_name(name)
                    .member_oauth(id)
                    .member_email(email.split("@")[0])
                    .member_email_addr(email.split("@")[1])
                    .build();

            log.info(email.split("@")[0]);
            log.info(email.split("@")[1]);
            log.info("newDTO : " + newDTO);

            return newDTO;
        }
    }

    @Override

    public TeacherSubjectDTO teacherIntroView(String member_id) {
        TeacherSubjectVO teacherSubjectVO = memberMapper.teacherIntroView(member_id);
        if (teacherSubjectVO == null) {
            log.warn("No data found for member_id: {}", member_id);
            return null;
        }
        TeacherSubjectDTO teacherSubjectDTO = modelMapper.map(teacherSubjectVO, TeacherSubjectDTO.class);
        return teacherSubjectDTO;
    }

    @Override
    public int teacherIntroUpdate(TeacherSubjectDTO teacherSubjectDTO) {
        TeacherSubjectVO teacherSubjectVO = modelMapper.map(teacherSubjectDTO, TeacherSubjectVO.class);
        int result = memberMapper.teacherIntroUpdate(teacherSubjectVO);

        return result;
    }

    @Override
    public int detailInsert(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.detailInsert(memberVO);
        return result;
    }

    @Override
    public MemberDTO adminMemberView(String member_id) {
        MemberVO memberVO = memberMapper.adminMemberView(member_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        return memberDTO;
    }
    public int countTeacherSubject(int member_idx) {
        int count = memberMapper.countTeacherSubject(member_idx);
        return count;

    }


}
