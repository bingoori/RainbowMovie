package com.rainbow.web.reserveSeat;

import java.util.List;

import com.rainbow.web.member.MemberDTO;

public interface ReserveSeatService {
	/**
	 * CRUD 인터페이스를 만들 때 이 기준으로 만든다고 생각하면 된다.
	 * C : create 생성
	 * R : read 조회
	 * U : update 수정
	 * D : delete 삭제
	 * 
	 * */
	
	// C 예매좌석 등록  
	public int insert(ReserveSeatDTO reserveSeat); // 추상 메소드
	// R 모든 예매 좌석 조회
	public List<ReserveSeatDTO> getList();
	// R 영화이름&날짜&시작시간&상영관으로 좌석 조회
	public List<ReserveSeatDTO> getByReserve(ReserveSeatDTO reserveSeat);
	// R 예약 시퀀스로 좌석 조회
	public ReserveSeatDTO getByReserveSeq(ReserveSeatDTO reserveSeat);
	// R 예약된 좌석 수 카운트
	public int count();
	// U 예약된 좌석 수정
	public int update(ReserveSeatDTO reserveSeat);
	// D 예약된 좌석 삭제(좌석선택 취소)
	public int deleteBySeat(ReserveSeatDTO reserveSeat);
	// D 예약된 좌석 삭제
	public int delete(ReserveSeatDTO reserveSeat);
}
