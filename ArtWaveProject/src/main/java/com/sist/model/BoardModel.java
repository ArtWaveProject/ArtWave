package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.RequestMapping;

public class BoardModel {
	@RequestMapping("board/boardList.do")
	public String boardList(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../board/boardList.jsp");
		return "../main/main.jsp";
	}
}
