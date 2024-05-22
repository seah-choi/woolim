package org.fullstack4.woolim.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.fullstack4.woolim.domain.LectureVO;

import java.util.List;

public interface LectureMapper {
    List<LectureVO> getList();

}
