package org.fullstack4.wollim.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.lang.reflect.Member;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class YUNTEST {
    @Autowired(required = false)
    private MemberMapper memberMapper;
    @Test
    public void registTest(){
        for(int i=1;i<=5;i++) {
            MemberVO memberVO = MemberVO.builder()
                    .member_id("teacher"+i)
                    .member_pwd("1234")
                    .member_name("함창훈")
                    .member_email("함창훈"+i)
                    .member_email_addr("gmail.com")
                    .member_zonecode("01122")
                    .member_phone("01043734457")
                    .member_addr("서울시 중랑구 겸재로")
                    .member_addr_detail("2층")
                    .member_category("teacher")
                    .build();
            memberMapper.regist(memberVO);
        }
    }
    @Test
    public void registAdminTest(){
        MemberVO memberVO = MemberVO.builder()
                .member_id("admin")
                .member_pwd("1234")
                .member_name("관리자")
                .member_email("admin")
                .member_email_addr("gmail.com")
                .member_zonecode("01122")
                .member_phone("01043734457")
                .member_addr("서울시 중랑구 겸재로")
                .member_addr_detail("2층")
                .member_category("admin")
                .build();
        memberMapper.regist(memberVO);
    }
}
