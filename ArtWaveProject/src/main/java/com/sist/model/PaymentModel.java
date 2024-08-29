package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.dao.MemberDAO;
import com.sist.dao.PaymentDAO;
import com.sist.vo.MemberVO;

import controller.RequestMapping;

/*
PNO
ID
COUNT
PRICE
BUYDATE
POST
ADDR1
ADDR2
TYPE
 */
public class PaymentModel {
	String[] types= {"", "음악", "도서", "앨범"};
	@RequestMapping("payment/paymentInsert.do")
	public void musicBuy(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		MemberVO vo = MemberDAO.memberinfo(id);
		String count = request.getParameter("account");
		String price = request.getParameter("price");
		String type = request.getParameter("type");
		String gno = request.getParameter("gno");
		String title=request.getParameter("title");
		Map map = new HashMap();
		System.out.println(vo.getPost());
		map.put("ptitle", title);
		map.put("gno", Integer.parseInt(gno));
		map.put("id", id);
		map.put("count", Integer.parseInt(count));
		map.put("price", Integer.parseInt(price));
		map.put("post", vo.getPost());
		map.put("addr1", vo.getAddr1());
		map.put("addr2", vo.getAddr2());
		map.put("type", Integer.parseInt(type));
		PaymentDAO.paymentInsert(map);
		JSONObject obj = new JSONObject();
		obj.put("name", vo.getName());
		obj.put("email", vo.getEmail());
		obj.put("address", vo.getAddr1());
		obj.put("post", vo.getPost());
		obj.put("phone", vo.getPhone());
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(obj.toJSONString());
		} catch (Exception e) {
		}
	}
	@RequestMapping("payment/paymentCheck.do")
	public void paymentCheck(HttpServletRequest request, HttpServletResponse response) {
		String gno=request.getParameter("gno");
		String type=request.getParameter("type");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		map.put("id", id);
		map.put("gno", Integer.parseInt(gno));
		map.put("type", Integer.parseInt(type));
		int count=PaymentDAO.paymentCheck(map);
		try {
			PrintWriter out=response.getWriter();
			if(count==0) {
				out.write("OK");
			}
			else {
				out.write("NO");
			}
		} catch (Exception e) {}
	}
}
