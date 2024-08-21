package com.sist.model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

import controller.RequestMapping;

public class BoardModel {
	String[] options = { "", "nick", "subject", "content" };

	@RequestMapping("board/boardList.do")
	public String boardList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curPage - 1) * rowSize + 1;
		int end = start + rowSize - 1;
		String ss = request.getParameter("ss");
		if (ss == null)
			ss = "";
		String type = request.getParameter("type");
		if (type == null)
			type = "";
		String option = request.getParameter("option");
		if (option == null)
			option = "0";
		if (id == null)
			System.out.println("null");
		else
			System.out.println("not null");
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		map.put("ss", ss);
		map.put("option", options[Integer.parseInt(option)]);
		List<BoardVO> list = new ArrayList<BoardVO>();
		int count = 0;
		if (option.equals("0")) {
			list = BoardDAO.boardListData(map);
			count = BoardDAO.boardTotalCount(type);
		} else {
			list = BoardDAO.boardFindListData(map);
			count = BoardDAO.boardFindTotalCount(map);
		}
		System.out.println(count);
		int totalPage = (int) (Math.ceil(count / 10.0));
		int startPage = (curPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		count = count - (curPage - 1) * 10;

		request.setAttribute("type", type);
		request.setAttribute("count", count);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("bList", list);
		request.setAttribute("main_jsp", "../board/boardList.jsp");
		request.setAttribute("id", id);
		return "../main/main.jsp";
	}

	@RequestMapping("board/boardInsert.do")
	public String boardInsert(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("main_jsp", "../board/boardInsert.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("board/boardInsertOk.do")
	public void boardInsertOk(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("URF-8");
		} catch (UnsupportedEncodingException e) {
		}
		String id = (String) session.getAttribute("id");
		String nick = (String) session.getAttribute("nickname");
		String type = request.getParameter("type");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String photo = request.getParameter("photo");
		if (photo == null)
			photo = "없음";
		BoardVO vo = new BoardVO();
		vo.setFbphoto(photo);
		vo.setId(id);
		vo.setNick(nick);
		vo.setCno(Integer.parseInt(type));
		vo.setFbsubject(subject);
		vo.setContent(content);
		BoardDAO.boardInsert(vo);
	}
}
