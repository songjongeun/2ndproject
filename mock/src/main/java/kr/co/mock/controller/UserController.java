package kr.co.mock.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mock.dao.UserDao;
import kr.co.mock.dto.UserDto;

@Controller
public class UserController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/login")
	public String login(HttpServletRequest request,Model model)
	{
		model.addAttribute("chk",request.getParameter("chk"));
		return "user/login";
	}
	
	@RequestMapping("/member")
	public String member(HttpServletRequest request,Model model)
	{
		model.addAttribute("f",request.getParameter("f"));
		
		return "user/member";
	}

	@RequestMapping("/userid_check")
	public void userid_check(HttpServletRequest request,PrintWriter out)
	{
		String userid=request.getParameter("userid");
		UserDao udao=sqlSession.getMapper(UserDao.class);
		int chk=udao.userid_check(userid);
		out.print(chk);
	}
	
	@RequestMapping("/member_ok")
	public String member_ok(UserDto udto)
	{
		UserDao xdao=sqlSession.getMapper(UserDao.class);
		int chk=xdao.userid_check(udto.getUserid());
		if(chk==0)
		{
			xdao.member_ok(udto); 
			return "redirect:/main_view";
		}
		else
		{
			return "redirect:/member?f=1";
		}
	}

	@RequestMapping("/login_ok")
	public String login_ok(UserDto udto,HttpSession session)
	{
		UserDao udao=sqlSession.getMapper(UserDao.class);
		UserDto udto2=udao.login_ok(udto);
		if(udto2==null)
		{
			return "redirect:login?chk=1";
		}
		else
		{
			session.setAttribute("userid",udto2.getUserid());
			session.setAttribute("username",udto2.getUsername());
			
			return "redirect:/main_view";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/main_view";
	}

	@RequestMapping("/userid_search")
	public String userid_search()
	{
		return "/user/userid_search";
	}

	@RequestMapping("/pwd_search")
	public String pwd_search()
	{
		return "/user/pwd_search";
	}
	
	@RequestMapping("/ip_search_ok")
	public String ip_search_ok(UserDto udto,Model model)
	{
//		System.out.println(udto.getUserid());
//		System.out.println(udto.getUsername());
//		System.out.println(udto.getEmail());
		String userid=udto.getUserid();
//		System.out.println(userid);
		int chk;
		if(userid.equals("%"))
		{
			chk=1;
		}
		else
		{
			chk=2;
		}
//		System.out.println(chk);
		UserDao udao=sqlSession.getMapper(UserDao.class);
		UserDto udto2=udao.ip_search_ok(udto);
		
		if(udto2==null)
		{
			model.addAttribute("chk", chk);
		}
		else
		{
			model.addAttribute("user", chk);
			model.addAttribute("userid", udto2.getUserid());
			model.addAttribute("pwd", udto2.getPwd());
			model.addAttribute("username", udto2.getUsername());
			model.addAttribute("email", udto2.getEmail());
		}
		
//		System.out.println(udto2.getUserid());
		return "/user/ip_search_ok";
	}

	@RequestMapping("/interests")
	public String interests(HttpSession session,Model model)
	{// 관심종목 가져오기
		String userid=(String) session.getAttribute("userid");
		
		UserDao udao=sqlSession.getMapper(UserDao.class);
		ArrayList<UserDto> udto=udao.interests(userid);

		if(udto.isEmpty())
		{// 관심종목이 없을때
			model.addAttribute("chk", 1);
			return "/user/interests";
		}
		else
		{
			ArrayList<UserDto> udto2=new ArrayList<UserDto>();
			for(int i=0;i<udto.size();i++)
			{
				udto2.add(udao.stk_rt(udto.get(i).getCode()));
			}
			
			model.addAttribute("udto",udto);
			model.addAttribute("udto2",udto2);
			return "/user/interests";
		}
		
		
		
		
	}
	
	
	
	
	
	
}
