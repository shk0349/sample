package com.mbc.jin10.board;

import java.util.ArrayList;

public interface BoardService {

	void boardinsert(String bwriter, String btitle, String bcontents);

	ArrayList<BoardDTO> boardout();

	BoardDTO boarddetail(int bnumber);

	void boardcnt(int bnumber);

	void boardreadcnt(int bnumber);

	BoardDTO reply(int number);

	void stepup(int groups, int step);

	void replysave(int bnumber, String bwriter, String btitle, String bcontents, int groups, int step, int indent);
	
	//페이징처리에서 게시글 조회 2222222
    public int total();
    public ArrayList<BoardDTO> page(PageDTO dto);
	
	
	
}
