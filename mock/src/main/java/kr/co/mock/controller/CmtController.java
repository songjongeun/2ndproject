package kr.co.mock.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mock.dao.CmtDao;
import kr.co.mock.dto.CmtDto;

@Controller
public class CmtController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/freeboard/content/cmt_list")
	public String cmt_list(CmtDto cdto,Model model,HttpServletRequest request,HttpSession session)
	{
		int cpage;
		if(request.getParameter("cpage")==null)
		{
			cpage=1;
		}
		else
		{
			cpage=Integer.parseInt(request.getParameter("page"));
		}
		int cindex=(cpage-1)*10;
		
		CmtDao cdao=sqlSession.getMapper(CmtDao.class);;
		ArrayList<CmtDto> clist=cdao.cmt_list(cindex);

		// page출력을 위해 필요한 값
		// 현재페이지:page, pstart,pend, page_cnt
		// pstart,pend
		int cpstart=cpage/10;
		if(cpage%10 == 0)
			cpstart=cpstart-1;
		cpstart=(cpstart*10)+1;
		int cpend=cpstart+9;
		int cpage_cnt=cdao.get_pagecount();
		
		if(cpend>cpage_cnt)
			cpend=cpage_cnt;
		
		model.addAttribute("cpstart",cpstart);
		model.addAttribute("cpend",cpend);
		model.addAttribute("cpage_cnt",cpage_cnt);
		model.addAttribute("cpage",cpage);
		model.addAttribute("clist", clist);
		return "redirect:/freeboard/content?c_id="+cdto.getC_id();
	}
	
	@RequestMapping("/freeboard/cmt_write")
	public String cmt_write()
	{
		return "/freeboard/cmt_write";
	}
	/*
	@RequestMapping("/freeboard/cmt_write_ok")
	public String cmt_write_ok(CmtDto cdto,HttpSession session)
	{
		CmtDao cdao=sqlSession.getMapper(CmtDao.class); 
		cdto.setUserid(session.getAttribute("userid").toString());
   
		cdao.cmt_write_ok(cdto);
		System.out.println(cdto.getF_id()+"DD");
		return "redirect:/freeboard/content?f_id="+cdto.getF_id();
	}
	*/
	@RequestMapping("/freeboard/cmt_write_ok")
	public String cmt_write_ok(CmtDto cdto,HttpSession session)
	{
		CmtDao cdao=sqlSession.getMapper(CmtDao.class);
		cdto.setUserid(session.getAttribute("userid").toString());
		cdao.cmt_write_ok(cdto);
		return "redirect:/freeboard/content?id="+cdto.getF_id();
	}
	@RequestMapping("/freeboard/cmt_update")
	public String cmt_update(CmtDto cdto,Model model,HttpServletRequest request)
	{
		int c_id=Integer.parseInt(request.getParameter("c_id"));
		CmtDao cdao=sqlSession.getMapper(CmtDao.class); 
		cdao.cmt_update(c_id);
		model.addAttribute("cdto",cdto);
		return "redirect:/freeboard/content?f_id="+cdto.getF_id();
	}

	@RequestMapping("/freeboard/cmt_update_ok")
	public String cmt_update_ok(CmtDto cdto,HttpServletRequest request,HttpSession session)
	{
		int c_id=Integer.parseInt(request.getParameter("c_id"));		
		CmtDao cdao=sqlSession.getMapper(CmtDao.class); 
		cdao.cmt_update_ok(cdto);
		return "redirect:/freeboard/content?f_id="+cdto.getF_id();
	}
	
	@RequestMapping("/freeboard/cmt_delete")
	public String cmt_delete(CmtDto cdto)
	{
		CmtDao cdao=sqlSession.getMapper(CmtDao.class); 
		cdao.cmt_delete(cdto.getC_id());
		return "redirect:/freeboard/content?f_id="+cdto.getF_id();
	}
}