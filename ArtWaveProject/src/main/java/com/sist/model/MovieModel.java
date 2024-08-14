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
	
	
}
