package com.sist.model;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.RequestMapping;

public class BoardModel {
	String[] options= {"", "nick", "subject", "content"};
	@RequestMapping("board/boardList.do")
	public String boardList(HttpServletRequest request, HttpServletResponse response) {
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
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		map.put("ss", ss);
		map.put("option", options[Integer.parseInt(option)]);
		request.setAttribute("main_jsp", "../board/boardList.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/boardInsert.do")
	public String boardInsert(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../board/boardInsert.jsp");
		return "../main/main.jsp";
	}
}
