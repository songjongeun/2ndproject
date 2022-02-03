## 프로젝트 명
여기 오를까?
### 프로젝트 소개
주식이 활성화됨에 따라 주요 주식 몇가지로 주식 모의 투자를 할 수 있는 웹사이트를 팀 프로젝트를 통해 구성
### 사용 기술
SpringFramework <br>
Maria DB <br>
HTML <br>

### Advanced Feature
![project_ex1](https://user-images.githubusercontent.com/89518067/152289683-f9c09eaa-5dd6-4813-a10c-d6867152ef7c.png) <br>
거래 증감버튼: -와 +버튼으로 숫자를 줄이거나 늘림(자바스크립트),숫자만 입력가능 
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
### 맡은 부분
모의신청(가상포인트신청),주식 매수, 매도 페이지 및 전체 UI <br>
### 상세 안내
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
해당 기간이 지난 후 다시 신청 가능 - 스케쥴러로 구현 <br>
#### 전체 UI
Grid와 flex사용하여 페이지 구성.
