package com.mbc.jin10.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "login")
	public String login()
	{
		
		return "login";
	}
	
	@RequestMapping(value = "loginsave")
	public String login1(HttpServletRequest request, Model mo)
	{
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		LoginService ls=sqlSession.getMapper(LoginService.class);
		LoginDTO dto3=ls.logininput(id,pw);
		mo.addAttribute("dto3", dto3);
		if(dto3!=null)
		{
			HttpSession hs=request.getSession();
			hs.setAttribute("loginstate", true);
			hs.setAttribute("dto3", dto3);
			hs.setMaxInactiveInterval(300);
			return "redirect:/main";
		}
		else
		{
			return "login";
		}
	}
	
	@RequestMapping(value = "/logout")
	public String login2(HttpServletRequest request)
	{	
		HttpSession hs=request.getSession();
		hs.setAttribute("loginstate", false);
		hs.removeAttribute("dto3");
		
		return "redirect:/main";
	}
	
	
	
	
	
}
