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
public class CartVO {
    private int cart_idx;
    private String member_id;
    private int lecture_idx;
    private LocalDate cart_reg_date;
    private String cart_status;
}
