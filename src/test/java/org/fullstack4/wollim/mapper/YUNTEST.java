package org.fullstack4.wollim.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.MemberDTO;
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
        String[] arr = new String[]{"류림","전주연","강윤화","장지현","김지원"};
        for(int i=5;i<10;i++) {
            MemberVO memberVO = MemberVO.builder()

                    .member_id("sunghoon"+i)
                    .member_pwd("1234")
                    .member_name("정성훈")
                    .member_email("sunghoon"+i)

                    .member_id("test"+i)
                    .member_pwd("1234")
                    .member_name(arr[i-5])
                    .member_email("seah"+i)

                    .member_email_addr("gmail.com")
                    .member_zonecode("01122")
                    .member_phone("01043734457")
                    .member_addr("서울시 중랑구 겸재로")
                    .member_addr_detail("2층")
                    .member_category("student")
                    .build();
            memberMapper.regist(memberVO);
            MemberVO memberVO1 = memberMapper.memberView(memberVO.getMember_id());
            memberMapper.detailInsert(memberVO1);
        }
    }
    @Test
    public void registAdminTest(){
        for(int i=1;i<=5;i++) {
            MemberVO memberVO = MemberVO.builder()
                    .member_id("admin"+i)
                    .member_pwd("1234")
                    .member_name("관리자"+i)
                    .member_email("admin"+i)
                    .member_email_addr("gmail.com")
                    .member_zonecode("01122")
                    .member_phone("01043734457")
                    .member_addr("서울시 중랑구 겸재로")
                    .member_addr_detail("2층")
                    .member_category("admin")
                    .build();
            memberMapper.regist(memberVO);
            memberMapper.detailInsert(memberVO);
        }
    }
}
