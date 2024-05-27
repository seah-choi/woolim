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
public class OrderDetailDTO {
    private int order_detail_idx;
    private String order_num;
    private int lecture_idx;
    private String order_status;
    private LocalDate order_detail_regDate;
    private int price;
    private String member_id;
    private String lecture_image;
    private String lecture_title;
    private LocalDate lecture_start_date;
    private LocalDate lecture_end_date;
}
