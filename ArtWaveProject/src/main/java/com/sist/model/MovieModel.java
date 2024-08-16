package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.*;
import controller.RequestMapping;
import com.sist.dao.*;

public class MovieModel {
	@RequestMapping("movie/moviemain.do")
	public String movie_main(HttpServletRequest request,HttpServletResponse response)
	{
		List<MovieVO> tList=MovieDAO.movieTopData();
		request.setAttribute("tList", tList);
		request.setAttribute("main_jsp", "../movie/moviemain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("movie/movielist1.do")
	public String movie_list1(HttpServletRequest request,HttpServletResponse response)
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
		   List<MovieVO> mlList1=MovieDAO.movieListData1(map);
		   int totalpage=MovieDAO.movieTotalPage1();
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("mlList1", mlList1);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   
		   int count1=MovieDAO.movieListCount1();
		   request.setAttribute("count1", count1);
		   
		   request.setAttribute("main_jsp", "../movie/movielist1.jsp");
			return "../main/main.jsp";
	}
	@RequestMapping("movie/movielist2.do")
	public String movie_list2(HttpServletRequest request,HttpServletResponse response)
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
		   List<MovieVO> mlList2=MovieDAO.movieListData2(map);
		   int totalpage=MovieDAO.movieTotalPage2();
		   
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("mlList2", mlList2);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   
		   int count2=MovieDAO.movieListCount2();
		   request.setAttribute("count2", count2);
		   
		   request.setAttribute("main_jsp", "../movie/movielist2.jsp");
			return "../main/main.jsp";
	}
}
