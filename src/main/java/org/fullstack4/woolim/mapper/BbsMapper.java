package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.domain.BoardFileVO;
import org.fullstack4.woolim.domain.QnaFileVO;
import org.fullstack4.woolim.dto.BoardFileDTO;
import org.fullstack4.woolim.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface BbsMapper {
    int total_count(PageRequestDTO pageRequestDTO);

    List<BbsVO> bbsListByPage(PageRequestDTO pageRequestDTO);
    BbsVO view(int bbs_idx);
    int modify(BbsVO bbsVO);
    int regist(BbsVO bbsVO);
    int delete(int bbs_idx);
    int file_regist(BoardFileVO boardFileVO);
    BoardFileVO fileView(int bbs_idx);
    int deleteList(Integer[] idxList);
    int fileModify(BoardFileVO boardFileVO);
    int InsertLectureBbs(BbsVO bbsVO);

    int checkExistingFiles(int bbs_idx);
    public boolean updateReadCount(int bbs_idx);

}
