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
public class VideoVO {
    private int video_idx;
    private String video_title;
    private int lecture_idx;
    private String video_content;
    private String video_file;
}
