package com.sist.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.MemberVO;

public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static MemberVO memberLogIn(String id, String pwd) {
		MemberVO vo = new MemberVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			int count = session.selectOne("memberIdCheck", id);
			if (count == 0) {
				vo.setMsg("NOID");
			} else {
				vo = session.selectOne("memberInfoData", id);
				if (pwd.equals(vo.getPwd())) {
					vo.setMsg("OK");
				} else {
					vo.setMsg("NOPWD");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	public static String memberIdCheck(String id) {
		String result = "";
		SqlSession session = ssf.openSession();
		int count = session.selectOne("memberIdCheck", id.toLowerCase());
		if (count == 0) {
			result = "OK";
		} else {
			result = "NO";
		}
		return result;
	}

	public static String memberNickCheck(String nickname) {
		String result = "";
		SqlSession session = ssf.openSession();
		int count = session.selectOne("memberNickCheck", nickname.toLowerCase());
		if (count == 0) {
			result = "OK";
		} else {
			result = "NO";
		}
		return result;
	}

	public static String memberEmailCheck(String email) {
		String result = "";
		SqlSession session = ssf.openSession();
		System.out.print(email);
		int count = session.selectOne("memberEmailCheck", email);
		if (count == 0) {
			result = "OK";
		} else {
			result = "NO";
		}
		return result;
	}

	public static void memberInsert(MemberVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.insert("memberInsert", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	  public static MemberVO memberUpdateData(String id)
	  {
		  MemberVO vo=new MemberVO();
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession(true);
			  vo=session.selectOne("memberUpdateData", id);
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

	  public static boolean memberUpdate(MemberVO vo)
	  {
		  boolean bCheck=false;
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  String db_pwd=session.selectOne("memberGetPassword", vo.getId());
			  if(db_pwd.equals(vo.getPwd()))
			  {
				  bCheck=true;
				  session.update("memberUpdate",vo);
				  session.commit();
			  }
			  else
			  {
				  bCheck=false;
			  }
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if(session!=null)
				  session.close();
		  }
		  return bCheck;
	  }
	
}
