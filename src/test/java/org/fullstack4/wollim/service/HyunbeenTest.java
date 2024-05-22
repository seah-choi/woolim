package org.fullstack4.wollim.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.MemberVO;
import org.fullstack4.woolim.dto.MemberDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.mapper.MemberMapper;
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
public class HyunbeenTest {

    @Autowired(required = false)
    private MemberMapper memberMapper;

    @Autowired(required = false)
    private ModelMapper modelMapper;

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
}
