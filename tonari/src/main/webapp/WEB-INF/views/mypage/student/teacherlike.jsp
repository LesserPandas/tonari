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
    </style>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
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
                    <th class="goods-page-image goods-page1">사진</th>
                    <th class="goods-page-description goods-page1">성명</th>
                    <th class="goods-page-ref-no goods-page1">과목</th>
                    <th class="goods-page-quantity goods-page1">기간(일)</th>
                    <th class="goods-page-price goods-page1">가격</th>
                    <th class="goods-page-total goods-page1" colspan="2">총 가격  </th>
                     <th class="goods-page-total goods-page1" colspan="2"></th>
                  </tr>
                  <tr>
                    <td class="goods-page-image ">
                      <a href="javascript:;"><img src="assets/pages/img/products/model2.jpg" alt="Berry Lace Dress"></a>
                    </td>
                    <td class="goods-page-description">
                       <p><strong>이름</strong></p>
                      <h3>닉네임</h3>
                     
                    </td>
                    <td class="goods-page-ref-no">
                      javc2133
                    </td>
                    <td class="goods-page-quantity">
                      
                      <div class="product-quantity">
                      	<input type="text" name="quantity" value="1" class="quantity   " 
									style=" border: none;    background: #edeff1 !important;    font: 300 23px 'Open Sans', sans-serif;    color: #647484;    height: 38px;    width: 50px;    text-align: center;    padding: 5px;">
									
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
                      <strong class="total">1818<span>円</span></strong>
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
                      <em>1회 수강료</em>
                      <strong class="price"><span>$</span>47.00</strong>
                    </li>
                    <li>
                      <em>강의일 </em>
                     
                      <strong class="price">3<span>일</span></strong>
                    </li>
                    <li class="shopping-total-price">
                      <em>Total</em>
                      <strong class="price"><span>$</span>50.00</strong>
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


    function requestPay() {
    	
    	var IMP = window.IMP; //생략가능 
    	IMP.init('imp79519178'); //가맹점 식별 코드 : https://docs.iamport.kr/prepare/index?lang=ko#check-accountinfo : a07308@naver.com / Ss3693693!
    			
    			
    	IMP.request_pay({
    	    pg : 'inicis', // version 1.1.0부터 지원.
    	    pay_method : 'card',
    	    merchant_uid : 'merchant_' + new Date().getTime(),
    	    name : '주문명:결제테스트',
    	    amount : 14000, //판매 가격
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
    	        var msg = '결제에 실패하였습니다.';
    	        msg += '에러내용 : ' + rsp.error_msg;
    	    }
    	    alert(msg);
    	});		
    	<%-- var msg;
    			
    			// IMP.request_pay(param, callback) 결제창 호출
            IMP.request_pay({ // param
          pg: 'kakaopay',					// 일단 카페 원툴
          pay_method: 'card',			// 일단 카페 원툴
          merchant_uid: 'ORD20180131-0000011', //가맹점에서 생성/관리하는 고유 주문번호 라고함. : bno로 연동 예정
          name: '노르웨이 회전 의자',				// 결제할 선생님 이름
          amount: 64900, 					//결제 금액
          buyer_email: 'gildong@gmail.com', //주문자 이메일[페이먼트월 필수]
          buyer_name: '홍길동',				//주문자 이름
          buyer_tel: '010-4030-8107',		//주문자 번호
          buyer_addr: '서울특별시 강남구 신사동',	//---------------------필요 없을 듯
          buyer_postcode: '01181'			//---------------------필요 없을 듯
      }, function (rsp) { // callback
          if (rsp.success) {// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
              // jQuery로 HTTP 요청
              jQuery.ajax({
                  url: '{서버의 결제 정보를 받는 endpoint}', // 예: https://www.myservice.com/payments/complete 
                  method: 'POST',
                  headers: { 'Content-Type': 'application/json' },
                  data: {
                      imp_uid: rsp.imp_uid, //imp_uid : 아임포트 고유 결제번호
                      merchant_uid: rsp.merchant_uid // 가맹점에서 생성/관리하는 고유 주문번호 라고함. : bno로 연동 예정
                  }
              }).done(function (data) {
            	  //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                  if ( everythings_fine ) {
                      msg = '결제가 완료되었습니다.';
                      msg += '\n고유ID : ' + rsp.imp_uid;
                      msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                      msg += '\결제 금액 : ' + rsp.paid_amount;
                      msg += '카드 승인번호 : ' + rsp.apply_num;
                      
                      alert(msg);
                  } else {
                      //[3] 아직 제대로 결제가 되지 않았습니다.
                      //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                  }
              });
              //성공시 이동할 페이지
              location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
              })           
              } else {
            	/*  alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg); */
            	 msg = '결제에 실패하였습니다.';
                 msg += '에러내용 : ' + rsp.error_msg;
                 //실패시 이동할 페이지
                 location.href="<%=request.getContextPath()%>/order/payFail";
                 alert(msg);
          }
      }); --%>
    }
  </script>
  
  <!-- 한준희 결제 기능 추가 종료. 문제 시 불고기피자 먹으러 감 -->
    <%@ include file="../../footer.jsp" %>