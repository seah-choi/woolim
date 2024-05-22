package org.fullstack4.woolim.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LectureDTO {
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
    private LocalDate lecture_reg_date;
    private String member_id;

    private String lecture_study;
    private String lecture_content_detail;

    /*    private String lecture_category_name;
    private String lecture_category_detail_name;

    //////////////////강의 영상 VideoVO/////////////////
    private int video_idx;
    private String video_title;
    private String video_content;
    private String video_file;*/
}
