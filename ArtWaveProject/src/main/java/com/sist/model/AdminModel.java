package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import controller.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;

public class AdminModel {
	// private String[] types={"","일반공지","Books공지","Music공지","잔체공지"};
	String[] types = { "", "자유", "영화", "도서", "음악", "영화", "도서", "음악" };

	// -----------------------------------------admin연결-----------------------------------------
	@RequestMapping("adminpage/adminpage_main.do")
	public String adminpage_main(HttpServletRequest request, HttpServletResponse response) {
		int mBuy=AdminDAO.todayBuyRecord(1);
		int bBuy=AdminDAO.todayBuyRecord(2);
		int aBuy=AdminDAO.todayBuyRecord(3);
		int reserveCount=AdminDAO.todayReserve();
		int noneAccept=AdminDAO.reserveNoneAccept();
		int visit=AdminDAO.todayvisitRecord();
		List<Integer> list=AdminDAO.visitWeek();
		List<Date> week=new ArrayList<Date>();
		for(int i=6;i>=0;i--) {
			Calendar calendar=Calendar.getInstance();
			calendar.add(Calendar.DATE, -i);
			week.add(calendar.getTime());
		}
		int noneAnswer=AdminDAO.noneAnswer();
		int visitMax=AdminDAO.visitMax();
		request.setAttribute("noneAnswer", noneAnswer);
		request.setAttribute("visitMax", visitMax);
		request.setAttribute("mBuy", mBuy);
		request.setAttribute("bBuy", bBuy);
		request.setAttribute("aBuy", aBuy);
		request.setAttribute("reserveCount", reserveCount);
		request.setAttribute("noneAccept", noneAccept);
		request.setAttribute("visit", visit);
		request.setAttribute("list", list);
		request.setAttribute("week", week);
		request.setAttribute("admin_jsp", "../adminpage/adminpage_home.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");

		return "../main/main.jsp";
	}

	// ----------------------------------------- 회원관리
	// -----------------------------------------
	// 회원 리스트
	@RequestMapping("adminpage/member_list.do")
	public String member_list(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";

		int curpage = Integer.parseInt(page);
		int rowSize = 15;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<MemberVO> list = AdminDAO.memberListData(map);
		int count = AdminDAO.memberRowCount();
		int totalpage = (int) (Math.ceil(count / 15.0));
		count = count - ((curpage * rowSize) - rowSize);

		request.setAttribute("curPage", curpage);
		request.setAttribute("totalPage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("memberList", list);

		request.setAttribute("admin_jsp", "../adminpage/adminpage_member_list.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");

		return "../main/main.jsp";
	}

	// 회원 상세정보

	// -----------------------------------------고객센터--------------------------------------
	// 공지 목록
	@RequestMapping("adminpage/noticeboard_list.do")
	public String noticeboard_list(HttpServletRequest request, HttpServletResponse response) {

		return "../main/main.jsp";
	}
	/////////////////////////////////////////// 묻고답하기 게시판
	/////////////////////////////////////////// 목록//////////////////////////////////////////////

	@RequestMapping("adminpage/reply_list.do")
	public String reply_list(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";

		int curpage = Integer.parseInt(page);

		Map map = new HashMap();
		int rowSize = 15;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		map.put("start", start);
		map.put("end", end);

		List<ReplyBoardVO> list = ReplyBoardDAO.adminReplyBoardListData(map);
		int count = ReplyBoardDAO.adminReplyCount();
		System.out.println(count);
		int totalpage = (int) (Math.ceil(count / 15.0));

		request.setAttribute("arList", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);

		// request.setAttribute("main_jsp", "../replyboard/replyboard_list.jsp");
		request.setAttribute("admin_jsp", "../adminpage/adminpage_reply_list2.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");

		return "../main/main.jsp";
	}

	// 묻고답하기 insert(admin)
	@RequestMapping("adminpage/reply_insert.do")
	public String reply_insert(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		request.setAttribute("no", no);

		ReplyBoardVO vo = ReplyBoardDAO.replyDetailData(Integer.parseInt(no));

		request.setAttribute("subject", vo.getSubject());
		request.setAttribute("content", vo.getContent());

		request.setAttribute("vo", vo);

		request.setAttribute("admin_jsp", "../adminpage/adminpage_reply_insert.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");

		return "../main/main.jsp";
	}

	// 묻고답하기 insert_ok
	@RequestMapping("adminpage/reply_insert_ok.do")
	public String reply_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		try {
			String no = request.getParameter("no");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");

			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			String name = (String) session.getAttribute("nickname");
			ReplyBoardVO rvo = ReplyBoardDAO.adminReplyInfoData(Integer.parseInt(no));

			ReplyBoardVO vo = new ReplyBoardVO();
			vo.setId(id);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setName(name);
			vo.setGroup_id(rvo.getGroup_id());

			ReplyBoardDAO.adminReplyBoardInsert(Integer.parseInt(no), vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:../adminpage/reply_list.do";
	}

	@RequestMapping("admin/detail.do")
	public String replyboard_detail(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		// 데이터베이스에서 값을 가지고 온다
		ReplyBoardVO vo = ReplyBoardDAO.replyDetailData(Integer.parseInt(no));

		HttpSession session = request.getSession();

		request.setAttribute("vo", vo);

		request.setAttribute("admin_jsp", "../adminpage/adminpage_reply_detail.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("adminpage/notice_list.do")
	public String notice_list(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
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
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		map.put("ss", ss);
		List<BoardVO> list = new ArrayList<BoardVO>();
		int count = 0;
		list = BoardDAO.noticeBoardListData(map);
		count = BoardDAO.noticeBoardTotalCount(type);
		for (BoardVO vo : list) {
			vo.setTypeDetail(types[vo.getCno()]);
			vo.setNick("관리자");
		}
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
		request.setAttribute("id", id);
		request.setAttribute("admin_jsp", "../adminpage/adminPageNoticeList.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/noticeBoardInsert.do")
	public String noticeBoardInsert(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("admin_jsp", "../adminpage/boardInsert.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/boardDetail.do")
	public String boardDetail(HttpServletRequest request, HttpServletResponse response) {
		String fbno = request.getParameter("fbno");
		BoardVO vo = BoardDAO.boardDetailData(Integer.parseInt(fbno));
		if(vo.getCno()>4) {
			vo.setNick("관리자");
		}
		int count = BoardDAO.boardReplyCount(Integer.parseInt(fbno));
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if (id == null)
			id = "";
		request.setAttribute("id", id);
		request.setAttribute("count", count);
		request.setAttribute("type", types[vo.getCno()]);
		request.setAttribute("detail", vo);
		request.setAttribute("admin_jsp", "../adminpage/adminNoticeDetail.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
	// 묻고답하기 delete
	// --------------------------------------------------------------------
	@RequestMapping("adminpage/reply_delete.do")
	public String reply_delete(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		String group_id = request.getParameter("group_id");
		// DB연동
		// ReplyBoardDAO.adminReplyDelete(Integer.parseInt(no),Integer.parseInt(group_id));
		return "redirect:../adminpage/reply_list.do";
	}
	@RequestMapping("admin/replyInfo.do")
	public void replyInfo(HttpServletRequest request, HttpServletResponse response) {
		String gi=request.getParameter("gi");
		ReplyBoardVO vo=ReplyBoardDAO.replyInfo(Integer.parseInt(gi));
		System.out.println(gi);
		JSONObject obj=new JSONObject();
		obj.put("no", vo.getNo());
		obj.put("subject", vo.getSubject());
		obj.put("content", vo.getContent());
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(obj.toJSONString());
		} catch (Exception e) {}
	}
	@RequestMapping("admin/replyDelete.do")
	public void replyDelete(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String rno=request.getParameter("rno");
		ReplyBoardDAO.adminReplyBoardDelete(Integer.parseInt(no), Integer.parseInt(rno));
	}
	@RequestMapping("admin/memberGrade.do")
	public void memberGrade(HttpServletRequest request, HttpServletResponse response) {
		String strType=request.getParameter("type");
		String id=request.getParameter("id");
		int grade=MemberDAO.memberGrade(id);
		int type=Integer.parseInt(strType);
		String result="";
		if(grade==1&&type==2) {
			result="NO";
		}
		else if (grade==3&&type==1) {
			result="NO";
		}
		else {
			MemberDAO.memberGradeUpdate(id, type);
			result="OK";
		}
		grade=MemberDAO.memberGrade(id);
		JSONObject obj=new JSONObject();
		obj.put("grade", grade);
		obj.put("result", result);
		try {
			PrintWriter out=response.getWriter();
			out.write(obj.toJSONString());
		} catch (Exception e) {}
	}
	@RequestMapping("admin/boardUpdate.do")
	public String boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		String fbno = request.getParameter("fbno");
		BoardVO vo = BoardDAO.boardDetailData(Integer.parseInt(fbno));
		request.setAttribute("detail", vo);
		request.setAttribute("admin_jsp", "../adminpage/adminUpdate.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
}