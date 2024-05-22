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
public class MemberDTO {
    private int member_idx;
    private String member_id;
    private String member_pwd;
    private String member_name;
    private String member_email;
    private String member_email_addr;
    private String member_phone;
    private String member_zonecode;
    private String member_addr;
    private String member_addr_detail;
    private String member_category;
    private int point;
    private String member_oauth;
    private LocalDate member_reg_date;
    private LocalDate member_modify_date;
    private LocalDate member_leave_date;
    private String member_status;
    private String subject_category_code;
}
