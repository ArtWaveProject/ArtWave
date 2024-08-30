package com.sist.vo;

import lombok.Data;

@Data
public class MovieMusicVO {
	private int mmno, mno, muno, alno;
	private String atitle, poster;
	private AlbumVO avo = new AlbumVO();
}
