package org.fullstack4.woolim.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TeacherSubjectVO {
    private int ts_idx;
    private String member_idx;
    private String subject_category_code;
    private String teacher_image;
    private String teacher_content;
}
