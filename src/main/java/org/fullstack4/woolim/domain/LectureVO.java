package org.fullstack4.woolim.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2
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
    private String lecture_video;
    private String lecture_category_subject;
    private String lecture_category_school;
    private String lecture_category_grade;
    private int member_idx;
    private LocalDate lecture_reg_date;
    private String member_id;


    private String lecture_study;
    private String lecture_content_detail;
    private int lecture_price;
    private int lecture_sale;
    private int lecture_sale_price;
    private int lecture_count ;
}
