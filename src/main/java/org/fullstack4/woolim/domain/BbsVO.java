package org.fullstack4.woolim.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsVO {
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


}
