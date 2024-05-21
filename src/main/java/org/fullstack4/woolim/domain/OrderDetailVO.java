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
public class OrderDetailVO {
    private int order_detail_idx;
    private String order_num;
    private String lecture_code;
    private String order_status;
    private LocalDate order_detail_regDate;
    private int price;
}
