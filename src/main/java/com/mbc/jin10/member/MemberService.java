package com.mbc.jin10.member;

import java.util.ArrayList;

public interface MemberService {

	void memberinput(String id, String pw, String name, String tel, String gender, String address, String greeting);

	ArrayList<MemberDTO> memberout();

	MemberDTO memberupdate(String id);

	void memberupdate2(String pw, String name, String tel, String gender, String address, String greeting, String id);

	void memberdelete(String id);

	int idcheck(String id);

	ArrayList<MemberDTO> idsearch(String svalue);

	ArrayList<MemberDTO> namesearch(String svalue);
	
}
