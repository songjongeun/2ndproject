package kr.co.mock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mock.dao.MockDao;
import kr.co.mock.dto.MockDto;
import kr.co.mock.dto.UserDto;

@Controller
public class MockController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/index")
	public String test() {
		
		return "/index";
	}
	
	@RequestMapping("/invest/in_regi")
	public String in_regi()
	{
		return "/invest/in_regi";
	}
	
	@RequestMapping("/in_regi_ok")
	public String in_regi_ok(UserDto udto,MockDto mdto,HttpServletRequest request,Model model,HttpSession session)
	{
		MockDao mdao=sqlSession.getMapper(MockDao.class);
		String userid=session.getAttribute("userid").toString();
		int end=Integer.parseInt(request.getParameter("end"));
		int mileage=Integer.parseInt(request.getParameter("mileage"));
			
		mdao.in_regi_ok(mdto, userid, end, mileage);
		return "redirect:/index";
	}
	
	@RequestMapping("/login")
	public String login()
	{
		return "/login";
	}
	
	@RequestMapping("/login_ok")
	public String login_ok(UserDto udto,HttpSession session)
	{
		MockDao mdao=sqlSession.getMapper(MockDao.class);
		UserDto udto2=mdao.login_ok(udto);
		session.setAttribute("userid", udto2.getUserid());
		session.setAttribute("username", udto2.getUsername());
		return "redirect:/index";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return"redirect:/index";
	}
	
}
