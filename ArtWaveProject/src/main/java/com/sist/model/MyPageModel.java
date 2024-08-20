package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

public class MyPageModel {
   @RequestMapping("mypage/mypage_main.do")
   public String mypage_main(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("title", "마이페이지 홈");
	   request.setAttribute("mypage_jsp", "../mypage/mypage_home.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/my_cart.do")
   public String my_cart(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("title", "장바구니");
	   request.setAttribute("mypage_jsp", "../mypage/my_cart.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/my_change_pwd.do")
   public String my_change_pwd(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("title", "비밀번호 변경");
	   request.setAttribute("mypage_jsp", "../mypage/my_change_pwd.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/my_edit_member.do")
   public String my_edit_member(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("title", "회원 정보 수정");
	   request.setAttribute("mypage_jsp", "../mypage/my_edite_member.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/my_like.do")
   public String my_like(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("title", "좋아요");
	   request.setAttribute("mypage_jsp", "../mypage/my_like.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/my_member_exit.do")
   public String my_member_exit(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("title", "회원 탈퇴");
	   request.setAttribute("mypage_jsp", "../mypage/my_member_exit.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/my_playlist.do")
   public String my_playlist(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("title", "플레이 리스트");
	   request.setAttribute("mypage_jsp", "../mypage/my_playlist.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/my_reserve.do")
   public String my_reserve(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("title", "나의 예약");
	   request.setAttribute("mypage_jsp", "../mypage/my_reserve.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/my_text.do")
   public String my_text(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("title", "내가 쓴 글");
	   request.setAttribute("mypage_jsp", "../mypage/my_text.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   
   
   
   
   
   @RequestMapping("member/join_update.do")
   public String mypage_join_update(HttpServletRequest request,HttpServletResponse response)
   {
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   MemberVO vo=MemberDAO.memberUpdateData(id);
	   
	   String phone=vo.getPhone();
	   phone=phone.substring(phone.indexOf(")")+1);
	   vo.setPhone(phone);
	   request.setAttribute("vo", vo);
	   request.setAttribute("title","회원 수정");
	   request.setAttribute("mypage_jsp", "../member/join_update.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("member/join_update_ok.do")
   public String mypage_join_update_ok(HttpServletRequest request,HttpServletResponse response)
   {
	      try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String id=request.getParameter("id");
		  String pwd=request.getParameter("pwd");
		  String name=request.getParameter("name");
		  String sex=request.getParameter("sex");
		  String birthday=request.getParameter("birthday");
		  String post=request.getParameter("post");
		  String addr1=request.getParameter("addr1");
		  String addr2=request.getParameter("addr2");
		  String email=request.getParameter("email");
		  String msg=request.getParameter("msg");
		  String phone1=request.getParameter("phone1");
		  String phone2=request.getParameter("phone2");
		  
		  MemberVO vo=new MemberVO();
		  vo.setId(id);
		  vo.setPwd(pwd);
		  vo.setName(name);
		  vo.setSex(sex);
		  vo.setEmail(email);
		  vo.setDbbirthday(birthday);
		  vo.setPost(post);
		  vo.setAddr1(addr1);
		  vo.setAddr2(addr2);
		  vo.setMsg(msg);
		  vo.setPhone(phone1+")"+phone2);
		  
		  boolean bCheck=MemberDAO.memberUpdate(vo);
		  request.setAttribute("result", bCheck);
	   return "../member/join_update_ok.jsp";
   }
}