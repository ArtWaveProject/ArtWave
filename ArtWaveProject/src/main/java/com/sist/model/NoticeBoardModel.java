package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.RequestMapping;

public class NoticeBoardModel {
	private String[] types={"","일반공지","Books공지","Music공지","잔체공지"};
	@RequestMapping("notice/list.do")
	public String noticeboard_list(HttpServletRequest request, HttpServletResponse response)
	{
		
		return "../main/main.jsp";
	}
	
	
	// 상세보기 -----------------------------------------------------------------
}
