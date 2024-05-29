package org.fullstack4.wollim.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.*;
import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.mapper.CartMapper;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.fullstack4.woolim.mapper.MyStudyMapper;
import org.fullstack4.woolim.mapper.OrderMapper;
import org.fullstack4.woolim.service.OrderServiceIf;
import org.fullstack4.woolim.service.PaymentServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class HyunbeenTest {

    @Autowired(required = false)
    private MemberMapper memberMapper;

    @Autowired(required = false)
    private CartMapper cartMapper;

    @Autowired(required = false)
    private ModelMapper modelMapper;

    @Autowired(required = false)
    private OrderMapper orderMapper;

    @Autowired(required = false)
    private MyStudyMapper myStudyMapper;
    @Autowired(required = false)
    private OrderServiceIf orderService;
    @Autowired(required = false)
    private PaymentServiceIf paymentService;


    @Test
    public void HyunbeenTest() {
        String member_type = "teacher";
        PageRequestDTO pageRequestDTO = new PageRequestDTO();
        pageRequestDTO.setPage(1);
        pageRequestDTO.setPage_size(10);
        pageRequestDTO.setMember_type(member_type);
        List<MemberVO> voList = memberMapper.MemberListbyPage(pageRequestDTO);
        log.info(voList);
        List<MemberDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo,MemberDTO.class)).collect(Collectors.toList());
        int total_count = memberMapper.total_count(pageRequestDTO);
        PageResponseDTO<MemberDTO> responseDTO = PageResponseDTO.<MemberDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();
        log.info("responseDTO :" +responseDTO);
    }

    @Test
    public void CartTest(){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int price = 1000000;
        String payment_num = "";
        String member_id= "seah1";
        String payment_type = "충전";
        String payment_title = "포인트 충전";

        MemberDTO memberDTO = MemberDTO.builder()
                .member_id(member_id)
                .member_point(price)
                .build();

        PaymentDTO paymentDTO = PaymentDTO.builder()
                .payment_num(payment_num)
                .payment_type(payment_type)
                .payment_title(payment_title)
                .price(price)
                .member_id(member_id)
                .build();

        int result1=orderService.PointCharge(memberDTO);
        int result = paymentService.InsertPayment(paymentDTO);



    }
}
