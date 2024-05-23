package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.BbsVO;
import org.fullstack4.woolim.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface BbsMapper {
    int total_count(PageRequestDTO pageRequestDTO);

    List<BbsVO> bbsListByPage(PageRequestDTO pageRequestDTO);

}
