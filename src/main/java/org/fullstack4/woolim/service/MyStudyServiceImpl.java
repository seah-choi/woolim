package org.fullstack4.woolim.service;

import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;

public class MyStudyServiceImpl implements MyStudyServiceIf{
    @Override
    public PageResponseDTO<BbsDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        return null;
    }

    @Override
    public BbsDTO view(int bbs_idx) {
        return null;
    }
}
