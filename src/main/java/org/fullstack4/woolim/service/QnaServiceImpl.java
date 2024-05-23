package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.QnaFileVO;
import org.fullstack4.woolim.domain.QnaVO;
import org.fullstack4.woolim.dto.QnaDTO;
import org.fullstack4.woolim.dto.QnaFileDTO;
import org.fullstack4.woolim.mapper.QnaMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

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
        return result;
    }

    @Override
    public int file_regist(QnaFileDTO qnaFileDTO) {
        QnaFileVO qnaFileVO = modelMapper.map(qnaFileDTO, QnaFileVO.class);
        int result = qnaMapper.file_regist(qnaFileVO);
        return result;
    }


}
