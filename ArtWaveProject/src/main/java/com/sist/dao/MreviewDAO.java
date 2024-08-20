package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class MreviewDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static void mreviewInsert(MreviewVO vo)
	  {
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession(true);
			  session.insert("mreviewInsert",vo);
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
	  public static List<MreviewVO> mreviewListData(Map map)
	  {
		  List<MreviewVO> list=new ArrayList<MreviewVO>();
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  list=session.selectList("mreviewListData",map);  
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if(session!=null)
				  session.close();
		  }
		  return list;
	  }
	  public static void mreviewDelete(int mrno)
	  {
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession(true);
			  session.delete("mreviewDelete",mrno);
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
	  public static void mreviewUpdate(Map map)
	  {
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession(true);
			  session.update("mreviewUpdate",map);
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
}
