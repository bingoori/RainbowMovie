package com.rainbow.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rainbow.app.vod.VodDTO;
import com.rainbow.web.member.MemberDTO;

@Repository
public interface VodMapper {
	// C 영화 (등록) 
	public int addMovie(VodDTO vod); // 추상 메소드
	// R 모든 영화ㅣ조회
	public List<VodDTO> getVodList(VodDTO vod);
	// R 이름으로 영화 조회 (중복된 이름 허용)
	public VodDTO getByVodName(String vodName);
	// R 로그인 한 회원 조회
	public MemberDTO vodLogin(MemberDTO member);
	// R 아이디로 영화 조회
	public VodDTO getByVodId(VodDTO vod);
	// R VOD 카운트
	public int VodCount();
	// R 검색
	public List<VodDTO> VodSearch(String vodName);
	// R 검색 최신영화
	public List<VodDTO> getAtLeastVodLimit( );
	// R 검색 일반영화
	public List<VodDTO> getCommonVodLimit( );
	// R 검색 무료영화
	public List<VodDTO> getFreeVodLimit( );
	// R 검색 최신영화
	public List<VodDTO> getAtLeastVodUn( );
	// R 검색 일반영화
	public List<VodDTO> getCommonVodUn( );
	// R 검색 무료영화
	public List<VodDTO> getFreeVodUn( );
	// U 영화 정보 수정
	public int VodUpdate(VodDTO vod);
	// D 영화 정보 삭제
	public int VodDelete(VodDTO vod); 
}