package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.RequestMapping;

public class LoginModel {
	@RequestMapping("signup/login.do")
	public String Login(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../signup/login.jsp");
		return "../main/main.jsp";
	}
}
