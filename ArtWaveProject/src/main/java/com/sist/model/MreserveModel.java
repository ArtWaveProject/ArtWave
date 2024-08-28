package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class MreserveModel {
	@RequestMapping("movie/mreservemain.do")
	public String mreservemain(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../movie/mreservemain.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("movie/movieinfo.do")
	public String movieinfo(HttpServletRequest request, HttpServletResponse response) {
		try {
			String mno = request.getParameter("mno");
			request.setAttribute("mno", mno);
			MovieVO vo = new MovieVO();
			request.setAttribute("vo", vo);
			List<MovieVO> moList = MovieDAO.movieTitleData();
			request.setAttribute("moList", moList);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "../movie/movieinfo.jsp";
	}

	@RequestMapping("movie/theaterinfo1.do")
	public String theaterinfo1(HttpServletRequest request, HttpServletResponse response) {
		String mno = request.getParameter("mno");
		List<String> tlList = MovieDAO.movieTlocData(Integer.parseInt(mno));
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		String tloc = request.getParameter("tloc");
		request.setAttribute("tlList", tlList);
		request.setAttribute("tloc", tloc);

		return "../movie/theaterinfo1.jsp";

	}

	@RequestMapping("movie/theaterinfo2.do")
	public String theaterinfo2(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		String tloc = request.getParameter("tloc");
		List<String> tnList = MovieDAO.movieTnameData(tloc);
		String tname = request.getParameter("tname");
		request.setAttribute("tloc", tloc);
		request.setAttribute("tnList", tnList);
		request.setAttribute("tname", tname);

		return "../movie/theaterinfo2.jsp";

	}

	@RequestMapping("movie/dateinfo.do")
	public String dateinfo(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		String tloc = request.getParameter("tloc");
		String tname = request.getParameter("tname");
		String rdate = request.getParameter("rdate");
		request.setAttribute("rdate", rdate);
		request.setAttribute("tloc", tloc);
		request.setAttribute("tname", tname);

		return "../movie/dateinfo.jsp";
	}

	@RequestMapping("movie/timetableinfo.do")
	public String timetableinfo(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		String tloc = request.getParameter("tloc");
		String tname = request.getParameter("tname");

		Map map1 = new HashMap();
		map1.put("tloc", tloc);
		map1.put("tname", tname);

		int tno = MovieDAO.movieTnoData2(map1);
		List<Integer> tdnoList = MovieDAO.movieTdnoData(tno);

		String mno = request.getParameter("mno");
		String rdate = request.getParameter("rdate");

		List<MscheduleVO> ttList = new ArrayList<MscheduleVO>();
		for (int tdno : tdnoList) {
			Map map2 = new HashMap();
			map2.put("mno", Integer.parseInt(mno));
			map2.put("tdno", tdno);
			map2.put("rdate", rdate);

			List<MscheduleVO> schedules = MovieDAO.mscheduleData(map2);
			ttList.addAll(schedules);
		}

		request.setAttribute("mno", mno);
		request.setAttribute("rdate", rdate);
		request.setAttribute("ttList", ttList);

		return "../movie/timetableinfo.jsp";
	}

	@RequestMapping("movie/inwoninfo.do")
	public String inwoninfo(HttpServletRequest request, HttpServletResponse response) {
		return "../movie/inwoninfo.jsp";
	}

	@RequestMapping("movie/movieseat.do")
	  public String movieseat(HttpServletRequest request,HttpServletResponse response)
	  {
		try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {ex.printStackTrace();}
		try {
		 String mno=request.getParameter("mno");
		  String mtitle=request.getParameter("movietitle");
		  String tloc=request.getParameter("tloc");
		  String tname=request.getParameter("tname");
		  String date=request.getParameter("date");
		  String tdname=request.getParameter("tdname");
		  String time=request.getParameter("time");
		  String inwon=request.getParameter("inwon");
		  String seats=request.getParameter("seats");
		  		  
		     request.setAttribute("mno", mno);
			 request.setAttribute("mtitle", mtitle);
			 request.setAttribute("tloc", tloc);
			 request.setAttribute("tname", tname);
			 request.setAttribute("date", date);
			 request.setAttribute("tdname", tdname);
			 request.setAttribute("time", time);
			 request.setAttribute("inwon", inwon);
			 request.setAttribute("rinwon", inwon);
			 request.setAttribute("seats", seats);
			
			 
		}catch(Exception ex) {ex.printStackTrace();} 
		
		request.setAttribute("main_jsp", "../movie/movieseat.jsp");
		return "../main/main.jsp";
	  }

	@RequestMapping("movie/reserveok.do")
	public String reserve_ok(HttpServletRequest request, HttpServletResponse response) {
		// 예약정보
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {
		}
		try {
			String mno = request.getParameter("mno");
			String mtitle = request.getParameter("mtitle");
			String tname = request.getParameter("tname");
			String date = request.getParameter("date");
			String tdname = request.getParameter("tdname");
			String time = request.getParameter("time");
			String inwon = request.getParameter("inwon");
			String selectedSeats = request.getParameter("seats");
			String totalPrice = request.getParameter("price");
			System.out.println(totalPrice);
			System.out.println(selectedSeats);
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
		
			ReserveVO vo = new ReserveVO();
			vo.setId(id);
			vo.setMno(Integer.parseInt(mno));
			vo.setMtitle(mtitle);
			vo.setTdname(tdname);
			vo.setTname(tname);
			vo.setDay(date);
			vo.setTime(time);
			vo.setInwon(Integer.parseInt(inwon));
			vo.setSno(selectedSeats);
			vo.setPrice(Integer.parseInt(totalPrice));

			MovieDAO.reserveInsert(vo);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		// request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "redirect:../movie/mreservemain.do";
	}
}
