package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.CartVO;
import com.sist.vo.LikeVO;

import java.util.*;

public class CartDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static List<CartVO> allcartListData(Map map) {
		List<CartVO> allcart = new ArrayList<CartVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			allcart = session.selectList("allcartListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		System.out.println(allcart + "dao allcart");
		return allcart;
	}
	
	public static List<CartVO> bocartListData(Map map){
		List<CartVO> bocart = new ArrayList<CartVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			bocart = session.selectList("bolikeListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		System.out.println(bocart+"dao bocart");
		return bocart; 
		
	}
	
	public static List<CartVO> ascartListData(Map map){
		List<CartVO> ascart = new ArrayList<CartVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			ascart = session.selectList("ascartListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		System.out.println(ascart+"dao ascart");
		return ascart; 

	}
}
