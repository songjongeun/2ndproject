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

import kr.co.mock.dao.AdminDao;
import kr.co.mock.dao.UserDao;
import kr.co.mock.dto.UserDto;

@Controller
public class AdminController {

	@Autowired
	private SqlSession sqlSession;

	
	// 어드민페이지 화면
	@RequestMapping("/admin/adminpage")
	public String adminpage(Model model,HttpServletRequest request)
	{
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		ArrayList<UserDto> adto=adao.adminpage();
		model.addAttribute("adto",adto);  // udto지만 그냥 adto로 사용
		return "/admin/adminpage";
		
	}
	
}
