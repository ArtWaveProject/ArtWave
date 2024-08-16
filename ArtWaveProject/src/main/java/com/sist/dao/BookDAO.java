package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class BookDAO {
	private static SqlSessionFactory ssf;
	  static
	  {
		  ssf=CreateSqlSessionFactory.getSsf();
	  }
	  /*
	   *  <select id="bookListData" resultType="BookVO" parameterType="hashmap">
		    SELECT bno,btag,bgenre,cover,btitle,writer,price,sale_price,dis_rate,publisher,intro,intro_img,pages,isbn13,isbn10,bdate,num
		    FROM (SELECT bno,btag,bgenre,cover,btitle,writer,price,sale_price,dis_rate,publisher,intro,intro_img,pages,isbn13,isbn10,bdate,rownum as num
		    FROM (SELECT bno,btag,bgenre,cover,btitle,writer,price,sale_price,dis_rate,publisher,intro,intro_img,pages,isbn13,isbn10,bdate
		    FROM book ORDER BY bno ASC))
		    WHERE num BETWEEN #{start} AND #{end}
		  </select>
		
		  <select id="bookTotalPage" resultType="int">
		    SELECT CEIL(COUNT(*)/20.0) FROM book
		  </select>
	   */
	  public static List<BookVO> bookListData(Map map)
	  {
		  List<BookVO> list=new ArrayList<BookVO>();
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  list=session.selectList("bookListData",map);
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
	  public static int bookTotalPage()
	  {
		  int total=0;
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  total=session.selectOne("bookTotalPage");
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if(session!=null)
				  session.close();
		  }
		  return total;
	  }
	  /*
	   *  <select id="bookListCount" resultType="int">
		    SELECT COUNT(*) FROM book
          </select>
	   */
	  public static int bookListCount()
	   {
		   int count=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   count=session.selectOne("bookListCount");
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
	  /*
			<select id="bookDetailData" resultType="FoodVO" parameterType="int">
				SELECT bno,btag,bgenre,cover,btitle,writer,price,sale_price,dis_rate,publisher,intro,intro_img,pages,isbn13,isbn10,bdate
				FROM book
				WHERE bno=#{fbno}
			</select>
	    */
	   public static BookVO bookDetailData(int bno)
	   {
		   BookVO vo=new BookVO();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("bookDetailData",bno);
			   
			   vo=session.selectOne("bookDetailData",bno);
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
