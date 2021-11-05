package kr.co.mock.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mock.dao.BoardDao;
import kr.co.mock.dto.BoardDto;

@Controller
public class BoardController {
	    
		@Autowired
		private SqlSession sqlSession;
		
		@RequestMapping("/freeboard/write")
		public String write()
		{
			return "/freeboard/write";
		}
		
		@RequestMapping("/freeboard/write_ok")
		public String write_ok(BoardDto bdto,HttpSession session)
		{
			BoardDao bdao=sqlSession.getMapper(BoardDao.class);
			bdto.setUserid(session.getAttribute("userid").toString());
			bdao.write_ok(bdto);
			return "redirect:/freeboard/list";
		}
		
		@RequestMapping("/freeboard/list")
		public String list(Model model,HttpServletRequest request)
		{
			int page;
			if(request.getParameter("page")==null)
			{
				page=1;
			}
			else
			{
				page=Integer.parseInt(request.getParameter("page"));
			}
			int index=(page-1)*10;
			
			BoardDao bdao=sqlSession.getMapper(BoardDao.class);
			ArrayList<BoardDto> list=bdao.list(index);

			
			
			
			
			
			
			// page출력을 위해 필요한 값
			// 현재페이지:page, pstart,pend, page_cnt
			// pstart,pend
			int pstart=page/10;
			if(page%10 == 0)
				pstart=pstart-1;
			pstart=(pstart*10)+1;
			int pend=pstart+9;
			int page_cnt=bdao.get_pagecount();
			
			if(pend>page_cnt)
				pend=page_cnt;
			
			model.addAttribute("pstart",pstart);
			model.addAttribute("pend",pend);
			model.addAttribute("page_cnt",page_cnt);
			model.addAttribute("page",page);
			model.addAttribute("list",list);
			return "/freeboard/list";
		}
		
		@RequestMapping("/freeboard/hit")
		public String hit(HttpServletRequest request)
		{
			// board테이블의 hit필드만 1증가 => content로이동
			int f_id=Integer.parseInt(request.getParameter("f_id"));
			BoardDao bdao=sqlSession.getMapper(BoardDao.class);
	        bdao.hit(f_id);
			return "redirect:/freeboard/content?f_id="+f_id;
		}
		
		@RequestMapping("/freeboard/content")
		public String content(Model model,HttpServletRequest request)
		{   // 사용자가 원하는 레코드의 값을 읽어 view에 전달
			int f_id=Integer.parseInt(request.getParameter("f_id"));		
			BoardDao bdao=sqlSession.getMapper(BoardDao.class);
			BoardDto bdto=bdao.content(f_id);
	        bdto.setContent(bdto.getContent().replace("\r\n", "<br>"));
	        model.addAttribute("bdto",bdto);
			return "/freeboard/content";
		}
		
		@RequestMapping("/freeboard/update")
		public String update(Model model,HttpServletRequest request)
		{
			int f_id=Integer.parseInt(request.getParameter("f_id"));
			BoardDao bdao=sqlSession.getMapper(BoardDao.class);
			BoardDto bdto=bdao.update(f_id);
			model.addAttribute("bdto",bdto);
			return "/freeboard/update";
		}
		
		@RequestMapping("/freeboard/update_ok")
		public String update_ok(BoardDto bdto)
		{
			// 정보를 수정하고 content로 이동
			BoardDao bdao=sqlSession.getMapper(BoardDao.class);
			bdao.update_ok(bdto);
	 
			return "redirect:/freeboard/content?f_id="+bdto.getF_id();
		}
		
		@RequestMapping("/freeboard/delete")
		public String delete(HttpServletRequest request)
		{
			// 레코드를 삭제하고 list이동
			int f_id=Integer.parseInt(request.getParameter("f_id"));
			BoardDao bdao=sqlSession.getMapper(BoardDao.class);
			bdao.delete(f_id);
			return "redirect:/freeboard/list";
		}
		
}
