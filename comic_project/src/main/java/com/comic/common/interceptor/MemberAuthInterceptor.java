package com.comic.common.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class MemberAuthInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(MemberAuthInterceptor.class);

    // 페이지 요청 정보 저장
    private void saveDestination(HttpServletRequest request) {
    	HttpSession httpSession = request.getSession();
    	String roomNum = request.getParameter("roomNum");
    	httpSession.removeAttribute("admin");
    	httpSession.removeAttribute("roomNum");
        httpSession.setAttribute("roomNum", roomNum);
        String uri = request.getRequestURI();
        String query = request.getQueryString();
        if (query == null || query.equals("null")) {
            query = "";
        } else {
            query = "?" + query;
        }
        if (request.getMethod().equals("GET")) {
            logger.info("destination : " + (uri + query));
            request.getSession().setAttribute("destination", uri + query);
        } else if(request.getMethod().equals("POST")){
        	logger.info("destination : " + (uri));
        	System.out.println("destination : " + (uri));
            request.getSession().setAttribute("destination", uri);
        }
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession httpSession = request.getSession();
        if (httpSession.getAttribute("Memberlogin") == null) {
            saveDestination(request);
            response.sendRedirect("/member/MemberLogin");
            return false;
        }

        return true;
    }
}