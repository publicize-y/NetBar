package com.zy.Config;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptot implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session= request.getSession();
        if(session.getAttribute("loginok")!=null){
            return true;
        }
        if(request.getRequestURI().contains("login")){
            return true;
        }
        if(request.getRequestURI().contains("tologin")){
            return true;
        }
        if(request.getRequestURI().contains("ajax")){
            return true;
        }
        request.getRequestDispatcher("/loginform.jsp").forward(request,response);
        return false;

    }
}
