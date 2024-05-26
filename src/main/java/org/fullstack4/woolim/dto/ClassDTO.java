package org.fullstack4.woolim.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClassDTO {
    private int class_idx;
    private String member_id;
    private int lecture_idx;
    private String grade;
    private String lecture_title;
    private String member_name;
    private int grade_idx;
}
