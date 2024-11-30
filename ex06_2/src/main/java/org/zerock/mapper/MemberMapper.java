package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
	
	public void insert(MemberVO member);
	
	public int checkUseridExist(String userid);
}