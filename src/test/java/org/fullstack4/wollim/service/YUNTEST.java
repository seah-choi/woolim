package org.fullstack4.wollim.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.QnaDTO;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.fullstack4.woolim.mapper.QnaMapper;
import org.fullstack4.woolim.service.QnaServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class YUNTEST {

    @Autowired
    private QnaServiceIf qnaServiceIf;

    @Test
    public void qnaRegistTest(){
        for(int i=1;i<=110;i++){
            QnaDTO qnaDTO = QnaDTO.builder()
                    .member_id("test2")
                    .qna_title("qna 제목 "+i)
                    .qna_content("qna 내용 " + i).build();
            qnaServiceIf.regist(qnaDTO);
        }
    }
}
