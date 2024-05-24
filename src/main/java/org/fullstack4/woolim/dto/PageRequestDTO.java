package org.fullstack4.woolim.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Min;
import javax.validation.constraints.PositiveOrZero;
import java.net.URLEncoder;
import java.time.LocalDate;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PageRequestDTO {
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int total_count=0;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int page=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_size=10;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int total_page=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int page_skip_count=0;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_size=10;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_start=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_end=1;

    private String search_type;
    @Builder.Default
    private String[] search_types= new String[]{};
    @Builder.Default
    private String search_word ="";
    private String linkParams;
    private String sort_type;
    private String search_date1;
    private String search_date2;
    private String member_id;
    private int member_idx;
    private String member_type;
    private String bbs_type;
    private String member_category;
    private String bbs_teacher_yn;
    private String qna_teacher_yn;

    public void setTotal_count(int total_count) {
        this.total_count = total_count;
    }

    public int getPage_skip_count() {
        return (this.page-1)*this.page_size;
    }
    public String[] getSearch_types() {
        if(search_type  == null || search_type.isEmpty()){
            return null;
        }
        return search_type.split("");
    }


    public String getLinkParams() {
        if(this.linkParams == null || this.linkParams.isEmpty()){
            StringBuilder sb = new StringBuilder();
//            sb.append("page="+this.page);
            sb.append("&page_size="+this.page_size);

            if(search_type != null && !search_type.isEmpty()){
                sb.append("&search_type="+this.search_type);
            }
            if(search_word != null && !search_word.isEmpty()){

                sb.append("&search_word="+ URLEncoder.encode(this.search_word));

            }
//            if(sort_type != null && !sort_type.isEmpty()){
//                sb.append("&sort_type="+URLEncoder.encode(sort_type));
//            }
            if (search_date1 != null) {
                sb.append("&search_date1=" + search_date1);
            }
            if (search_date2 != null) {
                sb.append("&search_date2=" + search_date2);
            }
            if (member_type != null && !member_type.isEmpty()){
                sb.append("&member_type=" + member_type);
            }
            if(member_category != null && !member_category.isEmpty()){
                sb.append("&member_category=" + member_category);
            }
            if(bbs_type != null && !bbs_type.isEmpty()){
                sb.append("&bbs_type=" + bbs_type);
            }
            if(bbs_teacher_yn != null && !bbs_teacher_yn.isEmpty()){
                sb.append("&bbs_teacher_yn=" + bbs_teacher_yn);
            }
            if(qna_teacher_yn != null && !qna_teacher_yn.isEmpty()){
                sb.append("&qna_teacher_yn=" + qna_teacher_yn);
            }
            linkParams = sb.toString();
        }
        return this.linkParams;
    }
}
