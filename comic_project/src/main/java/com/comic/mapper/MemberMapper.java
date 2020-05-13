package com.comic.mapper;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.EmployeeVO;
import com.comic.model.LoginVO;
import com.comic.model.MemberVO;
import com.comic.model.RoomuseVO;

public interface MemberMapper {
	
	// 멤버 회원가입
	public void memberInsert(MemberVO vo);
	// 멤버 로그인
	public MemberVO memberLogin(LoginVO loginVO);
	// 멤버 관리 페이지
	public List<MemberVO> MemberGetList();
	// 멤버 모달창 값 전달
	public MemberVO MemberRead(String MEMBER_ID);
	// 관리자가 멤버 정보 수정
	public void MemberUpdate(MemberVO vo);
	// 멤버 정보 삭제
	public void MemberDelete(String MEMBER_ID);
	// 멤버 유무 체크
	public MemberVO MemberCheck(MemberVO vo);
	// 멤버 비밀번호 수정
	public int MemberPasswordModify(MemberVO vo);
	// 멤버 정보 수정
	public void MemberUpdate2(MemberVO vo);
	// 멤버 회원가입 아이디 중복 체크
	public MemberVO getMember(MemberVO vo);
	// 멤버 헤더 회원수정 비밀번호 체크
	public String membermodifypasswordcheck(String mEMBER_ID);
	// 직원 회원가입
	public void employeeInsert(EmployeeVO vo);
	// 직원 로그인
	public EmployeeVO employeeLogin(LoginVO loginVO);
	// 직원 로그인 유지 처리
	public void EmployeekeepLogin(int eMPLOYEE_NUM, String sessionId, Date sessionLimit);	
	// 세션키 검증
	public MemberVO checkUserWithSessionKey(String value);
	// 룸사용시작
	public void roomuse(@Param("roomuse_id") String roomuse_id,@Param("roomnum") int roomnum);
	
}
