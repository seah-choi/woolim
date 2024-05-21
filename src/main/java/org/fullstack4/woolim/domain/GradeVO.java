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
public class GradeVO {
    private int grade_idx;
    private int lecture_idx;
    private int member_idx;
    private String grade;

}
