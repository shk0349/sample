package com.mbc.jin10.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/memberinput")
	public String member()
	{
		
		return "memberinput";
	}
	
	@RequestMapping(value = "/membersave")
	public String member1(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		PasswordEncoder passwordEncoder= new BCryptPasswordEncoder();
		pw=passwordEncoder.encode(pw);
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String greeting=request.getParameter("greeting");
		
		MemberService ms=sqlSession.getMapper(MemberService.class);
		ms.memberinput(pw,name,tel,gender,address,greeting,id);
		
		return "memberinput";
	}
	
	@RequestMapping(value = "/memberout")
	public String member2(Model mo,HttpServletRequest request,HttpServletResponse response) throws IOException
	{	
		HttpSession hs=request.getSession();
		boolean yy=(Boolean)hs.getAttribute("loginstate");
		if(yy)
		{
			MemberService ms=sqlSession.getMapper(MemberService.class);
			ArrayList<MemberDTO>list=ms.memberout();
			mo.addAttribute("list", list);
			
			return "memberout";
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
	
	@RequestMapping(value = "/memberupdate")
	public String member3(Model mo,HttpServletRequest request)
	{	
		String id=request.getParameter("id");
		MemberService ms=sqlSession.getMapper(MemberService.class);
		MemberDTO dto=ms.memberupdate(id);
		mo.addAttribute("dto", dto);
		
		return "memberupdateview";
	}
	
	@RequestMapping(value = "/memberupdate2")
	public String member4(Model mo,HttpServletRequest request)
	{	
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String greeting=request.getParameter("greeting");
		MemberService ms=sqlSession.getMapper(MemberService.class);
		ms.memberupdate2(pw,name,tel,gender,address,greeting,id);
		
		
		return "redirect:/memberout";
	}
	
	@RequestMapping(value = "/memberdelete")
	public String member5(Model mo,HttpServletRequest request)
	{	
		String id=request.getParameter("id");
		MemberService ms=sqlSession.getMapper(MemberService.class);
		ms.memberdelete(id);
		
		return "redirect:/memberout";
	}
	@ResponseBody
	@RequestMapping(value = "/idcheck2")
	public String member6(HttpServletRequest request)
	{	
		String id=request.getParameter("id");
		MemberService ms=sqlSession.getMapper(MemberService.class);
		int count=ms.idcheck(id);
		if(count == 0)
		{
			return "ok";
		}
		else
		{
			return "no";
		}
		
	}
	
	@RequestMapping(value = "/membersearch")
	public String member7()
	{
		
		return "membersearch";
	}
	
	@RequestMapping(value = "/membersearchsave")
	public String member8(HttpServletRequest request,Model mo)
	{
		String key = request.getParameter("key");
		String svalue = '%'+request.getParameter("svalue")+'%';
		MemberService ms=sqlSession.getMapper(MemberService.class);
		ArrayList<MemberDTO>list;
		if(key.equals("id"))
		{
			list=ms.idsearch(svalue);
		}
		else
		{
			list=ms.namesearch(svalue);
		}
		mo.addAttribute("list", list);
		
		return "memberout";
	}
	
}
