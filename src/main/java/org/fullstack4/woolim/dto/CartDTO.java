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
public class CartDTO {
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
}
