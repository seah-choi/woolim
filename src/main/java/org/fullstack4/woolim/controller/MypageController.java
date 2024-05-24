package org.fullstack4.woolim.controller;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.CommonUtil;
import org.fullstack4.woolim.common.FileUtil;
import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.mapper.MemberMapper;
import org.fullstack4.woolim.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
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
    private final OrderServiceIf orderService;
    private final PaymentServiceIf paymentService;

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
    public void GETChargePoint(HttpServletRequest req, Model model,PageRequestDTO pageRequestDTO) {
        HttpSession session = req.getSession();
        String member_id = (String) session.getAttribute("member_id");
        pageRequestDTO.setMember_id(member_id);
        log.info("pageRequestDTO :" +pageRequestDTO);
        PageResponseDTO<PaymentDTO> responseDTO = orderService.getPayment(pageRequestDTO);

        log.info("responseDTO:{}", responseDTO);

        model.addAttribute("paymentDTO", responseDTO.getDtolist());
        model.addAttribute("responseDTO", responseDTO);
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
                        .qna_idx(result)
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
    public void GETQnaView(@RequestParam(name = "qna_idx")int qna_idx,
                           Model model){
        QnaDTO qnaDTO = qnaService.view(qna_idx);
        List<QnaFileDTO> fileList = qnaService.qnaFileList(qna_idx);
        model.addAttribute("fileList", fileList);
        model.addAttribute("qnaDTO", qnaDTO);
    }
    @GetMapping("/qnaModify")
    public void GETQnaModify(@RequestParam(name = "qna_idx")int qna_idx,
                             Model model){
        QnaDTO qnaDTO = qnaService.view(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }
    @PostMapping("/qnaModify")
    public String POSTQnaModify(@Valid QnaDTO qnaDTO,
                                BindingResult bindingResult,
                                MultipartHttpServletRequest files,
                                HttpServletRequest req,
                                RedirectAttributes redirectAttributes){
        int result = qnaService.modify(qnaDTO);
        if(result >0){
            return "redirect:/mypage/qnaView?qna_idx="+qnaDTO.getQna_idx();
        }
        else{
            return "redirect:/mypage/qnaModify?qna_idx="+qnaDTO.getQna_idx();
        }
    }

    @PostMapping("/qnaDelete")
    public String POSTQnaDelete(@RequestParam(name = "qna_idx")int qna_idx){
        int result = qnaService.delete(qna_idx);
        if(result>0){
            return "redirect:/mypage/qnaList";
        }
        else {
            return "redirect:/mypage/qnaView?qna_idx="+qna_idx;
        }
    }

    @RequestMapping(value = "/point.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String PointCharge(@RequestParam HashMap<String,Object> map){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int price = Integer.parseInt(map.get("price").toString());
        String payment_num = map.get("payment_num").toString();
        String member_id= map.get("member_id").toString();
        String payment_type = map.get("payment_type").toString();
        String payment_title = map.get("payment_title").toString();

        MemberDTO memberDTO = MemberDTO.builder()
                .member_id(member_id)
                .member_point(price)
                .build();

        PaymentDTO paymentDTO = PaymentDTO.builder()
                .payment_num(payment_num)
                .payment_type(payment_type)
                .payment_title(payment_title)
                .price(price)
                .member_id(member_id)
                .build();

        int result1=orderService.PointCharge(memberDTO);
        if(result1>0){
            int result = paymentService.InsertPayment(paymentDTO);
            if(result>0) {
                resultMap.put("result", "success");
                resultMap.put("msg", "충전 성공");
            }else{
                resultMap.put("result", "fail");
                resultMap.put("msg", "충전 실패");
            }
        }else{
            resultMap.put("result", "fail");
            resultMap.put("msg", "충전 실패");
        }

        return new Gson().toJson(resultMap);
    }

    @RequestMapping(value = "/viewMember.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String memberInfo(@RequestParam HashMap<String, Object> map){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        String id = map.get("member_id").toString();
        MemberDTO memberDTO = memberService.memberView(id);

        resultMap.put("dto", memberDTO);

        return new Gson().toJson(resultMap);
    }

    @RequestMapping(value = "/addcart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String Addcart(@RequestParam HashMap<String, Object> map){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        String JjimList = map.get("JjimList").toString();
        JjimList = JjimList.replace("\"","");
        JjimList = JjimList.replace("[","");
        JjimList = JjimList.replace("]","");
        String[] JJimList = JjimList.split(",");
        List<CartDTO> dtoList = new ArrayList<CartDTO>();
        for(int i = 0; i < JJimList.length; i++){
            CartDTO cartDTO = CartDTO.builder()
                    .cart_idx(Integer.parseInt(JJimList[i]))
                    .build();
            dtoList.add(cartDTO);

        }

        try {
            int total_result = cartService.InsertCartFromJjim(dtoList);
            if(total_result == dtoList.size()){
                resultMap.put("result", "success");
                resultMap.put("msg", "성공적으로 옮겼습니다.");
            }else{
                resultMap.put("result", "fail");
                resultMap.put("msg", "실패했습니다.");
            }
        }catch(InsufficientStockException e){
            resultMap.put("result", "fail");
            resultMap.put("msg",e.getMessage());
        }

        return new Gson().toJson(resultMap);
    }
}