package org.fullstack4.woolim.mapper;

import org.fullstack4.woolim.domain.BbsReplyVO;
import org.fullstack4.woolim.domain.ReviewVO;
import org.fullstack4.woolim.dto.PageRequestDTO;

import java.util.List;

public interface ReviewMapper {
    List<ReviewVO> list(PageRequestDTO pageRequestDTO);
    int regist(ReviewVO reviewVO);
    int delete(int reply_idx);
    int total_count(PageRequestDTO pageRequestDTO);
}
