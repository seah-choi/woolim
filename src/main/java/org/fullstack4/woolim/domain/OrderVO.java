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
public class OrderVO {
    private int order_idx;
    private String member_id;
    private LocalDate order_date;
    private int order_total;
    private String order_name;
    private String order_cancel_yn;
    private LocalDate order_reg_date;
    private String order_status;
    private String order_refund_request;
    private String order_refund_response;
    private String order_num;

}
