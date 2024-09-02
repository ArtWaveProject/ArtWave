package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class AdminDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	/*	<select id="memberListData" resultType="memberVO" parameterType="hashmap">
			SELECT grade,id,name,phone,email,num
			FROM (SELECT grade,id,name,phone,email,rownum as num
			FROM(grade,id,name,phone,email,num))
			WHERE num BETWEEN #{start} AND #{end}
		</select>
		
		<select id="memberListTotalPage" resultType="int">
			SELECT CEIL(COUNT(*)/15.0) FROM member
		</select>*/

	public static List<MemberVO> memberListData(Map map) {
		List<MemberVO> list = new ArrayList<MemberVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("memberListData", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static int memberListTotalPage() {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("memberListTotalPage");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}

	public static int memberRowCount() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("memberRowCount");

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static void visitInsert() {
		System.out.println("hit");
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("visitorInsert");

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static int todayBuyRecord(int type) {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("todayBuyRecord", type);

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static int todayReserve() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("todayReserve");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
	public static int reserveNoneAccept() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("reserveNoneAccept");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
	public static int todayvisitRecord() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("todayvisitRecord");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
	public static int visitMax() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("visitMax");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
	public static int noneAnswer() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("noneAnswer");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
	public static List<Integer> visitWeek() {
		List<Integer> count=new ArrayList<Integer>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectList("visitWeek");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

}
