package org.fullstack4.woolim.service;

import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;

public interface MyStudyServiceIf {
    PageResponseDTO<BbsDTO> bbsListByPage(PageRequestDTO pageRequestDTO);
    BbsDTO view(int bbs_idx);
}
