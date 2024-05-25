package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.CommonUtil;
import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.domain.LectureVO;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
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
    public MemberDTO socialLogin(HttpServletRequest request) throws IOException {
        MemberDTO memberDTO = null;
        String code = CommonUtil.parseString(request.getParameter("scope"));
        log.info(code);

        String parameters = "code=" + code +
                "&client_id=407108558562-l8kdc02drjtq9qe6id97a5bm4gfubfvb.apps.googleusercontent.com" +
                "&client_secret=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" +
                "&redirect_uri=http://localhost:8080/login/google" +
                "&grant_type=authorization_code";

        URL url = new URL("https://oauth2.googleapis.com/token");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        try (OutputStream os = conn.getOutputStream()) {
            os.write(parameters.getBytes(StandardCharsets.UTF_8));
        }

        StringBuilder response = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line.trim());
            }
        }

        JSONObject jsonObject = new JSONObject(response.toString());

        URL url2 = new URL("https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + jsonObject.getString("access_token"));
        HttpURLConnection conn2 = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        StringBuilder response2 = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line.trim());
            }
        }
        log.info(new JSONObject(response2.toString()));

        return memberDTO;
    }
}
