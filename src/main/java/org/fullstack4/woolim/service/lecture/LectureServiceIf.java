package org.fullstack4.woolim.service.lecture;

import org.fullstack4.woolim.criteria.Criteria;
import org.fullstack4.woolim.dto.LectureDTO;

import java.util.List;

public interface LectureServiceIf {

    List<LectureDTO> getList(Criteria cri);

    int getLectureKeyword(Criteria cri);
}
