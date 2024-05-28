package org.fullstack4.woolim.service;

import com.google.gson.JsonObject;
import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.*;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

public interface MemberServiceIf {
    boolean login(String id, String pwd, HttpServletRequest req) throws InsufficientStockException;
    PageResponseDTO<MemberDTO> MemberList(PageRequestDTO requestDTO);
    int regist(MemberDTO memberDTO);
    MemberDTO google(String member_oauth);
    MemberDTO memberView(String member_id);
    int google_modify(MemberDTO memberDTO);

    PageResponseDTO<MemberDTO> adminMemberList(PageRequestDTO pageRequestDTO);
    PageResponseDTO<LectureDTO> LectureListbyTeacherpage(PageRequestDTO pageRequestDTO);
    int deleteMemberList(Integer[] idxList);
    int leave(String member_id);
    int adminDetail(MemberDTO memberDTO);
    int id_check(String member_id);
    int email_check(String member_id);
    int modify(MemberDTO memberDTO);
    MemberDTO socialLogin(JSONObject member_info) throws IOException;
    TeacherSubjectDTO teacherIntroView(String member_id);
    int teacherIntroUpdate(TeacherSubjectDTO teacherSubjectDTO);
    int detailInsert(MemberDTO memberDTO);
}
