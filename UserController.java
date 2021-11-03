package kr.co.mock.controller;

import java.io.PrintWriter;

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
	
	@RequestMapping("/mypage")
	public String mypage(Model model,HttpServletRequest request)
	{
		String userid=request.getParameter("userid");	
		UserDao udao=sqlSession.getMapper(UserDao.class);
		UserDto udto=udao.mypage(userid);
		model.addAttribute("udto",udto);
		return "/mypage";
	}
	
	@RequestMapping("/mypage_update")
	public String mypage_update(Model model,HttpServletRequest request)
	{
		String userid=request.getParameter("userid");
		UserDao udao=sqlSession.getMapper(UserDao.class); 
		UserDto udto=udao.mypage_update(userid);
		model.addAttribute("udto",udto);
		return "/mypage_update";
	}
	
	@RequestMapping("/mypage_update_ok")
	public String mypage_update_ok(UserDto udto)
	{
		UserDao udao=sqlSession.getMapper(UserDao.class);
		udao.mypage_update_ok(udto);
		return "redirect:/mypage";
	}
	
	@RequestMapping("/mypage_delete")
	public String delete(HttpServletRequest request)
	{
		String userid=request.getParameter("userid");
		UserDao udao=sqlSession.getMapper(UserDao.class);
		udao.mypage_delete(userid);
		return "redirect:/index";
	}
	
	
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request,Model model)
	{
		model.addAttribute("chk",request.getParameter("chk"));
		return "/login";
	}

	@RequestMapping("/member")
	public String member(HttpServletRequest request,Model model)
	{
		model.addAttribute("f",request.getParameter("f"));

		return "/member";
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
			return "redirect:/home";
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
			return "redirect:/login?chk=1";
		}
		else
		{
			session.setAttribute("userid",udto2.getUserid());
			session.setAttribute("username",udto2.getUsername());

			return "main_view";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/list";
	}

	@RequestMapping("/userid_search")
	public String userid_search()
	{
		return "/userid_search";
	}

	@RequestMapping("/pwd_search")
	public String pwd_search()
	{
		return "/pwd_search";
	}

	@RequestMapping("/search_ok")
	public String search_ok(UserDto udto,Model model)
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
		UserDto udto2=udao.search_ok(udto);

		if(udto2==null)
		{
			model.addAttribute("chk", chk);
		}
		else
		{
			model.addAttribute("user", chk);
			model.addAttribute("userid", udto2.getUserid());
			model.addAttribute("username", udto2.getUsername());
			model.addAttribute("email", udto2.getEmail());
		}

//		System.out.println(udto2.getUserid());
		return "/search_ok";
	}

}