package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class NoticeBoardDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static List<NoticeBoardVO> noticeListData(Map map)
	{
		
	}
}
