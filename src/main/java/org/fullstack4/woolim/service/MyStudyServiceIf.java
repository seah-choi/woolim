package org.fullstack4.woolim.service;

import org.fullstack4.woolim.domain.BbsReplyVO;
import org.fullstack4.woolim.dto.*;

import java.util.List;

public interface MyStudyServiceIf {
    PageResponseDTO<BbsDTO> bbsListByPage(PageRequestDTO pageRequestDTO);
    BbsDTO view(int bbs_idx);
    PageResponseDTO<LectureDTO> LectureListByPage(PageRequestDTO pageRequestDTO);
    PageResponseDTO<BbsReplyDTO> replyListByPage(PageRequestDTO pageRequestDTO);
}
