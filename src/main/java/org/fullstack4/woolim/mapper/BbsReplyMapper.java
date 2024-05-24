package org.fullstack4.woolim.mapper;

import org.fullstack4.woolim.domain.BbsReplyVO;

import java.util.List;

public interface BbsReplyMapper {
    List<BbsReplyVO> list(int bbs_idx);
    int regist(BbsReplyVO bbsReplyVO);
    int modify(BbsReplyVO bbsReplyVO);
    int delete(int reply_idx);
    int reply_cnt_update(int reply_idx);
}
