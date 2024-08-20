package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class MovieLikeDAO {
		private static SqlSessionFactory ssf;
		static {
			ssf = CreateSqlSessionFactory.getSsf();
		}
		public static int movieLikeOn(Map map) {
			SqlSession session = null;
			int count=0;
			try {
				session = ssf.openSession(true);
				session.insert("movieLikeOn", map);
				session.update("movieLikeCountIncrement", map);
				session.commit();
				count=session.selectOne("movieLikeCount", map);
			} catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			} finally {
				if (session != null)
					session.close();
			}
			return count;
		}
		public static int movieLikeOff(Map map) {
			SqlSession session = null;
			int count=0;
			try {
				session = ssf.openSession(true);
				session.insert("movieLikeOff", map);
				session.update("movieLikeCountDecrement", map);
				session.commit();
				count=session.selectOne("movieLikeCount", map);
			} catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			} finally {
				if (session != null)
					session.close();
			}
			return count;
		}
		public static int movieLikeCheck(Map map) {
			int count=0;
			SqlSession session = null;
			try {
				session = ssf.openSession();
				count = session.selectOne("likeCheck", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (session != null)
					session.close();
			}
			return count;
		}
	  
	   public static void movieLikeCountIncrement(Map map)
	   {
		      SqlSession session=null;
			  try
			  {
				  session=ssf.openSession(true);
				  session.update("movieLikeCountIncrement",map);
			  }catch(Exception ex)
			  {
				  ex.printStackTrace();
			  }
			  finally
			  {
				  if(session!=null)
					  session.close();
			  }
	   }
	   public static void movieLikeCountDecrement(Map map)
	   {
		      SqlSession session=null;
			  try
			  {
				  session=ssf.openSession(true);
				  session.update("movieLikeCountDecrement",map);
			  }catch(Exception ex)
			  {
				  ex.printStackTrace();
			  }
			  finally
			  {
				  if(session!=null)
					  session.close();
			  }
	   }
	   public static int movieLikeCount()
	   {
		   int count=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   count=session.selectOne("movieLikeCount");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return count;
	   }
}
