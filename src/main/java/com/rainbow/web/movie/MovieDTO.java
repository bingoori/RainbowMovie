package com.rainbow.web.movie;

import org.springframework.stereotype.Component;

@Component
public class MovieDTO {
	int movieSeq;
	String title;
	int rating;
	String genre;
	String openDate;
	String grade;
	String runningtime;
	String director;
	String actor;
	String content;
	String image;
	
	int start; // 데이터베이스에서 보여줄 영화 데이터 시작 인덱스
	int end; // 데이터베이스에서 보여줄 영화 데이터 끝 인덱스
	int totalMovie; // 데이터베이스에 있는 영화의 총 개수
	
	// 검색 시 사용되는 두 개의 변수
	String keyField; // 제목 검색 or 감독 검색
	String keyWord; // 검색 할 내용

	public int getMovieSeq() {
		return movieSeq;
	}
	public void setMovieSeq(int movieSeq) {
		this.movieSeq = movieSeq;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getTotalMovie() {
		return totalMovie;
	}
	public void setTotalMovie(int totalMovie) {
		this.totalMovie = totalMovie;
	}
	public String getKeyField() {
		return keyField;
	}
	public void setKeyField(String keyField) {
		this.keyField = keyField;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	@Override
	public String toString() {
		return "MovieDTO [movieSeq=" + movieSeq + ", rating=" + rating + ", 제목=" + title + ", 장르=" + genre
				+ ", 개봉일=" + openDate + ", 등급 =" + grade + ", 상영시간 =" + runningtime + ", 감독 ="
				+ director + ", 배우 =" + actor + ", 내용 =" + content + ", 이미지 =" + image + "]";
	}
	
}
