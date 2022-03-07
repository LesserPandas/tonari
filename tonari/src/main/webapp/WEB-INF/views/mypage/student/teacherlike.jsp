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
            <h1>お気に入りの先生リスト</h1>
            <div class="goods-page">
              <div class="goods-data clearfix">
                <div class="table-wrapper-responsive">
                
                <table summary="Shopping cart">
                	
                  <tr>
                  	<th class="goods-page-image goods-page1">選択</th>
                    <th class="goods-page-image goods-page1">写真</th>
                    <th class="goods-page-description goods-page1">説明</th>
                    <th class="goods-page-ref-no goods-page1">科目</th>
                    <th class="goods-page-quantity goods-page1">期限(日にち)</th>
                    <th class="goods-page-price goods-page1">金額</th>
                    <th class="goods-page-total goods-page1" colspan="2">総合金額</th>
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
                      <em><a href="/board/info?board_bno=4">先生履歴</a></em>
                     
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
                      <em>選んだ先生数</em>
                      <strong class="price">3<span>人</span></strong>
                    </li>
                    
                    <li class="shopping-total-price">
                      <em>Total</em>
                      <strong class="price">50.00<span>円</span></strong>
                    </li>
                  </ul>
                </div>
              </div>
              <button class="btn btn-default" type="submit" >他の先生を探す <i class="fa fa-shopping-cart"></i></button>
              <button class="btn btn-primary" type="submit" onclick="requestPay();">お払い <i class="fa fa-check"></i></button>
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
			alert("一日以上から受講ができます。");
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
    	    name : '注文名:支払いテスト',
    	    amount : 1, //판매 가격
    	    buyer_email : 'iamport@siot.do',
    	    buyer_name : '購入者名前',
    	    buyer_tel : '010-4030-8107',
    	    buyer_addr : 'ソウル特別市江南区三成洞',
    	    buyer_postcode : '123-456'
    	}, function(rsp) {
    	    if ( rsp.success ) {
    	        var msg = 'お支払いができました。';
    	        msg += '固有ID : ' + rsp.imp_uid;
    	        msg += '商店取引ID : ' + rsp.merchant_uid;
    	        msg += '支払い金額 : ' + rsp.paid_amount;
    	        msg += 'カード承認番号 : ' + rsp.apply_num;
    	    } else {
    	    	var msg = '支払いに失敗しました。もう一度お支払いをお願い致します。';
    	    	alert(msg);
    	    	 return;
    	    }
    	    alert(msg);
    	});		
    	
    }
  </script>
  
  <!-- 한준희 결제 기능 추가 종료. 문제 시 불고기피자 먹으러 감 -->
    <%@ include file="../../footer.jsp" %>