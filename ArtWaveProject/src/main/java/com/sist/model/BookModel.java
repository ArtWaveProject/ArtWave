package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;
import com.sist.vo.*;

import controller.RequestMapping;
public class BookModel {
	private String[] genres={"","가정 살림","국어 외국어 사전","건강 취미","에세이","청소년","사회 정치","초등참고서","경제 경영","역사","어린이",
			                 "인문","자연과학","만화/라이트노벨","유아","대학교재","자기계발","예술","IT 모바일","소설/시/희곡","종교",
			                 "수험서 자격증","중고등참고서","잡지","여행","인물","전집","ELT/사전","유아/어린이","인문 사회","유아 어린이",
			                 "해외잡지","ELT 사전","예술 대중문화","문학/소설","경영/인문","프랑스도서","대학교재/전문서적","문학 소설","취미 라이프스타일","컴퓨터"};
	
	   @RequestMapping("book/list.do")
	   public String book_list(HttpServletRequest request,HttpServletResponse response)
	   {
		   try {
			   request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
 		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   int rowSize=20;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   String genre=request.getParameter("genre");
		   String search=request.getParameter("search");
		   
		   if(genre==null)genre= "0";
		   if(search==null)search= "";
		   
		   Map<String, Object> map=new HashMap();
		   map.put("genre", genres[Integer.parseInt(genre)]);
		   map.put("search", search);
		   map.put("start", start);
		   map.put("end", end);
		   
		   List<BookVO> hList=BookDAO.bookNewData(map);
		   List<BookVO> bList=BookDAO.bookListData(map);
		   int totalpage=BookDAO.bookFindTotalPage(map);

		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("genres", genres);
		   request.setAttribute("hList", hList);
		   request.setAttribute("bList", bList);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("search", search);
		   request.setAttribute("genre", genre);

		   int count=BookDAO.bookListCount(genres[Integer.parseInt(genre)]);
		   request.setAttribute("count", count);
		   
		   request.setAttribute("main_jsp", "../book/list.jsp");
		   return "../main/main.jsp";
	   }  
	   @RequestMapping("book/detail.do")
	   public String book_detail(HttpServletRequest request,HttpServletResponse response)
	   {
	 	  String bno=request.getParameter("bno");
	 	  BookVO vo=BookDAO.bookDetailData(Integer.parseInt(bno));
	 	  
	 	  request.setAttribute("vo", vo);
	 	  request.setAttribute("main_jsp", "../book/detail.jsp");
	 	  return "../main/main.jsp";
	   }
	   @RequestMapping("book/new.do")
	   public String book_new(HttpServletRequest request,HttpServletResponse response)
	   {
 		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   int rowSize=20;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   Map map=new HashMap();
		   map.put("start", start);
		   map.put("end", end);
		   
		   List<BookVO> nList=BookDAO.bookNewData(map);
		   int totalpage=BookDAO.bookNewListCount();

		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("nList", nList);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);

		   
		   request.setAttribute("main_jsp", "../book/new.jsp");
		   return "../main/main.jsp";
	   }  
	   
}
