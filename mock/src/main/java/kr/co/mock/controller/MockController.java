package kr.co.mock.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MockController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/test")
	public String test() {
		
		return "/test";
	}
}
