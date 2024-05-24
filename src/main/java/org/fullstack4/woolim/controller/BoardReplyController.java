package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.dto.BbsDTO;
import org.fullstack4.woolim.dto.BbsReplyDTO;
import org.fullstack4.woolim.service.BbsReplyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
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
    public String deletePOST(@RequestParam(name="reply_idx", defaultValue = "0") int reply_idx, BbsDTO bbsDTO){
        int result = bbsReplyService.delete(reply_idx);

        log.info("result : " + result);
        log.info("reply_idx : " + reply_idx);
        log.info("bbsDTO.getBbs_idx : " + bbsDTO.getBbs_idx());
        return "redirect:/board/freeView?bbs_idx="+bbsDTO.getBbs_idx();
    }

    @GetMapping("/modify")
    public void modifyGET(BbsReplyDTO bbsReplyDTO, Model model){
        model.addAttribute("bbsReplyDTO", bbsReplyDTO);
    }

    @PostMapping("/modify")
    public String modifyPost(BbsReplyDTO bbsReplyDTO) {
        int result = bbsReplyService.modify(bbsReplyDTO);
        log.info(result);
        return "redirect:/board/freeView?bbs_idx=" + bbsReplyDTO.getBbs_idx();
    }
}
