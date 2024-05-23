package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.domain.QnaFileVO;
import org.fullstack4.woolim.domain.QnaVO;
import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.mapper.QnaMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaServiceIf{
    private final ModelMapper modelMapper;
    private final QnaMapper qnaMapper;
    @Override
    public int regist(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = qnaMapper.regist(qnaVO);
        qnaMapper.ref_update(qnaVO.getQna_idx());
        return qnaVO.getQna_idx();
    }

    @Override
    public int file_regist(QnaFileDTO qnaFileDTO) {
        QnaFileVO qnaFileVO = modelMapper.map(qnaFileDTO, QnaFileVO.class);
        int result = qnaMapper.file_regist(qnaFileVO);
        return result;
    }


    @Override
    public PageResponseDTO<QnaDTO> qnaListByPage(PageRequestDTO pageRequestDTO) {
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
        return responseDTO;
    }
}
