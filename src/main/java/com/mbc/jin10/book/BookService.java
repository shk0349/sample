package com.mbc.jin10.book;

import java.util.ArrayList;



public interface BookService {

	void bookinput(String bname, String bwriter, String bcompany, int bprice, String bdate, String bcontent,
			String fname);

	ArrayList<BookDTO> bookout();

	BookDTO update(int bnumber);

	void bookupdate2(String bname, String bwriter, String bcompany, int bprice, String bdate, String bcontent,
			String fname, int bnumber);

	void bookdelete(int bnumber);

	BookDTO bookdetail(int bnumber);

	void breadcnt(int bnumber);
	//페이징처리에서 게시글 조회 2222222
	public int total();
    public ArrayList<BookDTO> page(Page1DTO dto);

	ArrayList<BookDTO> bnamesearch(String svalue);

	ArrayList<BookDTO> bwritersearch(String svalue);

	ArrayList<BookDTO> bcompanysearch(String svalue);

}
