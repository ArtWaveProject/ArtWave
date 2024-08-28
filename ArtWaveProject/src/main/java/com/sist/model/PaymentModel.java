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
	@RequestMapping("payment/paymentInsert.do")
	public void musicBuy(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		MemberVO vo=MemberDAO.memberinfo(id);
		String pno=request.getParameter("pno");
		String count=request.getParameter("account");
		String price=request.getParameter("price");
		String type=request.getParameter("type");
		Map map=new HashMap();
		System.out.println(vo.getPost());
		map.put("pno", Integer.parseInt(pno));
		map.put("id", id);
		map.put("count", Integer.parseInt(count));
		map.put("price", Integer.parseInt(price));
		map.put("post", vo.getPost());
		map.put("addr1", vo.getAddr1());
		map.put("addr2", vo.getAddr2());
		map.put("type", Integer.parseInt(type));
		PaymentDAO.paymentInsert(map);
		JSONObject obj=new JSONObject();
		obj.put("name", vo.getName());
	  obj.put("email", vo.getEmail());
	  obj.put("address", vo.getAddr1());
	  obj.put("post", vo.getPost());
	  obj.put("phone", vo.getPhone());
	  try {
	  	response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(obj.toJSONString());
		} catch (Exception e) {}
	}
}
