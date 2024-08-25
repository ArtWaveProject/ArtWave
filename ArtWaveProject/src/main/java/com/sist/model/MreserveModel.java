package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class MreserveModel {
	@RequestMapping("movie/mreservemain.do")
	  public String mreservemain(HttpServletRequest request,HttpServletResponse response)
	  {
		request.setAttribute("main_jsp", "../movie/mreservemain.jsp");
		return "../main/main.jsp";
	  }
	
	@RequestMapping("movie/movieinfo.do")
	  public String movieinfo(HttpServletRequest request,HttpServletResponse response)
	  {
		  
		  String mno=request.getParameter("mno");
		  MovieVO vo = new MovieVO(); 
		  request.setAttribute("vo", vo);
		  List<MovieVO> moList=MovieDAO.movieTitleData();
		  String rmno=request.getParameter("rmno");
		  request.setAttribute("moList", moList);
		  request.setAttribute("mno", mno);
		  request.setAttribute("rmno", rmno);
		  
		  return "../movie/movieinfo.jsp";
	  }
	@RequestMapping("movie/theaterinfo1.do")
	public String theaterinfo1(HttpServletRequest request, HttpServletResponse response)
	{
		 try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) { ex.printStackTrace();}
		 
		String rmno=request.getParameter("rmno");
		List<Integer> tnolist =MovieDAO.movieTnoData(Integer.valueOf(rmno));
		
		TheaterVO tvo = new TheaterVO();
		List<String> tlList = new ArrayList<String>();
		for (int tno : tnolist) {
			List<String> tlocs = MovieDAO.movieTlocData(tno);
			tlList.addAll(tlocs);
		}
	    
		request.setAttribute("tlList", tlList);
		String sTloc=request.getParameter("selectedTloc");
		request.setAttribute("rmno", rmno);
		request.setAttribute("sTloc", sTloc);
		
		return "../movie/theaterinfo1.jsp";
		
	}
	@RequestMapping("movie/theaterinfo2.do")
	public String theaterinfo2(HttpServletRequest request, HttpServletResponse response)
	{
		try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) { ex.printStackTrace();}
		TheaterVO tvo = new TheaterVO();
		String sTloc=request.getParameter("sTloc");
	    List<String> tnList = MovieDAO.movieTnameData(sTloc);
	    request.setAttribute("tnList", tnList);
	    
	    String sTname=request.getParameter("selectedTname");
	    request.setAttribute("sTname", sTname);
	   
	    return "../movie/theaterinfo2.jsp";
	    
	}
	@RequestMapping("movie/dateinfo.do")
	  public String dateinfo(HttpServletRequest request,HttpServletResponse response)
	  {
		String selectedDate = request.getParameter("rdate"); 
		request.setAttribute("rdate", selectedDate);
		  return "../movie/dateinfo.jsp";
	  }
	
	@RequestMapping("movie/timetableinfo.do")
	public String timetableinfo(HttpServletRequest request, HttpServletResponse response)
	{
		try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) { ex.printStackTrace();} 
		HttpSession session=request.getSession();
		String mno= request.getParameter("rmno");
		String tloc=request.getParameter("sTloc");
		String tname=request.getParameter("sTname");
		String rdate=request.getParameter("rdate");
		
		Map map1=new HashMap();
		map1.put("tloc", tloc);
		map1.put("tname", tname);
		
		List<Integer> tnoList2 = MovieDAO.movieTnoData2(map1);
		//tno 값 list로 얻음
		List<Integer> tdnoList = new ArrayList<Integer>();
		for(int tno : tnoList2)
		{
			List<Integer> tdnos = MovieDAO.movieTdnoData(tno);
			tdnoList.addAll(tdnos);
		}
		
		Map map2=new HashMap();
		for(int tdno : tdnoList)
		{
		map2.put("mno", mno);
		map2.put("tdno", tdno);
		map2.put("rdate", rdate);
		}
		
		MscheduleVO msvo = new MscheduleVO();
		List<MscheduleVO> ttList = MovieDAO.mscheduleData(map2);
		request.setAttribute("mno", mno);
		request.setAttribute("rdate", rdate);
		request.setAttribute("ttList", ttList);
		
		return "../movie/timetableinfo.jsp";
	}
	@RequestMapping("movie/inwoninfo.do")
	  public String inwoninfo(HttpServletRequest request,HttpServletResponse response)
	  {
		  return "../movie/inwoninfo.jsp";
	  }
}
