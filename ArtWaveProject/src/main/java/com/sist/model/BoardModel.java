package com.sist.model;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.RequestMapping;

public class BoardModel {
	String[] options= {"", "nick", "subject", "content"};
	@RequestMapping("board/boardList.do")
	public String boardList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		int rowSize=10;
		int start=(curPage-1)*rowSize+1;
		int end=start+rowSize-1;
		String ss=request.getParameter("ss");
		if(ss==null)
			ss="";
		String type=request.getParameter("type");
		if(type==null)
			type="0";
		String option=request.getParameter("option");
		if(option==null)
			option="0";
		if(id==null)
			System.out.println("null");
		else
			System.out.println("not null");
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		map.put("ss", ss);
		map.put("option", options[Integer.parseInt(option)]);
		request.setAttribute("main_jsp", "../board/boardList.jsp");
		request.setAttribute("id", id);
		return "../main/main.jsp";
	}
	@RequestMapping("board/boardInsert.do")
	public String boardInsert(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../board/boardInsert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/boardInsertOk.do")
	public void boardInsertOk(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		try {
			request.setCharacterEncoding("URF-8");
		} catch (UnsupportedEncodingException e) {}
		String id=(String)session.getAttribute("id");
		String nick=(String)session.getAttribute("nick");
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
	}
}
