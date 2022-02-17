## 프로젝트 명
여기 오를까?
### 프로젝트 소개
주식이 활성화됨에 따라 주요 주식 몇가지로 주식 모의 투자를 할 수 있는 웹사이트를 팀 프로젝트를 통해 구성했습니다.<br>
Spring Framework를 사용하여 제작했습니다.<br>
주요기능으로는 모의 주식을 위해 포인트를 신청해 주식을 사고 팔아볼 수 있는 매도매수게시판과 json을 이용해 실시간 주식 차트를 볼 수 있습니다.<br>
기본적인 기능으로 로그인, 자유게시판, 공지사항 등이 존재합니다.<br>
부가적으로 모의 주식 포인트를 신청할 시 신청하고 모의 투자를 경험할 수 있는 날 수를 정하여 그 날짜 동안 진행해볼 수 있도록 SQL 수식을 이용했습니다.<br>

### 맡은 분야
- 전체적인 레이아웃 구성 <br>
- 모의 주식 사이트의 매도, 매수 및 주식 목록 게시판 작성<br>
- 모의 주식 사이트의 포인트 신청 게시판<br>

### 사용 기술 (직접 사용한 것은 볼드)
**Java** / python / **HTML** / **CSS** 
**Spring MVC Framework** / **JQuery** / ajax / Pandas/ Beautifulsoup<br>
/ jason / **Apache Tomcat** <br>
**Maria DB** <br>
**STS** <br>
**Windows**

### 상세 안내
![project_ex1](https://user-images.githubusercontent.com/89518067/152289683-f9c09eaa-5dd6-4813-a10c-d6867152ef7c.png) <br>
거래 증감버튼: -와 +버튼으로 숫자를 줄이거나 늘림(자바스크립트),숫자만 입력가능(정규식 사용)<br>
컨트롤러에서 로그인 했을 경우 포인트를 이미 가지고 있는 경우와 그렇지 않은 경우를 나눠 표시 할 수 있도록 진행<br>
비로그인 시 매도 및 매수를 진행할 수 없으며 바로 로그인 페이지로 이어짐 <br>
#### MockController.java
```
//매수----
@RequestMapping("/stocks/buying")
	public String buying(HttpServletRequest request,Model model,HttpSession session)
	{
		String code=request.getParameter("code");
		String name=request.getParameter("name");
		MockDao mdao=sqlSession.getMapper(MockDao.class);
		StockDto sdto=mdao.st_buysell(code);

		//mock 테이블에서 포인트 조회를 위해 가져오는 값
		if(session.getAttribute("userid")!=null) { //로그인 
			String userid=session.getAttribute("userid").toString();
			int id_check=mdao.mockInvestCount(userid); //포인트 조회를 위해 먼저 신청했던 적이 있는지 확인
			if(id_check==0) { //만약 아이디가 조회되지 않으면
				int mileage=0; //마일리지 값을 0으로 조정.
				model.addAttribute("mileage",mileage);
				model.addAttribute("sdto",sdto);
				model.addAttribute("name",name);
			}
			else { //모의신청 신청한 아이디가 있을 시
				int mileage=mdao.get_point(userid); //조회된 마일리지를 가져옴.			
				model.addAttribute("sdto",sdto);
				model.addAttribute("mileage",mileage);
				model.addAttribute("name",name);

			}
		}else //로그인 X
		{
			int mileage=0; //마일리지 값을 0으로 조정.
			model.addAttribute("mileage",mileage);
			model.addAttribute("sdto",sdto);
			model.addAttribute("name",name);
 		}
	
		return "/stocks/buying";
	}
	//매수----
	
	//매도-----
	@RequestMapping("/stocks/selling")
	public String selling(HttpServletRequest request,Model model,HttpSession session)
	{
		String code=request.getParameter("code");
		MockDao mdao=sqlSession.getMapper(MockDao.class);
		StockDto sdto=mdao.st_buysell(code); // ---------------
		//mock 테이블에서 포인트 조회를 위해 가져오는 값
		if(session.getAttribute("userid")!=null) { //로그인 
			String userid=session.getAttribute("userid").toString();
			int id_check=mdao.mockInvestCount(userid); //포인트 조회를 위해 먼저 신청했던 적이 있는지 확인 
			if(id_check==0) { //만약 아이디가 조회되지 않으면-----------
				int mileage=0; //마일리지 값을 0으로 조정.
				model.addAttribute("mileage",mileage);
				model.addAttribute("sdto",sdto);
			}
			else { //모의신청 신청한 아이디가 있을 시
				int mileage=mdao.get_point(userid); //조회된 마일리지를 가져옴.	--------
				 //해당 아이디가 구매한 총 매수 갯수를 가져옴
				int buy=mdao.buy_get(code,userid); //주식을 구매했는지  여부
				int diff;
				if(buy>0) { //주식을 구매했다면
					int n_buying=mdao.buy_count(userid,code);
					int sell=mdao.sell_get(code, userid); //판매주식이 있는지 확인
					if(sell>0) {//판매한 내용이 있다면
						int n_selling=mdao.sell_count(userid,code); //해당 아이디가 판매한 총 매도 갯수를 가져옴
						diff=(n_buying-n_selling);

						model.addAttribute("sdto",sdto);
						model.addAttribute("mileage",mileage);
						model.addAttribute("diff",diff);
					}
					else { //판매한 내용이 없다면
						sell=0;
						diff=n_buying;
						model.addAttribute("sdto",sdto);
						model.addAttribute("mileage",mileage);
						model.addAttribute("diff",diff);
					}

				}
				else {
					diff=0;
					model.addAttribute("sdto",sdto);
					model.addAttribute("mileage",mileage);
					model.addAttribute("diff",diff);
				}
			}
		}else //로그인 X
		{
			int mileage=0; //마일리지 값을 0으로 조정.
			model.addAttribute("mileage",mileage);
			model.addAttribute("sdto",sdto);
 		}
	
		return "/stocks/selling";
	}
```
#### MockDao.xml //매도는 일부만 표기함
```
<!-- 매수매도 -->
	<insert id="buying_ok" parameterType="kr.co.mock.dto.BuyingDto">
		insert into buying(userid,code,n_buying,ask_spread,b_day)
		values(#{param1},#{param2},${param3},${param4},now());
	</insert> <!--모의투자 매도표시를 위해 데이터 삽입 -->
	
	<select id="buy_get" resultType="Integer">
		select count(*) from buying where code=#{param1} and userid=#{param2}
	</select> <!--매도시 매수를 진행했는지 확인을 위한 카운트-->

	<select id="buy_count" resultType="Integer">
		select sum(n_buying) from buying where userid=#{param1} and code=#{param2}
	</select> <!--매수 주 갯수-->

```
#### buying.jsp
```
<script>
var num;
var curr; // 매수가
var mil; // 남아있는 마일리지
var sum_mil; //매수가*주
var curr_mil; // 매수가-sum_mil
$(function(){/*숫자 증감 버튼*/
	$("#minus").click(function(){
		num = Number($(".n_buying").val());
		mil = Number($("#mileage").val()); //받은 포인트
		curr = Number($("#curr").val()); //매수가
		num--;
		
		if(num<=0){
			alert('최저 매수 갯수는 1주입니다.');
			num =1;
		}
		
		sum_mil = curr*num;
		curr_mil = mil-sum_mil;
		
		$(".n_buying").val(num);
		$(".sum_mil").val(sum_mil);
		$(".curr_mil").val(curr_mil);
		
	});
	$("#plus").click(function(){
		num = Number($(".n_buying").val());
		mil = Number($("#mileage").val());
		curr = Number($("#curr").val());
		var maxbuy=parseInt(${mileage}/${sdto.open});
		num++;
		if(maxbuy<num){
			alert("마일리지 한도 이상을 구매할 수 없습니다.");
			num=maxbuy;
		}
 
		sum_mil = curr*num;
		curr_mil = mil-sum_mil;
		
		$(".n_buying").val(num);
		$(".sum_mil").val(sum_mil);
		$(".curr_mil").val(curr_mil);
	});
}); 
</script>

<div class="week">거래주</div>
		<div class="week_num">
		<input type="button" id="minus" class="btn btn-outline-danger btn-sm" value= "-"
		style="font-size:12px;margin-bottom:5px;">
	  	<input type="text" class="n_buying" name="n_buying" value="1" size="4"
	  	style="text-align:right;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>&nbsp;주<!-- 거래 숫자만 입력 -->
	  	<input type="button" id="plus" class="btn btn-outline-danger btn-sm" value="+" 
	  	style="font-size:12px;margin-bottom:5px;">
		</div>
```
![project_ex2](https://user-images.githubusercontent.com/89518067/152391786-9737a921-9c27-45a2-bc90-dbad0fe6eba6.png)<br>
모의포인트 신청 시 신청한 날을 기준으로 포인트를 운용할 수 있는 기간 선택 <br>
해당 기간이 지난 후 다시 신청 가능 - SQL문으로 구현 <br>
#### MockController.java
```
@RequestMapping("/in_regi_ok")
	public String in_regi_ok(UserDto udto,MockDto mdto,HttpServletRequest request,Model model,HttpSession session) throws Exception
	{
		MockDao mdao=sqlSession.getMapper(MockDao.class);
		String userid;
		
		if(session.getAttribute("userid")!=null) {//로그인 한 상태라면			
			userid=session.getAttribute("userid").toString();//로그인했을 경우 userid 세선에서 가져옴.
			int id_count=mdao.mockInvestCount(userid); //모의신청한 적이 있는 userid 검색용
			if(id_count==0)//로그인 상태에서 해당 userid가 모의신청 테이블에 정보가 없으면 모의신청가능.
			{
				int m_close=Integer.parseInt(request.getParameter("m_close"));
				int mileage=Integer.parseInt(request.getParameter("mileage"));
				mdao.in_regi_ok(mdto, userid, m_close, mileage);
				return "redirect:/main_view";
			} //로그인&모의 신청 X
			else { // 로그인&모의 신청 O 
				int diff=mdao.get_enddate(userid);
				String notday;
				if(diff ==0) {//모의 투자 신청을 한 적이 있을 경우 마지막 신청 날짜와 비교한다.
					//현재 날짜 > 종료날짜 =1//종료시점이 지나 다시 신청 가능.

					int m_close=Integer.parseInt(request.getParameter("m_close"));
					int mileage=Integer.parseInt(request.getParameter("mileage"));
					mdao.in_regi_ok(mdto, userid, m_close, mileage);
					notday=null;
					return "redirect:/main_view";
					 
					}
				else { //diff=0 or 음수 일 경우 현재 날짜와 같거나 종료이전 이므로 신청 불가
					notday="1";
					return "redirect:/invest/in_regi?notday=1";
					
				}			
			} //로그인&모의 신청 if문 종료
		}//로그인 했을 시의 if문 종료
		
		else { // 로그인을 하지 않았다면 로그인 페이지로
			return "/user/login";
		}//전체 if 문 종료
	}
	//---모의 신청 완료
```
#### MockDao.xml
```
	<insert id="in_regi_ok" parameterType="kr.co.mock.dto.MockDto">
		insert into mock_invest(userid,m_open,m_close,mileage,m_apply)
		values(#{param2},now(),date_add(m_open,interval ${param3} month),${param4},1)
	</insert> <!-- 모의 포인트 신청시 데이터 삽입 -->
	<select id="get_enddate" resultType="Integer">
		SELECT if(NOW()>m_close,0,1) AS diff from mock_invest  where userid=#{param1} order BY m_id DESC limit 1;
	<!-- 신청한 아이디 중 가장 최신에 신청한 날짜와 현재 날짜를 종료 날짜와 비교 -->
```
#### 매도&매수
제목 - 주식명 확인 <br>
포인트 - 포인트가 모의신청으로 연결, 포인트가 있을 시 현재 남아있는 포인트 확인, fmt 태그로 3자리 단위로 금액 단위 표시 <br>
주당매도가 - DB에 저장된 주당매도가를 불러와서 확인, fmt 태그로 3자리 단위로 금액 단위 표시 <br>
거래주 - -와 +버튼으로 숫자를 줄이거나 늘림(자바스크립트), 숫자 외 입력 불가(style,onkeyup으로 구현) <br>
거래주가 0이 될 경우 경고 팝업창과 1로 자동 수정, 현재 포인트보다 많을 시 거래 불가 팝업창 <br>
매도시엔 현재 소유한 거래주보다 많을 시 거래 불가 팝업창 <br>
거래 합계 - 거래주의 변형에 따라 주당매도가x거래주로 실시간 반영 <br>
남은 마일리지 - 거래되었을 경우 남은 마일리지 실시간 반영 <br>
#### 모의신청
포인트가 없을 경우 신청  <br>
신청한 날을 기준으로 포인트를 운용할 수 있는 기간 선택 <br>
해당 기간이 지난 후 다시 신청 가능 - SQL문으로 구현 <br>
#### 전체 UI
Html5와 css 사용, Grid와 flex사용하여 페이지 구성.

### 개선사항
거래 합계 및 남은 마일리지에 숫자 단위 콤마 넣기 <br>
포인트, 주당 매수가, 거래합계, 남은 마일리지 UI 
