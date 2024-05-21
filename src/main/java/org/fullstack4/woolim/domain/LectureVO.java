package org.fullstack4.woolim.domain;

import jdk.vm.ci.meta.Local;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LectureVO {
    private int lecture_idx;
    private String lecture_title;
    private String member_name;
    private LocalDate lecture_start_date;
    private LocalDate lecture_end_date;
    private String lecture_image;
    private int lecture_star;
    private String lecture_content;
    private String lecture_youtube_url;
    private String lecture_category;
    private String lecture_category_detail;
    private int member_idx;
    private Local lecture_reg_date;
    private String member_id;
}
