package org.fullstack4.woolim.service;

import org.fullstack4.woolim.domain.BbsReplyVO;
import org.fullstack4.woolim.dto.BbsReplyDTO;

import java.util.List;

public interface BbsReplyServiceIf {
    List<BbsReplyDTO> list(int bbs_idx);
    int regist(BbsReplyDTO bbsReplyDTO);
    int modify(BbsReplyDTO bbsReplyDTO);
    int delete(int reply_idx);

}
