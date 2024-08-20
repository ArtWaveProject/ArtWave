package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.MovieLikeDAO;

import controller.RequestMapping;

public class MovieLikeModel {
	@RequestMapping("movie/movieLikeCheck.do")
	public void movieLikeCheck(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mno = request.getParameter("mno");
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("mno", Integer.parseInt(mno));
		map.put("id", id);
		int count = MovieLikeDAO.movieLikeCheck(map);
		try {
			PrintWriter out = response.getWriter();
			if (count == 0) {
				out.write("NO");
			} else {
				out.write("OK");
			}
		} catch (Exception e) {
		}
	}
	@RequestMapping("movie/movieLikeOn.do")
	public void movieLikeOn(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mno = request.getParameter("mno");
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("mno", Integer.parseInt(mno));
		map.put("id", id);
		int result = MovieLikeDAO.movieLikeOn(map);
		System.out.println(result);
		try {
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(result));
		} catch (Exception e) {
		}
	}
	@RequestMapping("movie/movieLikeOff.do")
	public void movieLikeOff(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mno = request.getParameter("mno");
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("mno", Integer.parseInt(mno));
		map.put("id", id);
		int result = MovieLikeDAO.movieLikeOff(map);
		try {
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(result));
		} catch (Exception e) {
		}
	}
}
