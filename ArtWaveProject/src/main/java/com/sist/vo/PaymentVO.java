package com.sist.vo;
/*
pno number,
id varchar2(1000),
count number,
price number,
buydate date,
post varchar2(10),
addr1 varchar2(1000),
addr2 varchar2(1000),
type number,
constraint pm_pno_pk primary key(pno)
 */

import java.util.Date;

import lombok.Data;
@Data
public class PaymentVO {
	private int pno, count, price, type, gno;
	private String id, dbday, post, addr1, addr2, ptitle;
	private Date buydate;
	private MusicVO mvo=new MusicVO();
	private AlStoreVO avo=new AlStoreVO();
	private BookVO bvo=new BookVO();
	private String typeDetail;
}
