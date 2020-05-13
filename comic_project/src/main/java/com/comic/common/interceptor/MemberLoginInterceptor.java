package com.comic.common.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class MemberLoginInterceptor extends HandlerInterceptorAdapter {

    private static final String LOGIN = "Memberlogin";
    
    //Controller 실행후 실행
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	
        HttpSession httpSession = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object memberVO =  modelMap.get("member");
        
        if (memberVO != null) {
            log.info("new login success");
            httpSession.setAttribute(LOGIN, memberVO);
            httpSession.setAttribute("memberid", modelMap.get("memberid"));
            Object destination = httpSession.getAttribute("destination");
            if(destination != null) {
                RequestDispatcher rd = request.getRequestDispatcher(""+destination);
                
                rd.forward(request, response);
            } else {
            	response.sendRedirect("/");
            }
//			response.sendRedirect(destination != null ? (String) destination : "/");

//            if (request.getParameter("useCookie") != null) {
//                logger.info("remember me...");
//                // 쿠키 생성
//                Cookie loginCookie = new Cookie("loginCookie", httpSession.getId());
//                loginCookie.setPath("/");
//                loginCookie.setMaxAge(60*60*24*7);
//                // 전송
//                response.addCookie(loginCookie);
//            }
//
//			
//			 
        }

    }

    //Controller 실행전에 실행
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession httpSession = request.getSession();
        // 기존의 로그인 정보 제거
        if (httpSession.getAttribute(LOGIN) != null) {
            log.info("clear login data before");
            httpSession.removeAttribute(LOGIN);
        }
        return true;
    }
}