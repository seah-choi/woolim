package org.fullstack4.woolim.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.CommonUtil;
import org.fullstack4.woolim.common.FileUtil;
import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.fullstack4.woolim.service.CartServiceIf;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.fullstack4.woolim.service.QnaServiceIf;
import org.fullstack4.woolim.service.QnaServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value="/mypage")
@RequiredArgsConstructor
public class MypageController {
    private final MemberServiceIf memberService;
    private final CartServiceIf cartService;
    private final QnaServiceIf qnaService;

    @GetMapping("/view")
    public void GETView(HttpServletRequest req,
                        Model model){
        HttpSession session = req.getSession();
        String member_id = (String) session.getAttribute("member_id");
        MemberDTO memberDTO = memberService.memberView(member_id);
        model.addAttribute("memberDTO", memberDTO);
    }
    @GetMapping("/writeList")
    public void GETWriteList() {

    }

    @GetMapping("/paymentList")
    public void GETPaymentList() {

    }

    @GetMapping("/BoardList")
    public void GETBoardList() {

    }

    @GetMapping("/cart")
    public void GETCartList(HttpServletRequest req, Model model) {
        HttpSession session = req.getSession();
        String id = session.getAttribute("member_id").toString();
        CartDTO cartDTO = CartDTO.builder()
                .member_id(id)
                .cart_status("Y")
                .build();
        List<CartDTO> dtoList = cartService.cartOrJjimList(cartDTO);

        log.info("dtoList :" +dtoList);
        model.addAttribute("dtoList", dtoList);
    }

    @GetMapping("/regist")
    public void GETRegist() {

    }

    @GetMapping("/modify")
    public void GETModify() {

    }

    @GetMapping("/delete")
    public void GETDelete() {

    }

    @GetMapping("/jjim")
    public void GETJjim(HttpServletRequest req, Model model) {
        HttpSession session = req.getSession();
        String id = session.getAttribute("member_id").toString();
        CartDTO cartDTO = CartDTO.builder()
                .member_id(id)
                .cart_status("N")
                .build();
        List<CartDTO> dtoList = cartService.cartOrJjimList(cartDTO);

        log.info("dtoList :" +dtoList);
        model.addAttribute("dtoList", dtoList);
    }
    @GetMapping("/qnaList")
    public void GETQnaList(PageRequestDTO pageRequestDTO,
                           HttpServletRequest req,
                           Model model){
        HttpSession session = req.getSession();
        String member_id = (String) session.getAttribute("member_id");

        pageRequestDTO.setMember_id(member_id);
        PageResponseDTO<QnaDTO> responseDTO = qnaService.qnaListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
    }
    @GetMapping("/pointcharge")
    public void GETChargePoint() {

    }
    @GetMapping("/qnaRegist")
    public void GETQnaRegist(){

    }
    @PostMapping("/qnaRegist")
    public String POSTQnaRegist(@Valid QnaDTO qnaDTO,
                                BindingResult bindingResult,
                                MultipartHttpServletRequest files,
                                HttpServletRequest req,
                                RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            log.info("MypageController >> qna Regist Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);
        }
        List<MultipartFile> list = files.getFiles("files");
        String uploadFoler = CommonUtil.getUploadFolder(req,"qna");

        int result = qnaService.regist(qnaDTO);

        for(int i=0;i<list.size();i++){
            if(list.get(i).getSize()==0){
                break;
            }
            FileDTO fileDTO = FileDTO.builder()
                    .file(list.get(i))
                    .uploadFolder(uploadFoler)
                    .build();
            log.info("========================");
            log.info("postQnaRegist >> qnaDTO" + qnaDTO);
            log.info("========================");
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            log.info("=======================");
            log.info("upload : " + map);
            log.info("=======================");
            if(map.get("result").equals("success")) {
                QnaFileDTO qnaFileDTO = QnaFileDTO.builder()
                        .qna_idx(qnaDTO.getQna_idx())
                        .orgFile(map.get("orgName"))
                        .saveFile(map.get("newName")).build();
                qnaService.file_regist(qnaFileDTO);
            }
        }

        if(result > 0){
            return "redirect:/mypage/qnaList";
        }
        else {
            return "redirect:/mypage/qnaList";
        }
    }
    @GetMapping("/qnaView")
    public void GETQnaView(){

    }
}
