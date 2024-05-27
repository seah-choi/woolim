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
public class ReviewVO {
    private int review_idx;
    private String member_id;
    private String review_comment;
    private int review_rank;
    private int lecture_idx;
    private LocalDate review_reg_date;
}
