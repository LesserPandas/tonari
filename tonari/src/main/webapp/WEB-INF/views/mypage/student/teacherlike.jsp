<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    .goods-page1{
    font: 16px "PT Sans Narrow", sans-serif;
    text-transform: uppercase;
    border-bottom: solid 1px #ecebeb;
    padding-bottom: 10px;
    text-align:center;
    
    
    }
    input[type="checkbox"]:checked {
        background-color: #ff8955;
        border-color: rgba(255, 255, 255, 0.3);
        color: white;
    }
    </style>
    
<%@ include file="../../header.jsp" %>
    <div class="main">
      <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>좋아요한 선생 목록</h1>
            <div class="goods-page">
              <div class="goods-data clearfix">
                <div class="table-wrapper-responsive">
                
                <table summary="Shopping cart">
                	
                  <tr>
                  	<th class="goods-page-image goods-page1">선택</th>
                    <th class="goods-page-image goods-page1">사진</th>
                    <th class="goods-page-description goods-page1">설명</th>
                    <th class="goods-page-ref-no goods-page1">과목</th>
                    <th class="goods-page-quantity goods-page1">기간(일)</th>
                    <th class="goods-page-price goods-page1">가격</th>
                    <th class="goods-page-total goods-page1" colspan="2">총 가격  </th>
                     <th class="goods-page-total goods-page1" colspan="2"></th>
                  </tr>
                  <tr>
                  	<td ><input type="checkbox" style="zoom:2"></td>
                    <td class="goods-page-image ">
                      <a href="javascript:;"><img src="${teacher.image }" alt="Berry Lace Dress"></a>
                    </td>
                    <td class="goods-page-description">
                       <p><strong></strong></p>
                      <h3><a href="javascript:;">${teacher.nick }</a></h3> 
                      <p><strong>${teacher.name }</strong> ${teacher.coment }</p>
                      <em><a href="/board/info?board_bno=4">선생님 이력</a></em>
                     
                    </td>
                    <td class="goods-page-ref-no">
                      ${teacher.category_name }
                    </td>
                    <td class="goods-page-quantity">
                      
                      <div class="product-quantity">
                      	<input type="text" name="quantity" value="1" class="quantity" style=" border: none;    background: #edeff1 !important;    font: 300 23px 'Open Sans', sans-serif;    color: #647484;    height: 38px;    width: 50px;    text-align: center;    padding: 5px;">
									
					<div>
                      <button class="minus" type="button"style="background:#67bd3c;">-</button>
                      <button class="plus" type="button" style="background:#67bd3c;">+</button>
                      </div>	
						</div>
									
						
                    </td>
                    <td class="goods-page-price">
                      <strong>1818<span>円</span></strong>
                      
                    </td>
                    <td class="goods-page-total" style="text-align: right;">
                      <strong class="total"><span>円</span></strong>
                    </td>
                    <td class="del-goods-col">
                      <a class="del-goods" href="javascript:;"></a>
                    </td>
                  </tr>
             
                
                </table>
                </div>

                <div class="shopping-total">
                  <ul>
                    <li>
                      <em>선택한 선생님 수</em>
                      <strong class="price">3<span>명</span></strong>
                    </li>
                    
                    <li class="shopping-total-price">
                      <em>Total</em>
                      <strong class="price">50.00<span>円</span></strong>
                    </li>
                  </ul>
                </div>
              </div>
              <button class="btn btn-default" type="submit" >다른 선생찾으러가기 <i class="fa fa-shopping-cart"></i></button>
              <button class="btn btn-primary" type="submit" onclick="requestPay();">결제 <i class="fa fa-check"></i></button>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
      
      </div>
    </div>
    

    <!-- 한준희 결제 기능 추가 시작. 문제 시 불고기피자 먹으러 감 -->
<script>


$(document).ready(function() {
	var total = function(n) {
		var price=$(".product-details .details span").attr("class");
		var amount = $(".quantity").attr("value"); //수량
		var amount = parseInt(amount); //숫자변환
		var amount = amount + n;
		if(amount < 1) {
			amount=1;
			alert("1일 이상부터 수강이 가능합니다.!");
		}
		var tot = 1818 * amount;
		$(".quantity").attr("value",amount);
		/* var regexp = /\B(?=(\d{3})+(?!\d))/g;
		var tot = tot.toString().replace(regexp,','); */
		
		$(".total").html(tot+"円");
		$(".amount").html(amount);
	}
	total(0);
	$(".plus").on("click",function() {
		total(1);
	});
	$(".minus").on("click",function() {
		total(-1);
	});
});
    function requestPay() {
    	
    	var IMP = window.IMP; //생략가능 
    	IMP.init('imp79519178'); //가맹점 식별 코드 : https://docs.iamport.kr/prepare/index?lang=ko#check-accountinfo : a07308@naver.com / Ss3693693!
    			
    			
    	IMP.request_pay({
    	    pg : 'inicis', // version 1.1.0부터 지원.
    	    pay_method : 'card',
    	    merchant_uid : 'merchant_' + new Date().getTime(),
    	    name : '주문명:결제테스트',
    	    amount : 1, //판매 가격
    	    buyer_email : 'iamport@siot.do',
    	    buyer_name : '구매자이름',
    	    buyer_tel : '010-4030-8107',
    	    buyer_addr : '서울특별시 강남구 삼성동',
    	    buyer_postcode : '123-456'
    	}, function(rsp) {
    	    if ( rsp.success ) {
    	        var msg = '결제가 완료되었습니다.';
    	        msg += '고유ID : ' + rsp.imp_uid;
    	        msg += '상점 거래ID : ' + rsp.merchant_uid;
    	        msg += '결제 금액 : ' + rsp.paid_amount;
    	        msg += '카드 승인번호 : ' + rsp.apply_num;
    	    } else {
    	    	var msg = '결제에 실패하였습니다. 다시 결제를 진행해주세요';
    	    	alert(msg);
    	    	 return;
    	    }
    	    alert(msg);
    	});		
    	
    }
  </script>
  
  <!-- 한준희 결제 기능 추가 종료. 문제 시 불고기피자 먹으러 감 -->
    <%@ include file="../../footer.jsp" %>