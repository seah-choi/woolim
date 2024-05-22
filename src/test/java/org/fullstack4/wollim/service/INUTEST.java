package org.fullstack4.wollim.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.mapper.BbsMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class INUTEST {

    @Autowired(required = false)
    private BbsMapper bbsMapper;

    @Autowired(required = false)
    private ModelMapper modelMapper;

    @Test
    public void test(){
        PageRequestDTO pageRequestDTO = new PageRequestDTO();
        List<BbsVO> voList =bbsMapper.bbsListByPage(pageRequestDTO);
        log.info(voList);
        List<BbsDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo, BbsDTO.class)).collect(Collectors.toList());
        log.info(dtoList);

        int total_count = bbsMapper.total_count(pageRequestDTO);
        log.info(total_count);
        PageResponseDTO<BbsDTO> responseDTO = PageResponseDTO.<BbsDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();

        log.info("responseDTO :" +responseDTO);
    }


}
