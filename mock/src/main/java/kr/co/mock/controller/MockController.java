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
import kr.co.mock.dto.MockDto;
import kr.co.mock.dto.UserDto;

@Controller
public class MockController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("main_view")
	public String index(MockDto mdto,HttpSession session,Model model,HttpServletRequest request) throws Exception {
		MockDao mdao=sqlSession.getMapper(MockDao.class);
		String userid=session.getAttribute("userid").toString();//로그인했을 경우 userid 세선에서 가져옴.
		ArrayList<MockDto> endmdto=mdao.get_enddate(userid);
		int m_apply=endmdto.get(0).getM_apply(); // 모의투자신청여부 가지고 옴
		
		if(userid!=null) {//로그인 한 상태라면	
			Date todate;//현재 날짜 구하는 객체
			Date enddate; // sql 에서 가져온 모의 신청 마지막 날
			
				String close=endmdto.get(0).getM_close();//모의투자 종료날짜 가지고 옴.

				SimpleDateFormat format=new SimpleDateFormat("yyyy-mm-dd",Locale.KOREA); //코리아기준 현재날짜
				todate=new Date();
				String oTime=format.format(todate); //현재 날짜(String)
				
				enddate = new SimpleDateFormat("yyyy-mm-dd").parse(close);//모의 종료날짜 Date
				todate = format.parse(oTime);//현재 날짜 Date
				
				int diffdays=todate.compareTo(enddate); //현날짜와 종료날짜 비교 값.

			
					model.addAttribute("diffdays",diffdays);
				return "main_view";
				
			} return "main_view";
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
		String userid=session.getAttribute("userid").toString();//로그인했을 경우 userid 세선에서 가져옴.
		
		if(userid!=null) {//로그인 한 상태라면			
			Date todate;//현재 날짜 구하는 객체
			Date enddate; // sql 에서 가져온 모의 신청 마지막 날
			ArrayList<MockDto> endmdto=mdao.get_enddate(userid);
			int m_apply=endmdto.get(0).getM_apply(); // 모의투자신청여부 가지고 옴
				
			String close=endmdto.get(0).getM_close();//모의투자 종료날짜 가지고 옴.

			SimpleDateFormat format=new SimpleDateFormat("yyyy-mm-dd",Locale.KOREA); //코리아기준 현재날짜
			todate=new Date();
			String oTime=format.format(todate); //현재 날짜(String)
			
			enddate = new SimpleDateFormat("yyyy-mm-dd").parse(close);//모의 종료날짜 Date
			todate = format.parse(oTime);//현재 날짜 Date
			
			int diffdays=todate.compareTo(enddate); //현날짜와 종료날짜 비교 값.
			
			if(m_apply==1 && diffdays<0) {//모의 투자 신청을 한 적이 있을 경우 마지막 신청 날짜와 비교한다.
			//현재 날짜 > 종료날짜 //종료시점이 지나 다시 신청 가능.
				int m_close=Integer.parseInt(request.getParameter("m_close"));
				int mileage=Integer.parseInt(request.getParameter("mileage"));
				mdao.in_regi_ok(mdto, userid, m_close, mileage);
				return "redirect:/main_view";
			}
			else { //diffdays=0 or 음수 일 경우 현재 날짜와 같거나 종료이전 이므로 신청 불가
				return "redirect:/in_regi?notday=1";
			}			
		}
		else { // 로그인을 하지 않았다면 로그인 페이지로
			return "/user/login";
		}//전체 if 문 종료
	}

}
