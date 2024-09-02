package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.AdminDAO;

import controller.*;

public class MainModel {
	@RequestMapping("main/main.do")
	public String mainHome(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../movie/moviemain.jsp");
		return "../main/main.jsp";
		 
	}
	@RequestMapping("main/visit.do")
	public String visit(HttpServletRequest request, HttpServletResponse response) {
		try {
			AdminDAO.visitInsert();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:../movie/moviemain.do";
	}
}
