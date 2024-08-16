package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;


public class ReplyBoardDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static List<ReplyBoardVO> replyBoardListData(Map map)
	{
		List<ReplyBoardVO> list = new ArrayList<ReplyBoardVO>();
		SqlSession session=null;
		try
		{
			session = ssf.openSession();
			list = session.selectList("replyBoardListData",map);
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
	
	public static void replyBoardInsert(ReplyBoardVO vo)
	{
		SqlSession session = null;
		try
		{
			session=ssf.openSession(true);
			session.insert("replyBoardInsert",vo);			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	
	public static int replyBoardRowCount()
	{
		int count = 0;
		SqlSession session = null;
		try {
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	public static List<ReplyBoardVO> adminReplyBoardListData(Map map)
	{
		List<ReplyBoardVO> list = new ArrayList<ReplyBoardVO>();
		SqlSession session = null;
		try {
			session=ssf.openSession();
			list=session.selectList("adminReplyBoardListData",map);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static void adminReplyBoardInsert(int no,ReplyBoardVO vo)
	{
		SqlSession session = null;
		try
		{
			session=ssf.openSession();
			session.insert("adminReplyBoardInsery",vo);
			session.update("adminReplyUpdate",no);
			session.commit();
			
		}
		catch(Exception ex)
		{
			session.rollback();
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	public static ReplyBoardVO adminReplyInfoData(int no)
	  {
		  ReplyBoardVO vo=new ReplyBoardVO();
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession(true);
			  vo=session.selectOne("adminReplyInfoData",no);
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if(session!=null)
				  session.close();
		  }
		  return vo;
	  }
}
