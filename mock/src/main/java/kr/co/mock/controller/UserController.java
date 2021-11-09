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

import kr.co.mock.dao.MockDao;
import kr.co.mock.dao.UserDao;
import kr.co.mock.dto.BuyingDto;
import kr.co.mock.dto.SellingDto;
import kr.co.mock.dto.StockDto;
import kr.co.mock.dto.UserDto;

@Controller
public class UserController {

	@Autowired
	private SqlSession sqlSession;

	// 마이페이지 창, 로그인 안 하면 로그인 화면으로 

	@RequestMapping("/mypage/mypage")
	public String mypage(Model model,HttpSession session)
	{
		if(session.getAttribute("userid") != null)
		{
			String userid=session.getAttribute("userid").toString();
			UserDao udao=sqlSession.getMapper(UserDao.class);
			MockDao mdao=sqlSession.getMapper(MockDao.class);
			UserDto udto=udao.mypage(userid);
			model.addAttribute("udto",udto);
			
			// 거래내역 가져오기
			ArrayList<BuyingDto> bdto=udao.his_b(userid);
			ArrayList<SellingDto> sdto=udao.his_s(userid);

			if(!bdto.isEmpty())
			{// 매수내역이 있을때
				model.addAttribute("buy", 1);
				ArrayList<BuyingDto> bdto3=new ArrayList<BuyingDto>();
				for(int i=0;i<bdto.size();i++)
				{
					BuyingDto bdto2=new BuyingDto();
					String name=udao.stocks_names(bdto.get(i).getCode());
					bdto2.setB_id(bdto.get(i).getB_id());
					bdto2.setN_buying(bdto.get(i).getN_buying());
					bdto2.setAsk_spread(bdto.get(i).getAsk_spread());
					bdto2.setUserid(bdto.get(i).getUserid());
					bdto2.setCode(bdto.get(i).getCode());
					bdto2.setB_day(bdto.get(i).getB_day());
					bdto2.setName(name);
					bdto3.add(bdto2);
				}
				model.addAttribute("bdto3",bdto3);
			}
			if(!sdto.isEmpty())
			{// 매도내역이 있을때
				model.addAttribute("sel", 1);
				ArrayList<SellingDto> sdto3=new ArrayList<SellingDto>();
				for(int i=0;i<sdto.size();i++)
				{
					SellingDto sdto2=new SellingDto();
					String name=udao.stocks_names(sdto.get(i).getCode());
					sdto2.setS_id(sdto.get(i).getS_id());
					sdto2.setN_selling(sdto.get(i).getN_selling());
					sdto2.setBid_spread(sdto.get(i).getBid_spread());
					sdto2.setUserid(sdto.get(i).getUserid());
					sdto2.setCode(sdto.get(i).getCode());
					sdto2.setS_day(sdto.get(i).getS_day());
					sdto2.setName(name);
					sdto3.add(sdto2);
					
				}
				model.addAttribute("sdto3",sdto3);
			}
			
			Integer mileage=mdao.get_point(userid);
			
			model.addAttribute("mileage",mileage);

			ArrayList<BuyingDto> b_total=udao.b_total(userid);

			if(!b_total.isEmpty())  // 보유 주 정보
			{
				ArrayList<BuyingDto> total3=new ArrayList<BuyingDto>();

				for(int i=0;i<b_total.size();i++)
				{
					String name=udao.stocks_names(b_total.get(i).getCode());
					SellingDto s_total=udao.s_total(b_total.get(i).getCode(),userid);
					if(s_total==null)
					{
						BuyingDto total2=new BuyingDto();
						total2.setName(name);
						total2.setN_buying(b_total.get(i).getN_buying());
						total2.setTotal(b_total.get(i).getTotal());
						total2.setAvg(b_total.get(i).getTotal()/b_total.get(i).getN_buying());
						total2.setCode(b_total.get(i).getCode());
						total3.add(total2);
					}
					else 
					{
						BuyingDto total2=new BuyingDto();
						total2.setName(name);
						total2.setN_buying(b_total.get(i).getN_buying()-s_total.getN_selling());
						total2.setTotal(b_total.get(i).getTotal()-s_total.getTotal());
						total2.setCode(b_total.get(i).getCode());
						total3.add(total2);
					}
				}
				
				model.addAttribute("total3",total3);
			
			}
			return "/mypage/mypage";
		}
		else //("userid") == null
		{
			 return "redirect:/user/login?chk=1";
		}
	}
	
	// 마이페이지 수정 
	@RequestMapping("/mypage/mypage_update")
	public String mypage_update(Model model,HttpSession session)
	{
		String userid=session.getAttribute("userid").toString();
		UserDao udao=sqlSession.getMapper(UserDao.class); 
		UserDto udto=udao.mypage_update(userid);
		model.addAttribute("udto",udto);
		return "/mypage/mypage_update";
	}
	
	// 마이페이지 수정 및 수정하면 다시 마이페이지로 
	@RequestMapping("/mypage/mypage_update_ok")
	public String mypage_update_ok(UserDto udto,HttpSession session)
	{
		UserDao udao=sqlSession.getMapper(UserDao.class);
		udto.setUserid(session.getAttribute("userid").toString());
		udao.mypage_update_ok(udto);

		return "redirect:/mypage/mypage";
	}
	
	// 마이페이지 회원 탈퇴 및 계정 삭제 
	@RequestMapping("/mypage_delete")
	public String delete(HttpSession session)
	{
		String userid=session.getAttribute("userid").toString();
		UserDao udao=sqlSession.getMapper(UserDao.class);
		udao.mypage_delete(userid);
		session.invalidate();
		return "redirect:/main_view";

	}
	
	// 김재현
	// -----
	// 조건국
	
	
	// 로그인 페이지
	@RequestMapping("/user/login")
	public String login(HttpServletRequest request,Model model)
	{
		model.addAttribute("chk",request.getParameter("chk"));
		return "/user/login";
	}

	// 회원가입 페이지
	@RequestMapping("/user/member")
	public String member(HttpServletRequest request,Model model)
	{
		model.addAttribute("f",request.getParameter("f"));
		
		return "/user/member";
	}

	// 회원가입시 아이디 중복체크
	@RequestMapping("/user/userid_check")
	public void userid_check(HttpServletRequest request,PrintWriter out)
	{
		String userid=request.getParameter("userid");
		UserDao udao=sqlSession.getMapper(UserDao.class);
		int chk=udao.userid_check(userid);
		out.print(chk);
	}

	// 회원가입 완료
	@RequestMapping("/user/member_ok")
	public String member_ok(HttpServletRequest request,UserDto udto,HttpSession session)
	{
		String auto=request.getParameter("auto");
		
		UserDao udao=sqlSession.getMapper(UserDao.class);
		int chk=udao.userid_check(udto.getUserid());
		if(chk==0)
		{
			udao.member_ok(udto); 
			if(auto.equals("1"))  // 회원가입 후 자동로그인
			{
				UserDto udto2=udao.login_ok(udto);
				if(udto2==null)
				{
					return "redirect:/user/login?chk=1";
				}
				else
				{
					session.setAttribute("userid",udto2.getUserid());
					session.setAttribute("username",udto2.getUsername());
					
					return "/main_view";
				}
			}
			else
			{
				return "redirect:/main_view";
			}
		}
		else
		{
			return "redirect:/user/member?f=1";
		}
	}

	// 로그인 완료
	@RequestMapping("/user/login_ok")
	public String login_ok(UserDto udto,HttpSession session)
	{
		UserDao udao=sqlSession.getMapper(UserDao.class);
		UserDto udto2=udao.login_ok(udto);
		if(udto2==null)
		{
			return "redirect:/user/login?chk=1";
		}
		else
		{
			session.setAttribute("userid",udto2.getUserid());
			session.setAttribute("username",udto2.getUsername());
			
			return "/main_view";
		}
	}

	// 로그아웃
	@RequestMapping("/user/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "/main_view";
	}

	// 아이디찾기화면
	@RequestMapping("/user/userid_search")
	public String userid_search()
	{
		return "/user/userid_search";
	}

	// 비밀번호찾기화면
	@RequestMapping("/user/pwd_search")
	public String pwd_search()
	{
		return "/user/pwd_search";
	}

	// 아이디-비밀번호 결과화면
	@RequestMapping("/user/ip_search_ok")
	public String ip_search_ok(UserDto udto,Model model)
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
		UserDto udto2=udao.ip_search_ok(udto);
		
		if(udto2==null)
		{
			model.addAttribute("chk", chk);
		}
		else
		{
			model.addAttribute("user", chk);
			model.addAttribute("userid", udto2.getUserid());
			model.addAttribute("pwd", udto2.getPwd());
			model.addAttribute("username", udto2.getUsername());
			model.addAttribute("email", udto2.getEmail());
		}
		
//		System.out.println(udto2.getUserid());
		return "/user/ip_search_ok";
	}

	// 관심종목 화면
	@RequestMapping("/user/my_interests")
	public String my_interests(HttpSession session,Model model)
	{// 관심종목 가져오기
		String userid=(String) session.getAttribute("userid");
		
		UserDao udao=sqlSession.getMapper(UserDao.class);
		ArrayList<UserDto> udto=udao.my_interests(userid);
		MockDao mdao=sqlSession.getMapper(MockDao.class);

		if(udto.isEmpty())
		{// 관심종목이 없을때
			model.addAttribute("chk", 1);
			return "/user/my_interests";
		}
		else
		{
			ArrayList<UserDto> udto2=new ArrayList<UserDto>();
			ArrayList<StockDto> sdto=new ArrayList<StockDto>();
			for(int i=0;i<udto.size();i++)
			{
//				System.out.println(udto.get(i).getCode());
				if(udao.stk_rt(udto.get(i).getCode())==null)
				{
					UserDto udtoe=new UserDto();
					String name=udao.stocks_names(udto.get(i).getCode());
					udtoe.setErr(1);
					udtoe.setName(name);
					udto2.add(udtoe);
				}
				else
				{
					udto2.add(udao.stk_rt(udto.get(i).getCode()));
				}
				
				if(udao.my_mocks(udto.get(i).getCode())==null)
				{
					StockDto sdtoe=new StockDto();
					String name=udao.stocks_names(udto.get(i).getCode());
					sdtoe.setErr(1);
					sdtoe.setName(name);
					sdto.add(sdtoe);
				}
				else
				{
					sdto.add(udao.my_mocks(udto.get(i).getCode()));
				}
			}
			

			model.addAttribute("sdto",sdto);
			model.addAttribute("udto",udto);
			model.addAttribute("udto2",udto2);
			return "/user/my_interests";
		}
		
	}
	
	
	
	
	
	
}
