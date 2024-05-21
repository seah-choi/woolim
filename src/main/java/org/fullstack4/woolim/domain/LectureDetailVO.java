package org.fullstack4.woolim.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LectureDetailVO {
    private String lecture_category_name;
    private String lecture_category;
    private String lecture_category_detail_name;
    private String lectrue_category_detail;
}
