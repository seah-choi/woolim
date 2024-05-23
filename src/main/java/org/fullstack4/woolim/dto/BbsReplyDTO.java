package org.fullstack4.woolim.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsReplyDTO {
    private int reply_idx;
    private int bbs_idx;
    private String member_id;
    private String reply_content;
    private LocalDate reply_reg_date;
    private int sort_idx;
    private LocalDate reply_modify_date;
}
