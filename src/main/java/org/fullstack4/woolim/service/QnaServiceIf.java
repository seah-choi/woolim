package org.fullstack4.woolim.service;

import org.fullstack4.woolim.domain.QnaFileVO;
import org.fullstack4.woolim.domain.QnaVO;
import org.fullstack4.woolim.dto.QnaDTO;
import org.fullstack4.woolim.dto.QnaFileDTO;

public interface QnaServiceIf {
    int regist(QnaDTO qnaDTO);
    int file_regist(QnaFileDTO qnaFileDTO);
}
