package org.fullstack4.wollim.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.domain.QnaVO;
import org.fullstack4.woolim.domain.ReviewVO;
import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.fullstack4.woolim.mapper.QnaMapper;
import org.fullstack4.woolim.mapper.ReviewMapper;
import org.fullstack4.woolim.service.BbsServiceIf;
import org.fullstack4.woolim.service.QnaServiceIf;
import org.fullstack4.woolim.service.ReviewServiceIf;
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
    private ReviewServiceIf reviewServiceIf;

    @Autowired
    private QnaServiceIf qnaServiceIf;
    @Autowired
    private BbsServiceIf bbsServiceIf;

    @Autowired(required = false)
    private ModelMapper modelMapper;

    @Autowired(required = false)
    private QnaMapper qnaMapper;
    @Autowired(required = false)
    private ReviewMapper reviewMapper;

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
    public void reviewRegistTest(){
        for(int i=1;i<=110;i++){
            ReviewDTO reviewDTO = ReviewDTO.builder()
                    .lecture_idx(1)
                    .review_comment("추천합니다.")
                    .member_id("test4")
                    .review_rank(4)
                    .build();
            reviewServiceIf.regist(reviewDTO);
        }
    }
    @Test
    public void reviewPageTest(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .lecture_idx(1)
                .build();
        int total_count = reviewMapper.total_count(pageRequestDTO);
        List<ReviewVO> voList =reviewMapper.list(pageRequestDTO);
        log.info("voList" + voList);
        List<ReviewDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo, ReviewDTO.class)).collect(Collectors.toList());
        log.info("dtoList" + dtoList);
        PageResponseDTO<ReviewDTO> responseDTO = PageResponseDTO.<ReviewDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList).build();
        log.info(responseDTO);
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
    @Test
    public void noticeRegist(){
        for(int i=2020;i<=2023;i++){
            for(int j=1;j<=12;j++) {
                BbsDTO bbsDTO = BbsDTO.builder()
                        .bbs_title(i + "년 "+j+"월 한중 인물 비교사 수업 자료 입니다.")
                        .bbs_content("<p>"+i+"년 "+j+"월 강좌 수업 자료 입니다<br></p>")
                        .member_id("sunghoon4")
                        .bbs_category_code("bbs05")
                        .bbs_read_cnt(0)
                        .bbs_reply_cnt(0)
                        .bbs_teacher_yn("Y")
                        .lecture_idx(1)
                        .build();
                int result = bbsServiceIf.InsertLectureBbs(bbsDTO);

                log.info(result);
            }
        }

    }
    @Test
    public void noticeRegist2(){
        for(int j=1;j<=5;j++) {
            BbsDTO bbsDTO = BbsDTO.builder()
                    .bbs_title("2024년 "+j+"월 한중 인물 비교사 수업 자료 입니다.")
                    .bbs_content("<p>2024년 "+j+"월 강좌 수업 자료 입니다<br></p>")
                    .member_id("sunghoon4")
                    .bbs_category_code("bbs05")
                    .bbs_read_cnt(0)
                    .bbs_reply_cnt(0)
                    .bbs_teacher_yn("Y")
                    .lecture_idx(1)
                    .build();
            int result = bbsServiceIf.InsertLectureBbs(bbsDTO);

            log.info(result);
        }
    }

}
