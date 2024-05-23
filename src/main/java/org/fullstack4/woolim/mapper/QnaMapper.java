package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.QnaFileVO;
import org.fullstack4.woolim.domain.QnaVO;

@Mapper
public interface QnaMapper {
    int regist(QnaVO qnaVO);
    int ref_update(int qna_idx);
    int file_regist(QnaFileVO qnaFileVO);
}
