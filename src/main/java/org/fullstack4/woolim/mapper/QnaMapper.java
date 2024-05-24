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
    int delete(int qna_idx);
    int modify(QnaVO qnaVO);
    List<QnaVO> qnaListByPage(PageRequestDTO pageRequestDTO);
    QnaVO view(int qna_idx);
    List<QnaFileVO> qnaFileList(int qna_idx);
}
