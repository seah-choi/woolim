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
public class QnaVO {
    private int qna_idx;
    private String member_id;
    private String qna_title;
    private String qna_content;
    private String qna_answer_YN;
    private String qna_category;
    private String qna_answer;
    private LocalDate qna_reg_date;
    private LocalDate qna_answer_date;
    private int ref_idx;
    private String qna_answer_status;
}
