package kr.co.mock.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mock.dao.AdminDao;
import kr.co.mock.dto.BuyingDto;
import kr.co.mock.dto.SellingDto;
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
		ArrayList<BuyingDto> bdto=adao.buyList();
		ArrayList<SellingDto> sdto=adao.sellList();
		
		
		model.addAttribute("adto",adto);  // udto지만 그냥 adto로 사용
		model.addAttribute("bdto", bdto);
		model.addAttribute("sdto", sdto);
		return "/admin/adminpage";
		
	}
	
}
