package com.sist.model;

import java.io.PrintWriter;
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
		   // 페이지 처리 
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curPage=Integer.parseInt(page);
		   Map map=new HashMap();
		   int rowSize=10;
		   int start=(rowSize*curPage)-(rowSize-1);
		   int end=rowSize*curPage;
		   
		   map.put("start",start);
		   map.put("end", end);
		   
		   List<ReplyBoardVO> list=ReplyBoardDAO.replyBoardListData(map);
		   
		   int count=ReplyBoardDAO.replyBoardRowCount();
		   int totalpage=(int)(Math.ceil(count/10.0));
		   int startPage=(curPage-1)/10*10+1;
		   int endPage=startPage+10-1;
		   if(endPage>totalpage)
		  	 endPage=totalpage;
		   count=count-((curPage*rowSize)-rowSize);
		   for(ReplyBoardVO vo:list) {
		  	 if(vo.getGroup_step()==1) {
		  		 vo.setName("관리자");
		  	 }
		   }
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("count", count);
		   request.setAttribute("curPage", curPage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("rbList", list);
		   request.setAttribute("main_jsp", "../replyboard/replyboard_list2.jsp");
		   
		   return "../main/main.jsp";
	   }
		
	// 문의게시판 쓰기
	   @RequestMapping("replyboard/insert.do")
	   public String replyboard_insert(HttpServletRequest request,HttpServletResponse response)
	   {
		   request.setAttribute("main_jsp", "../replyboard/replyboard_insert.jsp");
		   return "../main/main.jsp"; // 새로운 페이지 제작 
	   }
	  
	   // 문의게시판 삽입
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
		   String name=(String)session.getAttribute("nickname");
		   String subject=request.getParameter("subject");
		   String content=request.getParameter("content");
		   
		   
		   ReplyBoardVO vo = new ReplyBoardVO();
		   vo.setId(id);
		   
		   vo.setName(name);
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
		 */
	   @RequestMapping("replyboard/delete.do")
	   public String replyboard_delete(HttpServletRequest request,HttpServletResponse response)
	    {
	    	request.setAttribute("no", request.getParameter("no"));
	    	request.setAttribute("main_jsp", "../replyboard/delete.jsp");
	    	return "../main/main.jsp";
	    }
	   
	   @RequestMapping("replyboard/delete_ok.do")
	   public void board_delete_ok(HttpServletRequest request,HttpServletResponse response)
	    {
	    	String no=request.getParameter("no");
	    	String pwd=request.getParameter("pwd");
	    	
	    	// DAO연동 
			/* boolean bCheck=ReplyBoardDAO.adminReplyDelete(Integer.parseInt(no), pwd); */
	    	// => 이동 
			/*
			 * try { // Ajax 처리 //response.setContentType("text/html;charset=UTF-8");
			 * 
			 * if(bCheck==true)// 비밀번호가 맞는 경우 {} else {} }catch(Exception ex){
			 * 
			 * }
			 */
	    }
	   @RequestMapping("replyboard/boardUpdate.do")
	   public String boardUpdate(HttpServletRequest request, HttpServletResponse response) {
	  	 String no=request.getParameter("no");
	  	 ReplyBoardVO vo=ReplyBoardDAO.replyDetailData(Integer.parseInt(no));
	  	 request.setAttribute("detail", vo);
    	request.setAttribute("main_jsp", "../replyboard/boardUpdate.jsp");
	  	 return "../main/main.jsp";
	   }
	   @RequestMapping("replyboard/boardUpdateOk.do")
	   public void boardUpdateOk(HttpServletRequest request, HttpServletResponse response) {
	  	 System.out.println("check");
	  	 try {
				request.setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
	  	 String no=request.getParameter("no");
	  	 String subject=request.getParameter("subject");
	  	 String content=request.getParameter("content");
	  	 ReplyBoardVO vo=new ReplyBoardVO();
	  	 vo.setNo(Integer.parseInt(no));
	  	 vo.setSubject(subject);
	  	 vo.setContent(content);
	  	 ReplyBoardDAO.replyBoardUpdate(vo);
	   }
	   @RequestMapping("replyboard/boardDelete.do")
	   public static void replyBoardDelete(HttpServletRequest request, HttpServletResponse response) {
	  	 String no=request.getParameter("no");
	  	 String result=ReplyBoardDAO.replyBoardDelete(Integer.parseInt(no));
	  	 try {
				PrintWriter out=response.getWriter();
				out.write(result);
			} catch (Exception e) {}
	   }
	   
	   

}