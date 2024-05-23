package org.fullstack4.wollim.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.domain.QnaVO;
import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
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

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class YUNTEST {

    @Autowired
    private QnaServiceIf qnaServiceIf;

    @Autowired(required = false)
    private ModelMapper modelMapper;

    @Autowired(required = false)
    private QnaMapper qnaMapper;

    @Test
    public void qnaRegistTest(){
        for(int i=1;i<=110;i++){
            QnaDTO qnaDTO = QnaDTO.builder()
                    .member_id("test3")
                    .qna_title("qna 제목 "+i)
                    .qna_content("qna 내용 " + i).build();
            qnaServiceIf.regist(qnaDTO);
        }
    }

    @Test
    public void test(){
        PageRequestDTO pageRequestDTO = new PageRequestDTO();
        pageRequestDTO.setMember_id("test2");
        List<QnaVO> voList =qnaMapper.qnaListByPage(pageRequestDTO);
        log.info("voList" + voList);
        List<QnaDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo, QnaDTO.class)).collect(Collectors.toList());
        log.info("dtoList" + dtoList);

        int total_count = qnaMapper.total_count(pageRequestDTO);
        log.info("total_count" + total_count);
        PageResponseDTO<QnaDTO> responseDTO = PageResponseDTO.<QnaDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();

        log.info("responseDTO :" +responseDTO);

    }

}
