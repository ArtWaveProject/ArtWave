package com.sist.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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
}
