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
    private String lecture_image;
    private String lecture_title;
    private int lecture_price;
    private int lecture_sale_price;
    private LocalDate lecture_start_date;
    private LocalDate lecture_end_date;
    private String search_date1;
    private String search_date2;
}
