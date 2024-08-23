package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	  public String reservemovie(HttpServletRequest request,HttpServletResponse response)
	  {
		  String mno=request.getParameter("mno");
		  MovieVO vo = new MovieVO(); 
		  request.setAttribute("vo", vo);
		  List<MovieVO> moList=MovieDAO.movieTitleData();
		  request.setAttribute("moList", moList);
		  return "../movie/movieinfo.jsp";
	  }
	@RequestMapping("movie/dateinfo.do")
	  public String dateinfo(HttpServletRequest request,HttpServletResponse response)
	  {
		  String strYear=request.getParameter("year");
		  String strMonth=request.getParameter("month");
		  String strDay="";
		  
		  String msno=request.getParameter("msno");
		  String mno=request.getParameter("mno");
		  String tdno=request.getParameter("tdno");
		  Date date=new Date();
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		  String today=sdf.format(date);
		  StringTokenizer st=new StringTokenizer(today,"-");
		  
		  String sy=st.nextToken();
		  String sm=st.nextToken();
		  strDay=st.nextToken();
		  /////////////////// 오늘 날짜만 저장 
		  String tday=strDay;
		  String tyear=sy;
		  String tmonth=sm;
		  ///////////////////
		  if(strYear==null)
		  {
			  strYear=sy;
		  }
		  if(strMonth==null)
		  {
			  strMonth=sm;
		  }
		
		  int year=Integer.parseInt(strYear);
		  int month=Integer.parseInt(strMonth);
		  int day=Integer.parseInt(strDay);
		  
		  // 요일 구하기 / 마지막 날 
		  Calendar cal=Calendar.getInstance();
		  cal.set(Calendar.YEAR, year);
		  cal.set(Calendar.MONTH, month-1);
		  cal.set(Calendar.DATE, 1);
		  
		  int week=cal.get(Calendar.DAY_OF_WEEK);
		  week=week-1;
		  
		  int lastday=cal.getActualMaximum(Calendar.DATE);
		  
		  request.setAttribute("year", year);
		  request.setAttribute("month", month);
		  request.setAttribute("day", day);
		  request.setAttribute("week", week);
		  request.setAttribute("lastday", lastday);
		  request.setAttribute("msno", msno);
		  MscheduleVO msvo = new MscheduleVO(); 
		  request.setAttribute("msvo", msvo);
		  
		  Map map=new HashMap();
		  map.put("mno",Integer.parseInt(mno));
		  map.put("tdno",Integer.parseInt(tdno));
		  
		  // 예약 가능한 날 => 1,2,3,19,20....
		  if(msno!=null)
		  {
			  List<MscheduleVO> mrdList=MovieDAO.movieReserveDayData(map);
			  request.setAttribute("mrdList", mrdList);
		   
		  }
		 
		  String[] weeks={"일","월","화","수","목","금","토"};
		  request.setAttribute("weeks", weeks);
		  return "../movie/dateinfo.jsp";
	  }
}
