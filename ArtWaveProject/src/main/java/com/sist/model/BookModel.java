package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;
import com.sist.vo.*;

import controller.RequestMapping;
public class BookModel {
	   @RequestMapping("book/list.do")
	   public String book_list(HttpServletRequest request,HttpServletResponse response)
	   {
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   int rowSize=20;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   map.put("start", start);
		   map.put("end", end);
		   List<BookVO> bList=BookDAO.bookListData(map);
		   int totalpage=BookDAO.bookTotalPage();
		   
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("bList", bList);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);

		   int count=BookDAO.bookListCount();
		   request.setAttribute("count", count);
		   
		   request.setAttribute("main_jsp", "../book/list.jsp");
		   return "../main/main.jsp";
	   }  
}
