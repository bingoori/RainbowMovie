package com.rainbow.app.buy;

import org.springframework.stereotype.Component;


@Component
public class BuyDTO {
private int buySeq,memberSeq;
private String buyDate,vodName;
public int getBuySeq() {
	return buySeq;
}
public void setBuySeq(int buySeq) {
	this.buySeq = buySeq;
}
public int getMemberSeq() {
	return memberSeq;
}
public void setMemberSeq(int memberSeq) {
	this.memberSeq = memberSeq;
}
public String getBuyDate() {
	return buyDate;
}
public void setBuyDate(String buyDate) {
	this.buyDate = buyDate;
}
public String getVodName() {
	return vodName;
}
public void setVodName(String vodName) {
	this.vodName = vodName;
}
@Override
public String toString() {
	return "BuyDTO [buySeq=" + buySeq + ", memberSeq=" + memberSeq
			+ ", buyDate=" + buyDate + ", vodName=" + vodName + "]";
}


}
  