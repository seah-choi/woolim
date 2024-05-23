package org.fullstack4.woolim.controller;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.dto.*;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.fullstack4.woolim.service.OrderServiceIf;
import org.fullstack4.woolim.service.lecture.LectureServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Log4j2
@Controller
@RequestMapping(value="/order")
@RequiredArgsConstructor
public class OrderController {

    private final LectureServiceIf lectureService;
    private final MemberServiceIf memberService;
    private final OrderServiceIf orderService;

    @GetMapping("/order")
    public void GETOrder(HttpServletRequest req, Model model,
                         @RequestParam(name="lecture_idx") List<String> Lecture_idx,
                         @RequestParam(name="Cart_idx") List<String> Cart_idx){

        HttpSession session = req.getSession();
        String id = session.getAttribute("member_id").toString();
        MemberDTO memberDTO = memberService.memberView(id);


        List<LectureDTO> dtoList = new ArrayList<>();
        int total_price = 0;
        for(int i  = 0 ; i<Lecture_idx.size()-1 ; i++){
            LectureDTO dto = lectureService.lectureView(Integer.parseInt(Lecture_idx.get(i)));
            dtoList.add(dto);
            total_price += dto.getLecture_sale_price();
        }

        log.info("total_price: " +total_price);
        log.info("dtoList: " + dtoList);
        log.info("memberDTO: " + memberDTO);
        log.info("cart_idx: " + Cart_idx);

        model.addAttribute("Cart_idx", Cart_idx);
        model.addAttribute("total_price", total_price);
        model.addAttribute("dtoList", dtoList);
        model.addAttribute("memberDTO", memberDTO);
    }

    @RequestMapping(value = "/payment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String payment(@RequestParam HashMap<String, Object> map, HttpServletRequest req) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<>();

        String member_id = map.get("member_id").toString();
        resultMap.put("result", "fail");
        MemberDTO dto = memberService.memberView(member_id);

        /////////////////결제 번호랑 상세 정보 insert ////////////
        int random = (int) (Math.random()*100000)+1;
        String order_num=new SimpleDateFormat("yyMMddHmss").format(new Date())+"-"+random;

        //////////////회원정보 포인트 빠져나가기//////////////////
        PaymentDTO paymentDTO = PaymentDTO.builder()
                .payment_num(order_num)
                .member_id(map.get("member_id").toString())
                .price(Integer.parseInt("-"+map.get("price").toString()))
                .payment_type("구매")
                .payment_title("포인트 사용")
                .build();

        MemberDTO memberDTO = MemberDTO.builder()
                .member_id(map.get("member_id").toString())
                .member_point(Integer.parseInt("-"+map.get("price").toString()))
                .build();

        String lecture_idx = map.get("lecture_idx").toString();
        log.info("lecture_idx: " + lecture_idx);
        lecture_idx = lecture_idx.replace("[","");
        lecture_idx = lecture_idx.replace("]","");
        log.info("lecture_idx replace: " + lecture_idx);
        String[] lecturelist = lecture_idx.split(",");
        log.info("lecturelist: " + Arrays.toString(lecturelist));
        List<LectureDTO> dtolist = new ArrayList<LectureDTO>();


        String cart_idx = map.get("cart_idx").toString();
        log.info("cart_idx: " + cart_idx);
        cart_idx = cart_idx.replace("[","");
        cart_idx = cart_idx.replace("]","");
        log.info("cart_idx replace: " + cart_idx);
        String[] cartlist = cart_idx.split(",");
        log.info("cartlist: " + Arrays.toString(cartlist));
        List<CartDTO> cartdtolist = new ArrayList<CartDTO>();

        for(int i = 0; i<cartlist.length; i++) {
            CartDTO dto1 = CartDTO.builder()
                    .cart_idx(Integer.parseInt(cartlist[i]))
                    .build();
            cartdtolist.add(dto1);
        }

        log.info("cartdtolist:{}",cartdtolist.toString());
        for(int i = 0; i<lecturelist.length; i++) {
            LectureDTO dto1 = lectureService.lectureView(Integer.parseInt(lecturelist[i]));
            dtolist.add(dto1);
        }



        OrderDTO orderDTO = OrderDTO.builder()
                .member_id(member_id)
                .order_num(order_num)
                .order_status("구매 중")
                .order_total(Integer.parseInt(map.get("price").toString()))
                .order_name(dto.getMember_name())
                .build();


        try {
            if (dto.getMember_point() > Integer.parseInt(map.get("price").toString())) {
                orderService.DoOrder(orderDTO,memberDTO,paymentDTO,cartdtolist,dtolist);
                resultMap.put("result", "success");
                resultMap.put("msg", "성공적으로 결제되었습니다.");
            } else {
                resultMap.put("result", "fail");
                resultMap.put("msg", "포인트가 부족합니다.");
            }
        }
        catch(InsufficientStockException e) {
            resultMap.put("result", "fail");
            resultMap.put("msg", e.getMessage());
        }


        return new Gson().toJson(resultMap);
    }
}
