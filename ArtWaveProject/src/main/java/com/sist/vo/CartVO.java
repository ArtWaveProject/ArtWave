package com.sist.vo;
/*
CNO	NUMBER
TNO	NUMBER
PRICE	VARCHAR2(50 BYTE)
ID	VARCHAR2(1000 BYTE)
COUNT	NUMBER
BUYDATE	DATE
TYPE	NUMBER
 */

import java.util.*;

public class CartVO {
	private int cno, tno, count, type;
	private String price, id;
	private Date buydate;
	BookVO bovo= new BookVO();
	AlStoreVO alvo= new AlStoreVO();
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getBuydate() {
		return buydate;
	}
	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}
}
