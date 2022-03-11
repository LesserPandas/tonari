<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.goods-page1 {
	font: 16px "PT Sans Narrow", sans-serif;
	text-transform: uppercase;
	border-bottom: solid 1px #ecebeb;
	padding-bottom: 10px;
	text-align: center;
}

input[type="checkbox"]:checked {
	background-color: #ff8955;
	border-color: rgba(255, 255, 255, 0.3);
	color: white;
}
</style>

<%@ include file="../../header.jsp"%>
<div class="main">
	<div class="container">
		<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
			<!-- BEGIN CONTENT -->
			<div class="col-md-12 col-sm-12">
				<h1>お気に入りの先生リスト</h1>
				<form class="" name="" method="post"
					action="javascript:requestPay()" onSubmit="return go_save()">
					<div class="goods-page">
						<div class="goods-data clearfix">
							<div class="table-wrapper-responsive">

								<table summary="Shopping cart">

									<tr>
										<th class="goods-page-image goods-page1">選択</th>
										<th class="goods-page-image goods-page1">写真</th>
										<th class="goods-page-description goods-page1">説明</th>
										<th class="goods-page-ref-no goods-page1">科目</th>
										<th class="goods-page-price goods-page1">可能曜日</th>
										<th class="goods-page-price goods-page1">1回あたり講義金額</th>
										<th class="goods-page-quantity goods-page1">期限（週）</th>
										<th class="goods-page-total goods-page1" colspan="2">総金額
										</th>
										<th class="goods-page-total goods-page1" colspan="2"></th>
									</tr>

									
									<c:set var="idx" value="0" />
									<c:forEach items="${like}" var="like">
										<tr id="row${idx}" name="${like.teacher_bno }" style="padding: 10px 10px 10px 10px;   text-align: center;">
											<td style="padding-left: 1%; padding-top: 3%;  text-align: center;">
											<input type="checkbox" onclick="totalcheck(${like.teacher_bno })" style="zoom: 2 " name="tcheck"
												id="tcheck_${like.teacher_bno }"></td>
											<td class="goods-page-image "><a href="javascript:;"><img
													src="${like.image }" alt="Berry Lace Dress"></a></td>
											<td class="goods-page-description">
												<p>
													<strong></strong>
												</p>
												<h3>
													<a href="javascript:;" id="nick" name="nick">${like.nick }</a>
												</h3> <em><a
													href="/board/info?teacher_bno=${like.teacher_bno }">先生履歴</a></em>

											</td>
											<td class="goods-page-ref-no" id="category_name" style="text-align: center;   padding-top: 40px;    margin: 0 auto;"
												name="category_name"><strong>
													${like.category_name } </strong></td>

											<td class="goods-page-ref-no_${like.teacher_bno }" style="text-align: center;   padding-top: 40px;    margin: 0 auto;"
												name="${like.dodate}"><strong style="font-size: 14px;">${like.date }</strong></td>

											<td id="money_${like.teacher_bno }" class="goods-page-price" style="text-align: center;   padding-top: 40px;    margin: 0 auto;"
												name="${like.tmoney }"><strong> ${like.tmoney }<span>円</span>
											</strong></td>

											<td class="goods-page-quantity"  style="   text-align: center;    margin: 0px auto;    padding-left: 2%;">

												<div class="product-quantity">
													<input type="text" name="quantity" value="1" 
														class="quantity_${like.teacher_bno }"
														style="border: none; background: #edeff1 !important; font: 300 23px 'Open Sans', sans-serif; color: #647484; height: 38px; width: 50px; text-align: center; padding: 5px;">

													<div class="btn_counting_${like.teacher_bno }">
														<button class="minus" type="button"
															style="background: #67bd3c;" value="${like.teacher_bno }">-</button>
														<button class="plus" type="button"
															style="background: #67bd3c;" value="${like.teacher_bno }">+</button>
													</div>
												</div>


											</td>

											<td class="goods-page-total" style="text-align: right; text-align: cente; padding-top: 40px;    margin: 0 auto;">
												<strong class="total_${like.teacher_bno }"  value="${like.tmoney * like.dodate }">${like.tmoney * like.dodate }<span>
														円</span></strong>


											</td>

											
										</tr>
										<c:set var="idx" value="${idx+1 }" />
									</c:forEach>

								</table>
							</div>

							<div class="shopping-total">
								<ul>

									<li style="padding: 15px 0 15px 0;"><em>選んだ先生</em> <strong class="person">0<span>人</span></strong>

									</li>

									<li class="shopping-total-price" style="padding: 15px 0 15px 0;"><em style=" font-size: 30px;">Total</em> <strong style=" font-size: 30px;"
										class="price"><span id="total" style=" font-size: 30px;">0円 </span></strong></li>
								</ul>
							</div>
						</div>

						<button class="btn btn-default" type="submit">
						  他の先生を探す <i class="fa fa-shopping-cart"></i>
						</button>
						<button class="btn btn-primary" type="submit" style=" font-size: 20px;"
							onclick="requestPay();">
							支払い<i class="fa fa-check"></i>
						</button>
		
					</div>

				</form>
			</div>
			<!-- END CONTENT -->
		</div>

	</div>
</div>


<!-- 한준희 결제 기능 추가 시작. 문제 시 불고기피자 먹으러 감 -->
<script>
	var amount = null;
	var totalPrice = 0;
	var totalPerson = 0;

	$(document).ready(function() {

		//total(0);
		$(".plus").on("click", function() {
			var num = this.value;
			total(1, num);
		});
		$(".minus").on("click", function() {
			var num = this.value;
			total(-1, num);
		});
	});

	function total(n, num) {
		var price = $("#money_" + num).attr("name");
		price = parseInt(price);
		amount = $(".quantity_" + num).attr("value"); //수량
		amount = parseInt(amount); //숫자변환
		amount = amount + n;
		if (amount < 1) {
			amount = 1;
			alert("1週間以上から選択ができます。");
			return;
		}
		var day_count = $(".goods-page-ref-no_" + num).attr("name");
		day_count = parseInt(day_count);

		var tot = price * amount * day_count;
		
		

		$(".quantity_" + num).attr("value", amount);
		/* var regexp = /\B(?=(\d{3})+(?!\d))/g; */
		/* var tot = tot.toString().replace(regexp,','); */

		//$(".total").html(tot);
		$(".total_" + num).html(tot + "円");

		$(".total_" + num).val(tot);

		/* $(".total").html(tot + "("+amount+"일)"); */
		$(".amount").html(amount + "ヶ月");

		$(".total12").attr("value", tot);
		
		var subPrice = price * n * day_count;
		
		addTotalbyCheckedList(num, subPrice);
	}

	//체크하면 총액에 반영하는 함수	
	function totalcheck(num){
		var subPrice = $(".total_" + num).attr('value');
		subPrice = parseInt(subPrice);
		
		if($('#tcheck_'+num).is(':checked')){
			totalPrice += subPrice;
			totalPerson += 1;
		} else {
			totalPrice -= subPrice;
			totalPerson -= 1;
		}
		$("#total").val(totalPrice);
		$("#total").html(totalPrice + "円");
		 
		$(".person").val(totalPerson);
		$('.person').html(totalPerson + "名");
		
	}

	
	function addTotalbyCheckedList(num, subPrice){
		if($('#tcheck_'+num).is(':checked')){
			
			totalPrice += subPrice;
			$("#total").val(totalPrice);
			$("#total").html(totalPrice + "円");
		} else {
			return;
		}
	}
	

	function requestPay() {

		var IMP = window.IMP; //생략가능 
		IMP.init('imp79519178'); //가맹점 식별 코드 : https://docs.iamport.kr/prepare/index?lang=ko#check-accountinfo : a07308@naver.com / Ss3693693!

		IMP.request_pay({
      
      pg : 'inicis', // version 1.1.0부터 지원.
      pay_method : 'card',
      merchant_uid : 'merchant_' + new Date().getTime(),
      name : '注文名:支払いテスト',
      amount : totalPrice, //판매 가격
      buyer_email : 'iamport@siot.do',
      buyer_name : '購入者名前',
      buyer_tel : '010-4030-8107',
      buyer_addr : 'ソウル特別市江南区三成洞',
      buyer_postcode : '123-456'

		}, function(rsp) {
			if (rsp.success) {
				
				saveList();

				location.href="/mypage/payteacherList";
			} else {
				var msg = '支払いに失敗しました。もう一度お支払いをお願い致します。';
				alert(msg);
				location.href = "/mypage/like";
				return;
			}
		});

	}
	
	function saveList(){
		var chk = $('input[name="tcheck"]');
		var arrayList = new Array();
		
		$.each(chk, function(i, ch){
			if($(ch).is(":checked")){
				var teacher = new Object();
				var teacher_bno = $('#'+"row"+i).attr('name');
				teacher.teacher_bno = teacher_bno;
				teacher.member_bno = ${nowUser.bno};
				teacher.submonth = $(".quantity_"+teacher_bno).val();
				teacher.pay = $(".total_"+teacher_bno).attr('value');
				arrayList.push(teacher);
			}
		});
		
		var myList = JSON.stringify(arrayList);
		console.log(myList);
		$.ajax({
				type : 'get',
				url : "/mypage/teacherlikePay",
				data : {
					myList: myList
				},
				dataType : 'json',
				success : function(data) {
					var num = arrayList.length;
					alert(num+"人の先生に受講申請しました。");
				},
				error : function() {
					console.log("通信エラー");
				}
			})
	}
	
</script>

<!-- 한준희 결제 기능 추가 종료. 문제 시 불고기피자 먹으러 감 -->
<%@ include file="../../footer.jsp"%>
