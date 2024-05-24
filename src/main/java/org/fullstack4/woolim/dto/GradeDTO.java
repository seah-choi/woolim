package org.fullstack4.woolim.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GradeDTO {
    private int grade_idx;
    private int lecture_idx;
    private int member_idx;
    private String grade;
    private String lecture_title;
    private String subject_name;
    private String member_name;

}
