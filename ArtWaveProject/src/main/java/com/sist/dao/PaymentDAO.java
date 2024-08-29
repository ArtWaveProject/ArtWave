package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.PaymentVO;

public class PaymentDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static void paymentInsert(Map map) {
		SqlSession session=null;
		try
		{
			session = ssf.openSession(true);
			session.insert("paymentInsert",map);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	public static int paymentCheck(Map map) {
		int count=0;
		SqlSession session=null;
		try
		{
			session = ssf.openSession(true);
			count=session.selectOne("paymentCheck",map);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	public static List<PaymentVO> paymentList(Map map) {
		List<PaymentVO> list=new ArrayList<PaymentVO>();
		SqlSession session=null;
		try
		{
			session = ssf.openSession(true);
			list=session.selectList("paymentList",map);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
}
