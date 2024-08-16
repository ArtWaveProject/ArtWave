package com.sist.dao;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.ReplyBoardVO;

import controller.RequestMapping;


import com.sist.dao.*;
import com.sist.vo.*;

public class AdminModel {
	@RequestMapping("adminpage/reply_list.do")
	   public String reply_list(HttpServletRequest request,HttpServletResponse response)
	   {
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   
		   int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   int rowSize=15;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   map.put("start", start);
		   map.put("end", end);
		   
		   List<ReplyBoardVO> list=ReplyBoardDAO.adminReplyBoardListData(map);
		   int count=ReplyBoardDAO.replyBoardRowCount();
		   int totalpage=(int)(Math.ceil(count/15.0));
		   
		   request.setAttribute("arList", list);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("count", count);
		   
		   request.setAttribute("admin_jsp", "../adminpage/adminpage_reply_list.jsp");
		   request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		   
		   return "../main/main.jsp";
	   }
	   @RequestMapping("adminpage/reply_insert.do")
	   public String reply_insert(HttpServletRequest request,HttpServletResponse response)
	   {
		   String no=request.getParameter("no");
		   request.setAttribute("no", no);
		   request.setAttribute("admin_jsp", "../adminpage/adminpage_reply_insert.jsp");
		   request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		   
		   return "../main/main.jsp";
	   }
	   
	  
}
