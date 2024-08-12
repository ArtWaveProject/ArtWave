package com.sist.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.MemberVO;

public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static String memberIdCheck(String id) {
		String result="";
		SqlSession session=ssf.openSession();
		int count=session.selectOne("memberIdCheck", id.toLowerCase());
		if(count==0) {
			result="OK";
		}
		else {
			result="NO";
		}
		return result;
	}
	public static String memberNickCheck(String nickname) {
		String result="";
		SqlSession session=ssf.openSession();
		int count=session.selectOne("memberNickCheck", nickname.toLowerCase());
		if(count==0) {
			result="OK";
		}
		else {
			result="NO";
		}
		return result;
	}
	public static String memberEmailCheck(String email) {
		String result="";
		SqlSession session=ssf.openSession();
		System.out.print(email);
		int count=session.selectOne("memberEmailCheck", email);
		if(count==0) {
			result="OK";
		}
		else {
			result="NO";
		}
		return result;
	}
	public static void memberInsert(MemberVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.insert("memberInsert", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null) session.close();
		}
	}
}
