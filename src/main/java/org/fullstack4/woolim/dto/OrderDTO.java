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
public class OrderDTO {
    private int order_idx;
    private String member_id;
    private int lecture_idx;
    private LocalDate order_date;
    private int order_total;
    private String order_name;
    private String order_cancel_yn;
    private LocalDate order_reg_date;
    private String order_status;
    private String order_refund_request;
    private String order_refund_response;
    private String order_num;
    private int order_detail_idx;
    private LocalDate order_detail_regDate;
    private int price;
}
