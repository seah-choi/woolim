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
public class TeacherSubjectDTO {
    private int ts_idx;

    private int member_idx;
    private String teacher_image_file;
    private String teacher_intro;
    private String subject_category_code;



}
