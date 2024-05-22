package org.fullstack4.wollim.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class HyunbeenTest {

    @Autowired(required = false)
    private MemberMapper memberMapper;

    @Test
    public void HyunbeenTest() {

    }
}
