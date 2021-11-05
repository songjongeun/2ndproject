package kr.co.mock.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mock.dao.AdminDao;
import kr.co.mock.dao.QaDao;
import kr.co.mock.dto.QaDto;
import kr.co.mock.dto.UserDto;

@Controller
public class QaController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/qa/write")
	public String write()
	{
		return "/qa/write";
	}
	
	@RequestMapping("/qa/write_ok")
	public String write_ok(QaDto qdto)
	{
		QaDao bdao=sqlSession.getMapper(QaDao.class); 
		bdao.write_ok(qdto);
		return "redirect:/qa/list";
	}
	
	@RequestMapping("/qa/list")
	public String qa(Model model,HttpServletRequest request)
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
		
		QaDao qdao=sqlSession.getMapper(QaDao.class);
		ArrayList<QaDto> list=qdao.list(index);


		int pstart=page/10;
		if(page%10 == 0)
			pstart=pstart-1;
		pstart=(pstart*10)+1;
		int pend=pstart+9;
		int page_cnt=qdao.get_pagecount();
		
		if(pend>page_cnt)
			pend=page_cnt;
		
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		return "/qa/list";
	}
	
	@RequestMapping("/qa/content")
	public String content(Model model,HttpServletRequest request)
	{   
		int q_id=Integer.parseInt(request.getParameter("q_id"));		
		QaDao qdao=sqlSession.getMapper(QaDao.class);
        QaDto qdto=qdao.content(q_id);
        qdto.setContent(qdto.getContent().replace("\r\n", "<br>"));
        model.addAttribute("qdto",qdto);
		return "/qa/content";
	}
	
	@RequestMapping("/qa/update")
	public String update(Model model,HttpServletRequest request)
	{
		int q_id=Integer.parseInt(request.getParameter("q_id"));
		QaDao qdao=sqlSession.getMapper(QaDao.class);
		QaDto qdto=qdao.update(q_id);
		model.addAttribute("qdto",qdto);
		return "/qa/update";
	}
	
	@RequestMapping("/qa/update_ok")
	public String update_ok(QaDto qdto)
	{
		
		QaDao qdao=sqlSession.getMapper(QaDao.class);
		qdao.update_ok(qdto);
 
		return "redirect:/qa/content?q_id="+qdto.getQ_id();
	}
	
	@RequestMapping("/qa/delete")
	public String delete(HttpServletRequest request)
	{
		
		int q_id=Integer.parseInt(request.getParameter("q_id"));
		QaDao qdao=sqlSession.getMapper(QaDao.class);
		qdao.delete(q_id);
		return "redirect:/qa/list";
	}
	
	@RequestMapping("/qa/adminpage")
	public String adminpage(Model model,HttpServletRequest request)
	{
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		ArrayList<UserDto> adto=adao.adminpage();
		model.addAttribute("adto",adto);  
		return "/qa/adminpage";
		
	}
}
