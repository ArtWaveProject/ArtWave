package com.sist.vo;

import lombok.Data;

@Data
public class MovieLikeVO {
	private int molno, mno;
	private String id;
	private MemberVO mevo = new MemberVO();
	private MovieVO movo= new MovieVO();
}