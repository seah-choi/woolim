package org.fullstack4.woolim.service;

import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;

import java.util.List;

public interface BbsServiceIf {
    PageResponseDTO<BbsDTO> bbsListByPage(PageRequestDTO pageRequestDTO);
}
