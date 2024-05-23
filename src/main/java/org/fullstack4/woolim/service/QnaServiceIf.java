package org.fullstack4.woolim.service;

import org.fullstack4.woolim.domain.QnaFileVO;
import org.fullstack4.woolim.domain.QnaVO;
import org.fullstack4.woolim.dto.*;

public interface QnaServiceIf {
    int regist(QnaDTO qnaDTO);
    int file_regist(QnaFileDTO qnaFileDTO);
    PageResponseDTO<QnaDTO> qnaListByPage(PageRequestDTO pageRequestDTO);
    QnaDTO view(int qna_idx);
    int delete(int qna_idx);
    int modify(QnaDTO qnaDTO);
}
