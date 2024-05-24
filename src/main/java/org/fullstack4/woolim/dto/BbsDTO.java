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
public class BbsDTO {
    private int bbs_idx;
    private String bbs_title;
    private String bbs_content;
    private String member_id;
    private LocalDate bbs_reg_date;
    private LocalDate bbs_modify_date;
    private String bbs_image;
    private String bbs_file_yn;
    private String bbs_category_code;
    private int bbs_read_cnt;
    private int bbs_like;
    private String bbs_reply_yn;
    private int bbs_reply_cnt;
    private String bbs_teacher_yn;

    //////////////////////// 댓글영역/////////////////////////
    private int reply_idx;
    private String reply_content;
    private LocalDate reply_reg_date;
    private int sort_idx;
    private LocalDate reply_modify_date;

    /////////////////////////게시판 카테고리////////////////////

    private int idx;
    private String bbs_category_name;

    //////////////////////파일 카테고리////////////////////////////////

    private String orgFile;
    private String saveFile;


}
