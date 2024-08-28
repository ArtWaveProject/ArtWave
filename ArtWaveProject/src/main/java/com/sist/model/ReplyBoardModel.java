package com.sist.model;

import java.net.http.HttpRequest;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.*;

import controller.RequestMapping;

import com.sist.dao.*;

public class ReplyBoardModel {
	
	// 문의게시판 리스트
	@RequestMapping("replyboard/list.do")
	   public String replyboard_list(HttpServletRequest request,HttpServletResponse response)
	   {
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   int rowSize=15;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   map.put("start",start);
		   map.put("end", end);
		   
		   List<ReplyBoardVO> list=ReplyBoardDAO.replyBoardListData(map);
		   
		   int count=ReplyBoardDAO.replyBoardRowCount();
		   int totalpage=(int)(Math.ceil(count/15.0));
		   count=count-((curpage*rowSize)-rowSize);
		   
		   request.setAttribute("count", count);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("rbList", list);
		   
		   request.setAttribute("main_jsp", "../replyboard/replyboard_list.jsp");
		   
		   return "../main/main.jsp";
	   }
		
	//문의게시판 쓰기
	   @RequestMapping("replyboard/insert.do")
	   public String replyboard_insert(HttpServletRequest request,HttpServletResponse response)
	   {
		   request.setAttribute("main_jsp", "../replyboard/replyboard_insert.jsp");
		   return "../main/main.jsp"; // 새로운 페이지 제작 
	   }
	  
	   //문의게시판 삽입
	   @RequestMapping("replyboard/insert_ok.do")
	   public String replyboard_insert_ok(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {
			   ex.printStackTrace();
		   }
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   //String name=(String)session.getAttribute("rbname");
		   String subject=request.getParameter("subject");
		   String content=request.getParameter("content");
		   
		   
		   ReplyBoardVO vo=new ReplyBoardVO();
		   vo.setId(id);
		   //vo.setName(name);
		   vo.setSubject(subject);
		   vo.setContent(content);
		   ReplyBoardDAO.replyBoardInsert(vo);
		   return "redirect:../replyboard/list.do";// 재호출 
	   }
	   
	   
	   
	   //------------------------------------- detail ------------------------------------------------------
	   
	   @RequestMapping("replyboard/detail.do")
	   public String replyboard_detail(HttpServletRequest request, HttpServletResponse response)
	   {
		   String no = request.getParameter("no");
		   // 데이터베이스에서 값을 가지고 온다 
		   ReplyBoardVO vo = ReplyBoardDAO.replyDetailData(Integer.parseInt(no));
		   
		   HttpSession session = request.getSession();
		   
		   request.setAttribute("vo", vo);
		   request.setAttribute("main_jsp", "../replyboard/replyboard_detail.jsp");
		   return "../main/main.jsp";
	   }
	
		/*
		 * @RequestMapping("adminpage/replyboard_insert_ok.do") // public String
		 * admingpage_replyboard_insert_ok(HttpServletRequest
		 * request,HttpServletResponse response) // { // try // { //
		 * request.setCharacterEncoding("UTF-8"); // }catch(Exception ex) {} //
		 * HttpSession session=request.getSession(); // String
		 * id=(String)session.getAttribute("id"); // String
		 * name=(String)session.getAttribute("name"); // String
		 * subject=request.getParameter("subject"); // String
		 * content=request.getParameter("content"); // // ReplyBoardVO vo=new
		 * ReplyBoardVO(); // vo.setId(id); // vo.setName(name); //
		 * vo.setSubject(subject); // vo.setContent(content); //
		 * ReplyBoardDAO.replyBoardInsert(vo); // return
		 * "redirect:../adminpage/adminpage_replyboard_list.do";// 재호출 // }
		 */}