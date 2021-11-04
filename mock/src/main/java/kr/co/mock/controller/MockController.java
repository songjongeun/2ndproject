package kr.co.mock.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mock.HomeController;
import kr.co.mock.dao.MockDao;
import kr.co.mock.dto.BuyingDto;
import kr.co.mock.dto.MockDto;
import kr.co.mock.dto.StockDto;
import kr.co.mock.dto.UserDto;

@Controller
public class MockController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/main_view")
	public String main_view()
	{
		return "/main_view";
	}
	
	@RequestMapping("/invest/in_regi")
	public String in_regi()
	{
		return "/invest/in_regi";
	}
	
	@RequestMapping("/in_regi_ok")
	public String in_regi_ok(UserDto udto,MockDto mdto,HttpServletRequest request,Model model,HttpSession session) throws Exception
	{
		MockDao mdao=sqlSession.getMapper(MockDao.class);
		String userid;
		
		if(session.getAttribute("userid")!=null) {//로그인 한 상태라면			
			userid=session.getAttribute("userid").toString();//로그인했을 경우 userid 세선에서 가져옴.
			int id_count=mdao.search_id(userid); //모의신청한 적이 있는 userid 검색용
			
			if(id_count==0)//로그인 상태에서 해당 userid가 모의신청 테이블에 정보가 없으면 모의신청가능.
			{
				int m_close=Integer.parseInt(request.getParameter("m_close"));
				int mileage=Integer.parseInt(request.getParameter("mileage"));
				mdao.in_regi_ok(mdto, userid, m_close, mileage);
				return "redirect:/main_view";
			} //로그인&모의 신청 X
			else { // 로그인&모의 신청 O 
				Date todate;//현재 날짜 구하는 객체
				Date enddate; // sql 에서 가져온 모의 신청 마지막 날
				MockDto endmdto=mdao.get_enddate(userid);
				int m_apply=endmdto.getM_apply(); // 모의투자신청여부 가지고 옴
				String close=endmdto.getM_close();//모의투자 종료날짜 가지고 옴.

				SimpleDateFormat format=new SimpleDateFormat("yyyy-mm-dd",Locale.KOREA); //코리아기준 현재날짜
				todate=new Date();
				String oTime=format.format(todate); //현재 날짜(String)
				
				enddate = new SimpleDateFormat("yyyy-mm-dd").parse(close);//모의 종료날짜 Date
				todate = format.parse(oTime);//현재 날짜 Date
				
				int diffdays=todate.compareTo(enddate); //현날짜와 종료날짜 비교 값.
				

				if(m_apply!=1 && diffdays < 0) {//모의 투자 신청을 한 적이 있을 경우 마지막 신청 날짜와 비교한다.
					//현재 날짜 > 종료날짜 //종료시점이 지나 다시 신청 가능.
					int m_close=Integer.parseInt(request.getParameter("m_close"));
					int mileage=Integer.parseInt(request.getParameter("mileage"));
					mdao.in_regi_ok(mdto, userid, m_close, mileage);
					return "redirect:/main_view";
					}
				else { //diffdays=0 or 음수 일 경우 현재 날짜와 같거나 종료이전 이므로 신청 불가
					return "redirect:/invest/in_regi?notday=1";
				}			
			} //로그인&모의 신청 if문 종료
		}//로그인 했을 시의 if문 종료
		
		else { // 로그인을 하지 않았다면 로그인 페이지로
			return "/user/login";
		}//전체 if 문 종료
	}
	//---모의 신청 완료
	
	//---사고 팔기
	
	@RequestMapping("/stocks/st_list")
	public String st_list(StockDto sdto,Model model)
	{
		MockDao mdao=sqlSession.getMapper(MockDao.class);

		ArrayList<StockDto> list=mdao.st_list();
		model.addAttribute("list",list);
		
		return "/stocks/st_list";
	}
	
	//----매도
	@RequestMapping("/stocks/buying")
	public String buying(HttpServletRequest request,Model model,HttpSession session)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		MockDao mdao=sqlSession.getMapper(MockDao.class);
		StockDto sdto=mdao.st_content(id);
		//mock 테이블에서 포인트 조회를 위해 가져오는 값
		if(session.getAttribute("userid")!=null) { //로그인 
			String userid=session.getAttribute("userid").toString();
			int id_check=mdao.search_id(userid); //포인트 조회를 위해 먼저 신청했던 적이 있는지 확인
			if(id_check==0) { //만약 아이디가 조회되지 않으면
				int mileage=0; //마일리지 값을 0으로 조정.
				model.addAttribute("mileage",mileage);
				model.addAttribute("sdto",sdto);
			}
			else { //모의신청 신청한 아이디가 있을 시
				int mileage=mdao.get_point(userid); //조회된 마일리지를 가져옴.			
				model.addAttribute("sdto",sdto);
				model.addAttribute("mileage",mileage);
			}
		}else //로그인 X
		{
			int mileage=0; //마일리지 값을 0으로 조정.
			model.addAttribute("mileage",mileage);
			model.addAttribute("sdto",sdto);
 		}
	
		return "/stocks/buying";
	}
	
	@RequestMapping("/buying_ok")
	public String buying_ok(HttpServletRequest request,HttpSession session,Model model)
	{
		if(session.getAttribute("userid")!=null) //로그인 지속 시간이 지나 로그아웃 되었을 때를 대비 
		{
			String userid=session.getAttribute("userid").toString();
			String mileage=request.getParameter("curr_mil");
			String code=request.getParameter("code");
			int n_buying=Integer.parseInt(request.getParameter("n_buying"));
			int ask_spread=Integer.parseInt(request.getParameter("ask_spread"));
			MockDao mdao=sqlSession.getMapper(MockDao.class);
			mdao.buying_ok(userid, code, n_buying, ask_spread);
			mdao.mileage_update(mileage,userid);
			return "redirect:/stocks/st_list";
		}
		else {
			return "/user/login";
		}
			
	}
	//-----매수
	
	//매도-----
	@RequestMapping("/stocks/selling")
	public String selling(HttpServletRequest request,Model model,HttpSession session)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		MockDao mdao=sqlSession.getMapper(MockDao.class);
		StockDto sdto=mdao.st_content(id);
		//mock 테이블에서 포인트 조회를 위해 가져오는 값
		if(session.getAttribute("userid")!=null) { //로그인 
			String userid=session.getAttribute("userid").toString();
			int id_check=mdao.search_id(userid); //포인트 조회를 위해 먼저 신청했던 적이 있는지 확인
			if(id_check==0) { //만약 아이디가 조회되지 않으면
				int mileage=0; //마일리지 값을 0으로 조정.
				model.addAttribute("mileage",mileage);
				model.addAttribute("sdto",sdto);
			}
			else { //모의신청 신청한 아이디가 있을 시
				int mileage=mdao.get_point(userid); //조회된 마일리지를 가져옴.			
				model.addAttribute("sdto",sdto);
				model.addAttribute("mileage",mileage);
			}
		}else //로그인 X
		{
			int mileage=0; //마일리지 값을 0으로 조정.
			model.addAttribute("mileage",mileage);
			model.addAttribute("sdto",sdto);
 		}
	
		return "/stocks/selling";
	}
	
	@RequestMapping("/selling_ok")
	public String selling_ok()
	{
		
		return "redirect:/stocks/st_list";
	}
	//----매도
}
