package com.rainbow.app.vod;

import org.springframework.stereotype.Component;

@Component
public class VodDTO {

	private String vodName,vodContent,vodContentTitle,vodPrice,vodCategory,vodRating,vodUrl,vodImage,vodDate,vodFree,vodGrade,vodActor,vodDirector,vodCountry;
	private int vodTime,vodSeq,startNum,endNum,count;
	

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getVodName() {
		return vodName;
	}
	public void setVodName(String vodName) {
		this.vodName = vodName;
	}
	public String getVodContentTitle() {
		return vodContentTitle;
	}
	public void setVodContentTitle(String vodContentTitle) {
		this.vodContentTitle = vodContentTitle;
	}
 
	public String getVodContent() {
		return vodContent;
	}
	public void setVodContent(String vodContent) {
		this.vodContent = vodContent;
	}
	public String getVodPrice() {
		return vodPrice;
	}
	public void setVodPrice(String vodPrice) {
		this.vodPrice = vodPrice;
	}
	public String getVodCategory() {
		return vodCategory;
	}
	public void setVodCategory(String vodCategory) {
		this.vodCategory = vodCategory;
	}
	public String getVodRating() {
		return vodRating;
	}
	public void setVodRating(String vodRating) {
		this.vodRating = vodRating;
	}
	public String getVodUrl() {
		return vodUrl;
	}
	public void setVodUrl(String vodUrl) {
		this.vodUrl = vodUrl;
	}
	public String getVodImage() {
		return vodImage;
	}
	public void setVodImage(String vodImage) {
		this.vodImage = vodImage;
	}
	public String getVodDate() {
		return vodDate;
	}
	public void setVodDate(String vodDate) {
		this.vodDate = vodDate;
	}
	public String getVodFree() {
		return vodFree;
	}
	public void setVodFree(String vodFree) {
		this.vodFree = vodFree;
	}
	public String getVodGrade() {
		return vodGrade;
	}
	public void setVodGrade(String vodGrade) {
		this.vodGrade = vodGrade;
	}
	public String getVodActor() {
		return vodActor;
	}
	public void setVodActor(String vodActor) {
		this.vodActor = vodActor;
	}
	public String getVodDirector() {
		return vodDirector;
	}
	public void setVodDirector(String vodDirector) {
		this.vodDirector = vodDirector;
	}
	public String getVodCountry() {
		return vodCountry;
	}
	public void setVodCountry(String vodCountry) {
		this.vodCountry = vodCountry;
	}
	public int getVodTime() {
		return vodTime;
	}
	public void setVodTime(int vodTime) {
		this.vodTime = vodTime;
	}
	public int getVodSeq() {
		return vodSeq;
	}
	public void setVodSeq(int vodSeq) {
		this.vodSeq = vodSeq;
	}

	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
	@Override
	public String toString() {
		return "VodDTO [vodName=" + vodName + ", vodContent=" + vodContent
				+ ", vodContentTitle=" + vodContentTitle + ", vodPrice="
				+ vodPrice + ", vodCategory=" + vodCategory + ", vodRating="
				+ vodRating + ", vodUrl=" + vodUrl + ", vodImage=" + vodImage
				+ ", vodDate=" + vodDate + ", vodFree=" + vodFree
				+ ", vodGrade=" + vodGrade + ", vodActor=" + vodActor
				+ ", vodDirector=" + vodDirector + ", vodCountry=" + vodCountry
				+ ", vodTime=" + vodTime + ", vodSeq=" + vodSeq + ", startNum="
				+ startNum + ", endNum=" + endNum + "]";
	}

	




	
	
	
}
