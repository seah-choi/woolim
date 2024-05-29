package org.fullstack4.woolim.filter;


import org.fullstack4.woolim.common.CommonUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/mypage/*", "/mystudy/*", "/admin/*", "/order/order"})
public class filter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        if(!CommonUtil.loginCheck(req)){
            resp.sendRedirect("/login/login");
            return;
        }
        chain.doFilter(request, response);

    }
}
