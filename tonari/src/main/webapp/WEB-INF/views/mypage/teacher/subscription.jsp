<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
    <div class="main">
      <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <form class="" name="form2" method="get" action="javascript:requestPay1()">
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">

            <h1 style="padding: 10px 0 10px 0;">先生を要請する。</h1>

            <div class="goods-page">
              <div class="goods-data clearfix">
                <div class="table-wrapper-responsive">
                <table summary="Shopping cart">
                  <tr>
                   <!--  <th class="goods-page-image">사진</th> -->
                    <th class="goods-page-description">ニックネーム</th>
                    <!-- <th class="goods-page-ref-no">종목</th> -->

                    <th class="goods-page-quantity">期限</th>
                    <th class="goods-page-price">金額</th>
                    <th class="goods-page-total" colspan="2">金額</th>

                  </tr>
                  <tr>
                    <!-- <td class="goods-page-image">
                      <a href="javascript:;"><img src="assets/pages/img/products/model3.jpg" alt="Berry Lace Dress"></a>
                    </td> -->
                    <td class="goods-page-description" style="padding-top: 40px;">
                      <h3>${nowUser.nick}</h3>
                      <!-- <p><strong>한마디</strong> 개발자가 진짜 나랑 맞는 걸까?</p>
                      <a href="javascript:;">선생 정보</a> -->
                    </td>
                    <!-- <td class="goods-page-ref-no">
                      javc2133
                    </td> -->
                    <td class="goods-page-quantity">
                      
                      <div class="product-quantity">
                      	<input type="text" name="quantity2" value="1" class="quantity2"
									style=" border: none;    background: #edeff1 !important;    font: 300 23px 'Open Sans', sans-serif;    color: #647484;    height: 38px;    width: 50px;    text-align: center;    padding: 5px;">
									
									<div>
                      <button class="minus1" type="button"style="background:#67bd3c;">-</button>
                      <button class="plus1" type="button" style="background:#67bd3c;">+</button>
                      </div>	
						</div>
									
						
                    </td>
                    <td class="goods-page-price" style="padding-top: 3%;">
                      <strong>1000<span>円</span></strong>
                    </td>
                    <td class="goods-page-total" style="padding-top: 3%;">
                      <strong class="total3" id="totalMonth"></strong>
                    </td>
                    
                  </tr>
                 
                
                </table>
                </div>

                <div class="shopping-total">
                  <ul>
                    
                    <li style="padding: 15px 0 15px 0;">
                      <em >기간</em>
                      <strong class="amount2"></strong>
                    </li>
                    <li class="shopping-total-price" style="padding: 15px 0 15px 0;">
                      <em  style=" font-size: 30px;">Total</em>
                      <strong class="total3" style=" font-size: 30px;"></strong>
                    </li>
                  </ul>
                </div>
              </div>
              <!-- <button class="btn btn-default" type="submit">다른 선생찾으러가기 <i class="fa fa-shopping-cart"></i></button> -->
              <button class="btn btn-primary" type="submit" onclick="">支払い <i class="fa fa-check"></i></button>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
     </form>
      </div>
    </div>
<script type="text/javascript">

//내가 추가
var amount = null;

$(document).ready(function() {
	var total = function(n) {
		var price=$(".product-details .details span").attr("name");
		amount = $(".quantity2").attr("value"); //수량
		amount = parseInt(amount); //숫자변환
		amount = amount + n;
		if(amount < 1) {
			amount=1;
			alert("一日以上から選択可能です。");
		}
		var tot = 1000 * amount;
		
		$(".quantity2").attr("value",amount);
		/* var regexp = /\B(?=(\d{3})+(?!\d))/g; */
		/* var tot = tot.toString().replace(regexp,','); */
		
		$(".total2").html(tot);
		 $(".total3").html(tot + "円"); 
		/* $(".total").html(tot + "("+amount+"일)"); */

		$(".amount2").html(amount+ "(ヶ月)");

	}
	total(0);
	$(".plus1").on("click",function() {
		total(1);
	});
	$(".minus1").on("click",function() {
		total(-1);
	});	
});

function getInnerText() {
  const element = document.getElementById('totalMonth');
  var result = element.innerText;
  return result;
};

function requestPay1() {
	var link='/mypage/teacherJoin';
	var IMP = window.IMP; //생략가능 
	IMP.init('imp79519178'); //가맹점 식별 코드 : https://docs.iamport.kr/prepare/index?lang=ko#check-accountinfo : a07308@naver.com / Ss3693693!
			
			
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '注文名:支払いテスト',
	    amount : getInnerText(), //판매 가격 : amount*1000
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '購入者名前',
	    buyer_tel : '010-4030-8107',
	    buyer_addr : 'ソウル特別市江南区三成洞',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = 'お支払いができました';
	        msg += 'ニックネーム : ' + rsp.imp_uid;
	        msg += '購読ヶ月: ' + rsp.merchant_uid;
	        msg += '支払い金額 : ' + getInnerText();
	        var bno = ${nowUser.bno};
	        console.log("msg" + msg);
	        console.log("amount : " + amount);
	        console.log("セッション番号: " + bno);
	        /* msg += '카드 승인번호 : ' + rsp.apply_num; */
	        location.href = "/mypage/payMonthJoin?member_bno="+bno+"&submonth="+amount;
	        /* 저장하는 컨트롤러 */
	    } else {
	        var msg = '支払いに失敗しました。もう一度お支払いをお願い致します。';
	       /* msg += '에러내용 : ' + rsp.error_msg;  */
	       alert(msg);
	        location.href = "/mypage/subscription";
	       return;
	    };
	  
	    /* window.open(link);  */
	     /* opener.location.href='/mypage/teacherJoin'; */
	 /* opener.location.href="/mypage/teacherJoin"; */
	 /*    return (/mypage/teacher/teacherJoin);  */
	});		
}
	//내가 추가
</script>
    <%@ include file="../../footer.jsp" %>