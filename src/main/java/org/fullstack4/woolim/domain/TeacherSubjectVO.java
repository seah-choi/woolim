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

    private int member_idx;
    private String teacher_image_file;
    private String teacher_intro;
    private String subject_category_code;



}
