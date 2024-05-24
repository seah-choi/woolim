package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.BbsReplyDTO;
import org.fullstack4.woolim.service.BbsReplyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/bbsReply")
public class BoardReplyController {
    private final BbsReplyServiceIf bbsReplyService;

    @PostMapping("/regist")
    public String regist(BbsReplyDTO bbsReplyDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        int result = bbsReplyService.regist(bbsReplyDTO);

        log.info("result : " + result);

        if (result > 0) {
            return "redirect:/board/freeView?bbs_idx="+bbsReplyDTO.getBbs_idx();
        } else {
            return "/board/freeView?bbs_idx="+bbsReplyDTO.getBbs_idx();
        }
    }

    @PostMapping("/delete")
    public String deletePOST(@RequestParam(name="reply_cnt", defaultValue = "0") int reply_cnt, @RequestParam(name="bbs_idx") int bbs_idx){
        int result = bbsReplyService.delete(reply_cnt);
        return "redirect:/board/freeView?bbs_idx="+bbs_idx;
    }
}
