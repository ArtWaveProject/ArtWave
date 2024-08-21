package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.AlbumVO;
import com.sist.vo.ArtistVO;
import com.sist.vo.MusicVO;

public class MusicDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static List<MusicVO> musicListData(Map map) {
		List<MusicVO> list = new ArrayList<MusicVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("musicListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static int musicTotalPage(String genre) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("musicTotalPage", genre);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}

	public static List<AlbumVO> albumListData(Map map) {
		List<AlbumVO> list = new ArrayList<AlbumVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("albumListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static int albumTotalPage(String genre) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("albumTotalPage", genre);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}
	
	public static List<ArtistVO> artistListData(Map map){
		List<ArtistVO> list = new ArrayList<ArtistVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("artistListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	
	public static ArtistVO artistDetailData(int ano) {
		ArtistVO vo = new ArtistVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("artistDetailData", ano);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	public static List<MusicVO> artistMusicData(int ano) {
		List<MusicVO> list = new ArrayList<MusicVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("artistMusicData", ano);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static List<AlbumVO> artistAlbumData(int ano) {
		List<AlbumVO> list = new ArrayList<AlbumVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("artistAlbumData", ano);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static MusicVO musicDetailData(int mno) {
		MusicVO vo = new MusicVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("musicDetailData", mno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
	public static List<String> artistName(int[] list){
		List<String> slist=new ArrayList<String>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			for(int i:list) {
				String name = session.selectOne("artistNameData", i);
				slist.add(name);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return slist;
	}
	public static AlbumVO albumDetailData(int alno) {
		AlbumVO vo = new AlbumVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("albumDetailData", alno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
	public static List<MusicVO> albumMusicData(int alno){
		List<MusicVO> list=new ArrayList<MusicVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("albumMusicData", alno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	
	public static List<MusicVO> musicMvListData(Map map){
		List<MusicVO> list=new ArrayList<MusicVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("musicMvListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static int musicMvTotalPage(String ss) {
		int total=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("musicMvTotalPage", ss);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}
	
	public static List<MusicVO> musicFindData(Map map){
		List<MusicVO> list=new ArrayList<MusicVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("musicFindData", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static List<ArtistVO> artistFindData(Map map){
		List<ArtistVO> list=new ArrayList<ArtistVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("artistFindData", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static List<AlbumVO> albumFindData(Map map){
		List<AlbumVO> list=new ArrayList<AlbumVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("albumFindData", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static List<MusicVO> musicListDataNew(Map map){
		List<MusicVO> list = new ArrayList<MusicVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("musicListDataNew", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
}
