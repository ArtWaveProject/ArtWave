package com.sist.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

public class MemberModel {
	@RequestMapping("member/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		return "../signup/login.jsp";
	}
	@RequestMapping("member/idCheck.do")
	public void signUpIdCheck(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id=request.getParameter("id");
			String result=MemberDAO.memberIdCheck(id);
			PrintWriter out=response.getWriter();
			out.write(result);
		} catch (Exception e) {
		}
		
	}
	@RequestMapping("member/nickCheck.do")
	public void signUpNickCheck(HttpServletRequest request, HttpServletResponse response) {
		try {
			String nickname=request.getParameter("nickname");
			String result=MemberDAO.memberNickCheck(nickname);
			PrintWriter out=response.getWriter();
			out.write(result);
		} catch (Exception e) {
		}
		
	}
	@RequestMapping("member/emailCheck.do")
	public void signUpEmailCheck(HttpServletRequest request, HttpServletResponse response) {
		try {
			String email=request.getParameter("email");
			System.out.print(email);
			String result=MemberDAO.memberEmailCheck(email);
			PrintWriter out=response.getWriter();
			out.write(result);
		} catch (Exception e) {
		}
		
	}
	@RequestMapping("member/signUp.do")
	public void signUp(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		MemberVO vo=new MemberVO();
		
		vo.setId(request.getParameter("id"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setName(request.getParameter("name"));
		vo.setPhone(request.getParameter("phone"));
		vo.setSex(request.getParameter("sex"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setDbbirthday(request.getParameter("birthday"));
		vo.setPost(request.getParameter("post"));
		vo.setAddr1(request.getParameter("addr1"));
		vo.setAddr2(request.getParameter("addr2"));
		vo.setEmail(request.getParameter("email"));
		
		MemberDAO.memberInsert(vo);
	}
}
