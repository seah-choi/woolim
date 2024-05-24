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
public class PaymentVO {
    private int payment_idx;
    private String payment_num;
    private String member_id;
    private int price;
    private LocalDate payment_reg_date;
    private String payment_type;
    private String payment_title;
}
