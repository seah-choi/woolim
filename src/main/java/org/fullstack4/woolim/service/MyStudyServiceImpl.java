package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.domain.LectureDetailVO;
import org.fullstack4.woolim.domain.LectureVO;
import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.LectureDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.mapper.BbsMapper;
import org.fullstack4.woolim.mapper.MyStudyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
@Log4j2
@Service
@RequiredArgsConstructor
public class MyStudyServiceImpl implements MyStudyServiceIf{
    private final ModelMapper modelMapper;
    private final MyStudyMapper myStudyMapper;

    @Override
    public PageResponseDTO<BbsDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        List<BbsVO> voList =myStudyMapper.bbsListByPage(pageRequestDTO);
        log.info("voList" + voList);
        List<BbsDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo, BbsDTO.class)).collect(Collectors.toList());
        log.info("dtoList" + dtoList);

        int total_count = myStudyMapper.total_count(pageRequestDTO);
        log.info("total_count" + total_count);
        PageResponseDTO<BbsDTO> responseDTO = PageResponseDTO.<BbsDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();

        log.info("responseDTO :" +responseDTO);
        return responseDTO;
    }

    @Override
    public BbsDTO view(int bbs_idx) {
        BbsVO vo = myStudyMapper.view(bbs_idx);
        BbsDTO dto = modelMapper.map(vo, BbsDTO.class);
        return dto;
    }

    @Override
    public PageResponseDTO<LectureDTO> LectureListByPage(PageRequestDTO pageRequestDTO) {
        List<LectureVO> voList = myStudyMapper.LectureListByPage(pageRequestDTO);
        log.info(voList);
        List<LectureDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo, LectureDTO.class)).collect(Collectors.toList());
        int lecture_count = myStudyMapper.LectureCount(pageRequestDTO);

        PageResponseDTO<LectureDTO> responseDTO = PageResponseDTO.<LectureDTO>withAll()
                .total_count(lecture_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();

        return responseDTO;
    }
}
