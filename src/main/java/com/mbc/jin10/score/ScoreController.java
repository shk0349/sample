package com.mbc.jin10.score;

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

@Controller
public class ScoreController {
	
	@Autowired
	SqlSession sqlSession;
	
	
	@RequestMapping(value = "/scoreinput")
	public String score()
	{
		return "scoreinput";
	}
	
	@RequestMapping(value = "/scoresave")
	public String score1(HttpServletRequest request)
	{	
		String name=request.getParameter("name");
		int kor=Integer.parseInt(request.getParameter("kor"));
		int eng=Integer.parseInt(request.getParameter("eng"));
		int math=Integer.parseInt(request.getParameter("math"));
		
		
		ScoreService ss=sqlSession.getMapper(ScoreService.class);
		ss.scoresave(name,kor,eng,math);
		
		return "scoreinput";
	}
	
	@RequestMapping(value = "/scoreout")
	public String score2(Model mo,HttpServletRequest request, HttpServletResponse response) throws IOException
	{	
		HttpSession hs=request.getSession();
		boolean yy=(Boolean)hs.getAttribute("loginstate");
		if(yy)
		{
			ScoreService ss=sqlSession.getMapper(ScoreService.class);
			ArrayList<ScoreDTO>list=ss.scoreout();
			mo.addAttribute("list", list);
			
			return "scoreout";
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
	
	@RequestMapping(value = "/delete")
	public String score3(HttpServletRequest request)
	{	int snumber=Integer.parseInt(request.getParameter("snumber"));
		ScoreService ss=sqlSession.getMapper(ScoreService.class);
		ss.delete(snumber);
		
		
		return "scoreout";
	}
	
	@RequestMapping(value = "/update")
	public String score4(Model mo, HttpServletRequest request)
	{	
		int snumber=Integer.parseInt(request.getParameter("snumber"));
		ScoreService ss=sqlSession.getMapper(ScoreService.class);
		
		ScoreDTO dto1=ss.update(snumber);
		mo.addAttribute("dto1", dto1);
		
		return "updateview";
	}
	
	@RequestMapping(value = "/update2")
	public String score5(HttpServletRequest request)
	{	int snumber=Integer.parseInt(request.getParameter("snumber"));
		String name=request.getParameter("name");
		int kor=Integer.parseInt(request.getParameter("kor"));
		int eng=Integer.parseInt(request.getParameter("eng"));
		int math=Integer.parseInt(request.getParameter("math"));
		
		ScoreService ss=sqlSession.getMapper(ScoreService.class);
		ss.update2(name,kor,eng,math,snumber);
		
		
		return "redirect:/scoreout";
	}
	
	@RequestMapping(value = "/scoresearch")
	public String score6()
	{	
		
		
		return "scoresearch";
	}
	
	@RequestMapping(value = "/searchsave")
	public String score7(HttpServletRequest request,Model mo)
	{	
		ScoreService ss=sqlSession.getMapper(ScoreService.class);
		String key=request.getParameter("key");
		String svalue='%'+request.getParameter("svalue")+'%';
		ArrayList<ScoreDTO>list;
		if(key.equals("name"))
		{
			list=ss.searchname(svalue);
		}
		else
		{
			list=ss.searchsnumber(svalue);
		}
		mo.addAttribute("list", list);
		
		return "scoreout";
	}
	
	
	
}
