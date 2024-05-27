package org.fullstack4.woolim.service;

import org.fullstack4.woolim.domain.ClassVO;
import org.fullstack4.woolim.domain.ReviewVO;
import org.fullstack4.woolim.dto.ClassDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.dto.ReviewDTO;

import java.util.List;

public interface ReviewServiceIf {
    PageResponseDTO<ReviewDTO> list(PageRequestDTO pageRequestDTO);
    int regist(ReviewDTO reviewDTO);
    int delete(int reply_idx);
    int updateAvg(int lecture_idx);
    List<ClassDTO> reviewConfirm(int lecture_idx);
    List<ReviewDTO> listAll(int lecture_idx);
}
