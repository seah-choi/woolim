package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.domain.QnaFileVO;
import org.fullstack4.woolim.domain.QnaVO;
import org.fullstack4.woolim.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface QnaMapper {
    int regist(QnaVO qnaVO);
    int ref_update(int qna_idx);
    int file_regist(QnaFileVO qnaFileVO);
    int total_count(PageRequestDTO pageRequestDTO);

    List<QnaVO> qnaListByPage(PageRequestDTO pageRequestDTO);
}
