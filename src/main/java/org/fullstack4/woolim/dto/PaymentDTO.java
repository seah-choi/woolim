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
public class PaymentDTO {
    private int payment_idx;
    private String payment_num;
    private String member_id;
    private int price;
    private LocalDate order_date;
    private String payment_type;
    private String payment_title;
}
