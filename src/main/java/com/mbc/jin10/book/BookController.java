package com.mbc.jin10.book;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



@Controller
public class BookController {
	
	String path="C:\\mbc6\\spring\\day10_board\\src\\main\\webapp\\image";
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/bookinput")
	public String book()
	{
		return "bookinput";
	}
	
	@RequestMapping(value = "/booksave")
	public String book1(MultipartHttpServletRequest mul) throws IllegalStateException, IOException
	{
		String bname=mul.getParameter("bname");
		String bwriter=mul.getParameter("bwriter");
		String bcompany=mul.getParameter("bcompany");
		int bprice=Integer.parseInt(mul.getParameter("bprice"));
		String bdate=mul.getParameter("bdate");
		String bcontent=mul.getParameter("bcontent");
		MultipartFile mf=mul.getFile("bimage");
		String fname=mf.getOriginalFilename();
		BookService bs=sqlSession.getMapper(BookService.class);
		mf.transferTo(new File(path+"\\"+fname));
		bs.bookinput(bname,bwriter,bcompany,bprice,bdate,bcontent,fname);
		
		return "bookinput";
	}
	
	@RequestMapping(value = "/bookout")
	public String book2(Model mo,HttpServletRequest request,HttpServletResponse response,Page1DTO dto) throws IOException
	{
		BookService bs=sqlSession.getMapper(BookService.class);
		HttpSession hs=request.getSession();
		boolean yy=(Boolean)hs.getAttribute("loginstate");
		if(yy)
		{
			String nowPage=request.getParameter("nowPage");
	        String cntPerPage=request.getParameter("cntPerPage");
	        
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
	        dto=new Page1DTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
	        
	        mo.addAttribute("paging",dto);
	        mo.addAttribute("list",bs.page(dto));
			
			
			
			return "bookout";
		}
		else
		{

			response.setContentType("text/html;charset=utf-8");
			PrintWriter pww= response.getWriter();
			pww.print("<script> alert('로그인 후 사용하세요')</script> ");
			pww.print("<script> location.href='main'</script> ");
			pww.close();
			return "redirect:/main";
		}
		
		
	}
	
	@RequestMapping(value = "/bookupdate")
	public String book3(Model mo, HttpServletRequest request)
	{	int bnumber=Integer.parseInt(request.getParameter("bnumber"));
		BookService bs=sqlSession.getMapper(BookService.class);
		BookDTO dto=bs.update(bnumber);
		mo.addAttribute("dto", dto);
		return "bookupdateview";
	}
	@RequestMapping(value = "/bookupdate2")
	public String book4(MultipartHttpServletRequest mul) throws IllegalStateException, IOException
	{	
		int bnumber=Integer.parseInt(mul.getParameter("bnumber"));
		String bname=mul.getParameter("bname");
		String bwriter=mul.getParameter("bwriter");
		String bcompany=mul.getParameter("bcompany");
		int bprice=Integer.parseInt(mul.getParameter("bprice"));
		String bdate=mul.getParameter("bdate");
		String bcontent=mul.getParameter("bcontent");
		MultipartFile mf=mul.getFile("bimage");
		String fname=mf.getOriginalFilename();
		BookService bs=sqlSession.getMapper(BookService.class);
		mf.transferTo(new File(path+"\\"+fname));
		bs.bookupdate2(bname,bwriter,bcompany,bprice,bdate,bcontent,fname,bnumber);
		
		
		return "redirect:/bookout";
	}
	
	@RequestMapping(value = "/bookdelete")
	public String book5(HttpServletRequest request)
	{	int bnumber=Integer.parseInt(request.getParameter("bnumber"));
		BookService bs=sqlSession.getMapper(BookService.class);
		bs.bookdelete(bnumber);
		
		return "redirect:/bookout";
	}
	
	@RequestMapping(value = "/bookdetail")
	public String book6(HttpServletRequest request, Model mo)
	{	int bnumber=Integer.parseInt(request.getParameter("bnumber"));
		BookService bs=sqlSession.getMapper(BookService.class);
		BookDTO dto=bs.bookdetail(bnumber);
		mo.addAttribute("dto", dto);
		bs.breadcnt(bnumber);
		return "bookdetail";
	}
	
	@RequestMapping(value = "/booksearch")
	public String book7(HttpServletRequest request)
	{	
		
		return "booksearch";
	}
	
	@RequestMapping(value = "/booksearchsave")
	public String book8(HttpServletRequest request,Model mo)
	{	
		BookService bs=sqlSession.getMapper(BookService.class);
		String key=request.getParameter("key");
		String svalue='%'+request.getParameter("svalue")+'%';
		ArrayList<BookDTO>list;
		if(key.equals("bname"))
		{
			list=bs.bnamesearch(svalue);
		}
		else if(key.equals("bwriter"))
		{
			list=bs.bwritersearch(svalue);
		}
		else
		{
			list=bs.bcompanysearch(svalue);
		}
		mo.addAttribute("list", list);
		return "bookout";
	}
	
	
}
