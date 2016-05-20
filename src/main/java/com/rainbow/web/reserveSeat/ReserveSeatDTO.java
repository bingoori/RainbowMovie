package com.rainbow.web.reserveSeat;

import org.springframework.stereotype.Component;

@Component
public class ReserveSeatDTO {
	private int reserveSeq, price;
	private String movieTitle, screenNumber, reserveDate, beginTime, seat, id;

	public int getReserveSeq() {
		return reserveSeq;
	}

	public void setReserveSeq(int reserveSeq) {
		this.reserveSeq = reserveSeq;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getScreenNumber() {
		return screenNumber;
	}

	public void setScreenNumber(String screenNumber) {
		this.screenNumber = screenNumber;
	}

	public String getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "ReserveSeatDTO [reserveSeq=" + reserveSeq + ", price=" + price
				+ ", movieTitle=" + movieTitle + ", screenNumber="
				+ screenNumber + ", reserveDate=" + reserveDate
				+ ", beginTime=" + beginTime + ", seat=" + seat + ", id=" + id
				+ "]";
	}
}
