package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.ClassVO;
import org.fullstack4.woolim.domain.ReviewVO;
import org.fullstack4.woolim.dto.ClassDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.dto.ReviewDTO;
import org.fullstack4.woolim.mapper.ReviewMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewServiceIf{
    private final ModelMapper modelMapper;
    private final ReviewMapper reviewMapper;

    @Override
    public PageResponseDTO<ReviewDTO> list(PageRequestDTO pageRequestDTO) {
        List<ReviewVO> voList = reviewMapper.list(pageRequestDTO);
        List<ReviewDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo, ReviewDTO.class)).collect(Collectors.toList());

        int total_count = reviewMapper.total_count(pageRequestDTO);
        PageResponseDTO<ReviewDTO> responseDTO = PageResponseDTO.<ReviewDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();
        return responseDTO;
    }
    @Override
    public int regist(ReviewDTO reviewDTO) {
        ReviewVO reviewVO = modelMapper.map(reviewDTO, ReviewVO.class);
        int result = reviewMapper.regist(reviewVO);
        return result;
    }
    @Override
    public int delete(int reply_idx) {

        return reviewMapper.delete(reply_idx);
    }

    @Override
    public int updateAvg(int lecture_idx) {
        return reviewMapper.updateAvg(lecture_idx);
    }

    @Override
    public List<ClassDTO> reviewConfirm(int lecture_idx) {
        List<ClassVO> voList = reviewMapper.reviewConfirm(lecture_idx);
        List<ClassDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo, ClassDTO.class)).collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public List<ReviewDTO> listAll(int lecture_idx) {
        List<ReviewVO> voList = reviewMapper.listAll(lecture_idx);
        List<ReviewDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo, ReviewDTO.class)).collect(Collectors.toList());
        return dtoList;
    }
}
