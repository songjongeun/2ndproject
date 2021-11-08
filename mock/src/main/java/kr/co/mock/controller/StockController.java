package kr.co.mock.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mock.dao.MockDao;
import kr.co.mock.dao.StockDao;
import kr.co.mock.dto.BuyingDto;
import kr.co.mock.dto.StockDto;
import kr.co.mock.util.TimeToUnix;



@Controller
public class StockController {

	@Autowired
	private SqlSession sqlSession;

	
	@RequestMapping("/stocks/st_list")

	public String st_list(StockDto sdto,Model model,HttpServletRequest request)
	{
		MockDao mdao=sqlSession.getMapper(MockDao.class);
		
		// 페이징 =======================================================
		// 페이지&index, curpage=========
		int curpage=10; //한페이지당 나타낼 게시글 수 (조절 가능)
		int page;
		if(request.getParameter("page") ==null )
		{
			page=1;
		}
		else {
			page=Integer.parseInt(request.getParameter("page"));
		}
		int index=(page-1)*curpage; //limit 시의 인덱스 값, 초기값은 0
		// ======================
		// 첫페이지, 마지막페이지
		String field,word;
		if(request.getParameter("field")==null)
		{
			field="code";
			word="";
		}
		else {
			field=request.getParameter("field");
			word=request.getParameter("word");
		}

		
		int startpage=(int)Math.floor((page-1)/curpage)*curpage+1; //한 블럭의 시작페이지
		int lastpage=startpage+(curpage-1); //마지막 페이지
		
		int totalpage=mdao.get_pagecount(curpage,field,word);
		
		if(lastpage>totalpage) { //만일 마지막 페이지가 전체 페이지보다 크게 될 경우
			lastpage=totalpage; //마지막 페이지는 전체 페이지와 같다.
		}
		// ========페이징 종료
		ArrayList<StockDto> list=mdao.st_list(field,word,index,curpage);
		model.addAttribute("list",list);
		model.addAttribute("field", field);
		model.addAttribute("word", word);
		model.addAttribute("page",page);
		model.addAttribute("startpage",startpage);
		model.addAttribute("lastpage",lastpage);
		model.addAttribute("totalpage",totalpage);
		
		return "/stocks/st_list";
	}
	
	@RequestMapping("/stocks/s_content")
	public String s_content(@RequestParam("code") String code,Model model) {
		StockDao sdao= sqlSession.getMapper(StockDao.class);
		String name=sdao.selectName(code);
		
		
		model.addAttribute("code",code);
		model.addAttribute("name", name);
		
		return "/stocks/s_content";
	}
	
	
	// 매수 전 예외처리
	@RequestMapping("/stocks/buying")
	public String buying(@RequestParam("code") String code,HttpSession session,Model model) {
		StockDao sdao=sqlSession.getMapper(StockDao.class);
	

		String userid=null;
		if(session.getAttribute("userid")!=null) {
			userid=session.getAttribute("userid").toString();
		}
		

		if (userid==null) {

			return "redirect:/stocks/st_list";
		}
		
		/*
		int countMock=sdao.selectCountMock(userid);
		if (countMock==0) {
			// 투자 신청 안함
			return "/main_view";
		}

		*/
		int mileage=sdao.selectMileage(userid);	//포인트
		int price = sdao.selectPrice(code);
		int buyLen= mileage/price;
		
		String codeName=sdao.selectName(code);
		
		model.addAttribute("codeName",codeName);
		model.addAttribute("code", code);
		model.addAttribute("price",price);
		model.addAttribute("mileage", mileage);
		model.addAttribute("buyLen", buyLen);
		
		return "/stocks/buying";
	}
	
	
	
	@PostMapping("/stocks/buying_ok")
	public String buying_ok(BuyingDto bdto,Model model) {
		StockDao sdao=sqlSession.getMapper(StockDao.class);
		sdao.insertBuying(bdto);

		
		return "/main_view"; 	//거래 내역 있는 곳으로
	}
	
	
	
	
	@RequestMapping(value="/stocks/testData2",produces="application/json",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> testData2(@RequestParam Map<String, Object> reqData) {
		String code=reqData.get("code").toString();
		
		StockDao sdao=sqlSession.getMapper(StockDao.class);
		ArrayList<StockDto> list=sdao.selectData(code);
		TimeToUnix tou=new TimeToUnix();
		
		List<Map<String,Object>> datalist = new ArrayList<>();
		
		
		for(int i=0;i<list.size();i++) {
				
			String timestamp=list.get(i).getDate();
			timestamp=timestamp+"T00:00:00.000-0000";
			long date= tou.tsToSec8601(timestamp);
			int open =list.get(i).getOpen();
			int high =list.get(i).getHigh();
			int low = list.get(i).getLow();
			int close=list.get(i).getClose();
			int volume=list.get(i).getVol();
			Map<String,Object> map =new HashMap<>();
			map.put("date", date);
			map.put("open", open);
			map.put("high", high);
			map.put("low", low);
			map.put("close", close);
			map.put("volume", volume);
			datalist.add(map);
			
		}

		
		 
		return datalist;
	}
	
	
	@RequestMapping(value="/stocks/testData",produces="application/json",method=RequestMethod.GET)
	@ResponseBody
	public long[][] testData(@RequestParam Map<String, Object> reqData) {
		String code=reqData.get("code").toString();
		StockDao sdao=sqlSession.getMapper(StockDao.class);
		ArrayList<StockDto> list=sdao.selectData(code);
		TimeToUnix tou=new TimeToUnix();
		long[][] data =new long[list.size()][6];
		
		for(int i=0;i<list.size();i++) {
				
			String timestamp=list.get(i).getDate();
			 timestamp=timestamp+"T00:00:00.000-0000";
			
			long date= tou.tsToSec8601(timestamp);
			long open =list.get(i).getOpen();
			long high =list.get(i).getHigh();
			long low = list.get(i).getLow();
			long close=list.get(i).getClose();  
			long volume=list.get(i).getVol();
			data[i][0]=date;
			data[i][1]=open;
			data[i][2]=high;
			data[i][3]=low;
			data[i][4]=close;
			data[i][5]=volume;
			
		}
		
		 
		 
		return data;
	}
	

	

	
	@RequestMapping("/stocks/testJson")
	public String testJson(Model model){
		StockDao sdao=sqlSession.getMapper(StockDao.class);
		String code="A035720";
		ArrayList<StockDto> list=sdao.selectData(code);
		model.addAttribute("list",list);
		return "/stocks/testJson";
	}
	
	
	
	@RequestMapping("/stocks/testJson2")
	public String testChart() {
		
		return "/stocks/testJson2";
	}
	@RequestMapping("/stocks/testJson3")
	public String testJson3() {
		
		return "/stocks/testJson3";
	}
	
	@RequestMapping("/stocks/testAjax")
	public String testAjax() {
		
		return "/stocks/testAjax";
	}
	
	@RequestMapping("/stocks/testJson4")
	public String testJson4() {

		
		return "/stocks/testJson4";
	}
	
}
