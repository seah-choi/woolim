package org.fullstack4.woolim.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.domain.BoardFileVO;
import org.fullstack4.woolim.domain.QnaFileVO;
import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.BoardFileDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;
import org.fullstack4.woolim.dto.PageResponseDTO;
import org.fullstack4.woolim.mapper.BbsMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BbsServiceImpl implements BbsServiceIf{
    private final ModelMapper modelMapper;
    private final BbsMapper bbsMapper;
    @Override
    public PageResponseDTO<BbsDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        List<BbsVO> voList =bbsMapper.bbsListByPage(pageRequestDTO);
        log.info("voList" + voList);
        List<BbsDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo, BbsDTO.class)).collect(Collectors.toList());
        log.info("dtoList" + dtoList);

        int total_count = bbsMapper.total_count(pageRequestDTO);
        log.info("total_count" + total_count);

        PageResponseDTO<BbsDTO> responseDTO = PageResponseDTO.<BbsDTO>withAll()
                .total_count(total_count)
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .build();

        log.info("responseDTO :" +responseDTO);
        return responseDTO;
    }

    @Override
    public BbsDTO view(int bbs_idx) {
        BbsVO vo = bbsMapper.view(bbs_idx);
        BbsDTO dto = modelMapper.map(vo, BbsDTO.class);
        return dto;
    }

    @Override
    public int modify(BbsDTO bbsDTO) {
        BbsVO vo = modelMapper.map(bbsDTO, BbsVO.class);
        int result = bbsMapper.modify(vo);
        return result;
    }

    @Override
    public int regist(BbsDTO bbsDTO) {
        BbsVO vo = modelMapper.map(bbsDTO, BbsVO.class);
        int result = bbsMapper.regist(vo);
        log.info("BbsServiceImpl >> regist" + vo);
        return vo.getBbs_idx();
    }

    @Override
    public int delete(int bbs_idx) {
        return bbsMapper.delete(bbs_idx);
    }

    @Override
    public int file_regist(BoardFileDTO boardFileDTO) {
        BoardFileVO boardFileVO = modelMapper.map(boardFileDTO, BoardFileVO.class);
        int result = bbsMapper.file_regist(boardFileVO);
        return result;
    }

    @Override
    public BoardFileDTO fileView(int bbs_idx) {
        BoardFileVO boardFileVO = bbsMapper.fileView(bbs_idx);
        if(boardFileVO != null){
            BoardFileDTO dto = modelMapper.map(boardFileVO, BoardFileDTO.class);

            return dto;
        }
        return null;
    }

    @Override
    public int deleteList(Integer[] idxList) {
        int result = bbsMapper.deleteList(idxList);
        return result;
    }

    @Override
    public int fileModify(BoardFileDTO boardFileDTO) {
        BoardFileVO boardFileVO = modelMapper.map(boardFileDTO, BoardFileVO.class);
        int result = bbsMapper.fileModify(boardFileVO);
        return result;
    }

    @Override
    public int InsertLectureBbs(BbsDTO bbsDTO) {
        BbsVO bbsVO = modelMapper.map(bbsDTO, BbsVO.class);
        int result = bbsMapper.InsertLectureBbs(bbsVO);
        return bbsVO.getBbs_idx();
    }

    @Override
    public boolean hasExistingFiles(int bbs_idx) {
        return bbsMapper.checkExistingFiles(bbs_idx) > 0;
    }

    @Override
    public boolean updateReadCount(int bbs_idx) {
        return bbsMapper.updateReadCount(bbs_idx);
    }

}
