package org.fullstack4.woolim.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StudyScheduleDTO {
    private int study_idx;
    private String study_content;
    private int member_idx;
    private LocalDate start_date;
    private LocalDate end_date;

}
