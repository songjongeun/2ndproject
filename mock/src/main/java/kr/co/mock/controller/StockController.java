package kr.co.mock.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mock.dao.StockDao;
import kr.co.mock.dto.LikeDto;
import kr.co.mock.dto.StockDto;
import kr.co.mock.util.TimeToUnix;



@Controller
public class StockController {

	@Autowired
	private SqlSession sqlSession;

	

	
	@RequestMapping(value="/stocks/testData2",produces="application/json",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> testData2(@RequestParam Map<String, Object> reqData) {
		String code=reqData.get("code").toString();
		
		StockDao sdao=sqlSession.getMapper(StockDao.class);
		ArrayList<StockDto> list=sdao.selectData(code);
		TimeToUnix tou=new TimeToUnix();
		
		List<Map<String,Object>> datalist = new ArrayList<>();
		
		
		for(int i=0;i<list.size();i++) {
					
			String stamp=list.get(i).getDate();
			String[] stamp1=stamp.split(" ");
			String timestamp=stamp1[0];
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
				
			String stamp=list.get(i).getDate();
			String[] stamp1=stamp.split(" ");
			String timestamp=stamp1[0];
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
	@RequestMapping("/stocks/aipredict")
	public String aipredict(@RequestParam("code") String code,Model model) {
		
		StockDao sdao= sqlSession.getMapper(StockDao.class);
		
		String imgName=sdao.getImgName(code);
		String name=sdao.selectName(code);
		int close= sdao.selectPrice(code);
		int cprice = sdao.getPredictPrice(code);
		model.addAttribute("name", name);
		model.addAttribute("imgName", imgName);
		model.addAttribute("code", code);
		model.addAttribute("close", close);
		model.addAttribute("cprice", cprice);
		
		return "/stocks/aipredict";
	}

	@RequestMapping(value="/stocks/like",produces="application/json",method=RequestMethod.GET)
	@ResponseBody
	public Map like(@RequestParam Map<String, Object> param) {
		// 카운트
		// sdto.setCode(code);
		Map<String,Object> map=new HashMap<>();
		int chk;
		String userid;
		if (param.get("userid").toString()=="") {
			
			chk=0;
			map.put("chk", chk);
			return map;
		}else {
			userid=param.get("userid").toString();
		}
			
		LikeDto ldto=new LikeDto();
		ldto.setUserid(userid);
		ldto.setCode(param.get("code").toString());
		StockDao sdao=sqlSession.getMapper(StockDao.class);
		chk=sdao.selectCountInterests(ldto);
		
		
		map.put("chk", chk);
		
		
		return map;
	}
	@RequestMapping(value="/stocks/likeButton",produces="application/json",method=RequestMethod.GET)
	@ResponseBody
	public Map likeButton(@RequestParam Map<String, Object> param) {
		// 카운트
		// sdto.setCode(code);
		Map<String,Object> map=new HashMap<>();
		int chk;
		String userid;
		if (param.get("userid").toString()=="") {
			
			chk=0;
			map.put("chk", chk);
			return map;
		}
			userid=param.get("userid").toString();
		
			LikeDto ldto=new LikeDto();
			ldto.setUserid(userid);
			ldto.setCode(param.get("code").toString());
			StockDao sdao=sqlSession.getMapper(StockDao.class);
			chk=sdao.selectCountInterests(ldto);
			
			if (chk==0) {
				
				sdao.insertValueInterests(ldto);
				chk=1;
			}else {
				sdao.deleteValueInterests(ldto);
				chk=0;
			}
			
			map.put("chk", chk);	
			
			
			return map;
		
		
		}

}

	/*
	@RequestMapping("/stocks/testJson")
	public String testJson(Model model){
		String code="A000660";
		StockDao sdao=sqlSession.getMapper(StockDao.class);
		ArrayList<StockDto> list=sdao.selectData(code);
		String timestamp= list.get(1).getDate();
		String []time=timestamp.split(" ");
		String time1=time[0];
		model.addAttribute("date", timestamp);
		model.addAttribute("time", time1);
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
	*/
	

