package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.domain.LectureDetailVO;
import org.fullstack4.woolim.domain.LectureVO;
import org.fullstack4.woolim.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface MyStudyMapper {
    int total_count(PageRequestDTO pageRequestDTO);
    List<BbsVO> bbsListByPage(PageRequestDTO pageRequestDTO);
    List<LectureVO> LectureListByPage(PageRequestDTO pageRequestDTO);
    int LectureCount(PageRequestDTO pageRequestDTO);
    BbsVO view(int bbs_idx);

}
