package org.fullstack4.woolim.controller;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.woolim.common.InsufficientStockException;
import org.fullstack4.woolim.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Log4j2
@Controller
@RequestMapping(value="/login")
@RequiredArgsConstructor
public class LoginController {

    private final MemberServiceIf memberService;
    @GetMapping("/login")
    public void GETLogin() {

    }

    @RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String Login(@RequestParam HashMap<String, Object> map, HttpServletRequest req, HttpServletResponse resp) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<>();
        String id = req.getParameter("member_id").trim();
        String pwd = req.getParameter("member_pwd").trim();

        String name = memberService.memberView(id).getMember_name();
        
        boolean save_id = req.getParameter("save_id") ==null?false:true;
        try {
            if (memberService.login(id, pwd, req)) {
                resultMap.put("result", "success");
                resultMap.put("msg","성공적으로 로그인되었습니다.");
                HttpSession session = req.getSession();
                session.setAttribute("member_id", id);
                session.setAttribute("member_name", name);
            } else {
                resultMap.put("result", "false");
                resultMap.put("msg","비밀번호가 틀렸습니다.");
            }
        }catch (InsufficientStockException e){
            resultMap.put("result", "false");
            resultMap.put("msg", e.getMessage());
        }
        return new Gson().toJson(resultMap);
    }

    @GetMapping("/logout")
    public String GETLogout(HttpServletRequest req) {
        HttpSession session = req.getSession();
        session.invalidate();
        return "redirect:/login/login";
    }


}
