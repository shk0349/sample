package com.mbc.jin10.board;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@Autowired
	SqlSession sqlSession;
	
	
	
	@RequestMapping(value = "boardin")
	public String board()
	{
		
		
		return "boardinput";
	}
	
	@RequestMapping(value = "boardsave")
	public String board0(HttpServletRequest request)
	{
		String bwriter=request.getParameter("bwriter");
		String btitle=request.getParameter("btitle");
		String bcontents=request.getParameter("bcontents");
		BoardService bs=sqlSession.getMapper(BoardService.class);
		bs.boardinsert(bwriter,btitle,bcontents);
		
		return "redirect:./";
	}
	
//	@RequestMapping(value = "boardout")
//	public String board1(Model mo)
//	{
//		BoardService bs=sqlSession.getMapper(BoardService.class);
//		ArrayList<BoardDTO>list=bs.boardout();
//		mo.addAttribute("list", list);
//		return "boardout";
//	}
	
	 @RequestMapping(value="/boardout")
     public String ko16(HttpServletRequest request, PageDTO dto,Model mo) {
        String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
        BoardService bs = sqlSession.getMapper(BoardService.class);
        //전체레코드수구하기
        int total=bs.total();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="5";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="5";
        }      
        dto=new PageDTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
        mo.addAttribute("paging",dto);
        mo.addAttribute("list",bs.page(dto));
        return "boardout";
   
  }//
	
	
	
	
	
	
	
	
	@RequestMapping(value = "detail")
	public String board2(HttpServletRequest request, Model mo)
	{	
		int bnumber=Integer.parseInt(request.getParameter("bnumber"));
		String bcontents=request.getParameter("bcontents");
		BoardService bs=sqlSession.getMapper(BoardService.class);
		BoardDTO dto=bs.boarddetail(bnumber);
		
		mo.addAttribute("dto",dto );
		
		
		bs.boardreadcnt(bnumber);
		
		return "boarddetail";
	}
	
	@RequestMapping(value = "reply")
	public String board3(HttpServletRequest request, Model mo)
	{
		int number=Integer.parseInt(request.getParameter("number"));
		BoardService bs=sqlSession.getMapper(BoardService.class);
		BoardDTO dto=bs.reply(number);
		mo.addAttribute("dto", dto);
		
		
		return "reply";
	}
	
	@RequestMapping(value = "replysave")
	public String board4(HttpServletRequest request, Model mo)
	{
		int bnumber=Integer.parseInt(request.getParameter("bnumber"));
		int groups=Integer.parseInt(request.getParameter("groups"));
		int step=Integer.parseInt(request.getParameter("step"));
		int indent=Integer.parseInt(request.getParameter("indent"));
		String bwriter=request.getParameter("bwriter");
		String btitle=request.getParameter("btitle");
		String bcontents=request.getParameter("bcontents");
		BoardService bs=sqlSession.getMapper(BoardService.class);
		bs.stepup(groups,step);
		step++;
		indent++;
		
		bs.replysave(bnumber,bwriter,btitle,bcontents,groups,step,indent);
		
		
		return "boarddetail";
	}
	
	
	
	
	
	
	
	
	
	
}

