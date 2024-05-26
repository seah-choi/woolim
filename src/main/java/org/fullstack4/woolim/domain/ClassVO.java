package org.fullstack4.woolim.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ClassVO {
    private int class_idx;
    private String member_id;
    private int lecture_idx;
    private String grade;
    private String lecture_title;
    private String member_name;
    private int grade_idx;
}
