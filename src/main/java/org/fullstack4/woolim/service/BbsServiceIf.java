package org.fullstack4.woolim.service;

import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.domain.BoardFileVO;
import org.fullstack4.woolim.dto.*;

import java.util.List;

public interface BbsServiceIf {
    PageResponseDTO<BbsDTO> bbsListByPage(PageRequestDTO pageRequestDTO);
    BbsDTO view(int bbs_idx);
    int modify(BbsDTO bbsDTO);
    int regist(BbsDTO bbsDTO);
    int delete(int bbs_idx);
    int file_regist(BoardFileDTO boardFileDTO);
    BoardFileDTO fileView(int bbs_idx);
    int deleteList(Integer[] idxList);
    int fileModify(BoardFileDTO boardFileDTO);
    int InsertLectureBbs(BbsDTO bbsDTO);
    List<BoardFileDTO> file_list(int bbs_idx);
    boolean hasExistingFiles(int bbs_idx);
    public boolean updateReadCount(int bbs_idx);
    int file_delete(int bbs_idx);
}
