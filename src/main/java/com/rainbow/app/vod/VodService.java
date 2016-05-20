package com.rainbow.app.vod;

import java.util.List;

import com.rainbow.web.member.MemberDTO;


public interface VodService {

	// C 영화 (등록) 
	public int insert(VodDTO vod); // 추상 메소드
	// R 모든 영화ㅣ조회
	public List<VodDTO> getList(VodDTO vod);
	// R 검색
	public List<VodDTO> Search(String vodName);
	// R 검색 최신영화
	public List<VodDTO> atLeastVodLimit( );
	// R 검색 일반영화
	public List<VodDTO> commonVodLimit( );
	// R 검색 무료영화
	public List<VodDTO> freeVodLimit( );
	// R 검색 최신영화
	public List<VodDTO> atLeastVodUn( );
	// R 검색 일반영화
	public List<VodDTO> commonVodUn( );
	// R 검색 무료영화
	public List<VodDTO> freeVodUn( );
	// R 관리자 무료영화 업데이트
	// R 이름으로 영화 조회 (중복된 이름 허용)
	public VodDTO getByName(VodDTO vod);
	// R 로그인 한 회원 조회
	public MemberDTO login(MemberDTO member);
	// R 영화 수 카운트
	public int count();
	// U 영화 정보 수정
	public int update(VodDTO vod);
	// D 영화 정보 삭제
	public int delete(VodDTO vod); 
 	
}