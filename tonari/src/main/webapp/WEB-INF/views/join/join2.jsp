<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


​
<%@include file="../header.jsp"%>

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li><a href="">Store</a></li>
			<li class="active">Checkout</li>
		</ul>
		<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
			<!-- BEGIN CONTENT -->
			<div class="col-md-12 col-sm-12">
				<h1>Checkout</h1>
				<!-- BEGIN CHECKOUT PAGE -->
				<div class="panel-group checkout-page accordion scrollable"
					id="checkout-page">

					<!-- BEGIN CHECKOUT -->
					<div id="checkout" class="panel panel-default">


						<!-- BEGIN PAYMENT ADDRESS -->
						<div id="payment-address" class="panel panel-default">
							<div class="panel-heading">
								<h2 class="panel-title">
									<a data-toggle="collapse" data-parent="#checkout-page"
										href="#payment-address-content" class="accordion-toggle">
										会員登録 </a>
								</h2>
							</div>
							<form class="" name="formm" method="post" action="/join/memberinsertpro.do" onSubmit="return go_save()">
							
								<div id="payment-address-content" class="panel-collapse collapse in">
									<div class="panel-body row">
										<div class="col-md-6 col-sm-6">
										
										
										<h3>アカウント情報</h3>
											<div class="form-group" style="width: 300px;">
												<label for="nick">ニックネーム</label> <input type="text" id="nick"
													name="nick" class="form-control" placeholder="英語、数字、特殊文字で作成してください。!">
											</div>
											<div class="form-group" style="width: 300px;">
												<label for="email">メール <span class="require">*</span></label>
												<label>メールアドレスにお知らせが通知されますので、必ず受信可能なメールアドレスで登録してください。</label>
												<input type="text" id="email" name="email"
													class="form-control" placeholder="メール登録"> <span
													id="msg" style="display: block; padding: 5px 0;"></span>
											</div>
											<div class="form-group" style="width: 300px;">
												<label for="password">パスワード <span class="require">*</span></label>
												<input type="password" id="passwd" name="passwd"
													class="form-control">
											</div>
											<div class="form-group" style="width: 300px;">
												<label for="password">パスワードチェック<span
													class="require">*</span></label> <input type="password"
													id="pwdcheck" name="pwdcheck" class="form-control">
											</div>
										
											<h3>個人情報</h3>
											<div class="form-group" style="width: 300px;">
												<label for="firstname" for="name">名前<span
													class="require">*</span></label> <input type="text" id="name"
													name="name" class="form-control">
											</div>
											<div class="form-group" style="width: 300px;">
												<label for="country">性別 <span class="require">*</span></label>
												<select class="form-control input-sm" name="sex" id="sex">
													
													<option value="m">男</option>
													<option value="f">女</option>

												</select>
											</div>
											<div class="form-group" style="width: 300px;">
												<label for="phone">電話番号<span class="require">*</span></label>
												<input type="text" id="phone" id="phone" name="phone"
													class="form-control" placeholder="電話番号を入力してください。">
											</div>


											
										</div>

									

									<div class="col-md-6 col-sm-6">
										<h3>住所</h3>

										<div id="layer"
											style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch; ">
											<img
												src="//t1.daumcdn.net/postcode/resource/images/close.png"
												id="btnCloseLayer"
												style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
												onclick="closeDaumPostcode()" alt="閉じる">
										</div>
										<div class="form-group" style="display: flex;">
											<input type="text" name="zipcode" class="form-control"
												id="sample2_postcode" placeholder="郵便番号" readonly
												style="text-align: center; width: 150px; margin: 0px 5px 0px 0;">
											<input type="button" onclick="sample2_execDaumPostcode()"
												value="郵便番号を探す" class="form-control" style="width: 300px;"><br>
										</div>
										<div class="form-group" >
											<label for="address1">住所</label> <input type="text"
												id="sample2_address" name="address" placeholder="全体住所" readonly
												class="form-control" style="width:300px"><br>
										</div>
										<div class="form-group" style="display: flex;">

											<input type="text" id="sample2_guAddr" name="gu" readonly
												placeholder="区" class="form-control"
												style="width: 100px; text-align: center; margin: -20px 39px 0px 0;">


											<input type="text" id="sample2_extraAddress" name="dong"
												placeholder="同" class="form-control" readonly
												style="width: 100px; text-align: center; margin: -20px 39px 0px 0;">
										</div>
										<div class="form-group" style="width: 300px;">
											<label for="address1">詳細住所</label> <input type="text"
												id="address1" name="o_addr" class="form-control">
										</div>
										<!--  <div class="form-group">
                        <label for="address2">Address 2</label>
                        <input type="text" id="address2" class="form-control">
                      </div>
                      <div class="form-group">
                        <label for="city">City <span class="require">*</span></label>
                        <input type="text" id="city" class="form-control">
                      </div>
                      <div class="form-group">
                        <label for="post-code">Post Code <span class="require">*</span></label>
                        <input type="text" id="post-code" class="form-control">
                      </div>
                     
                      <div class="form-group">
                        <label for="region-state">Region/State <span class="require">*</span></label>
                        <select class="form-control input-sm" id="region-state">
                          <option value=""> --- Please Select --- </option><option value="3513">Aberdeen</option><option value="3514">Aberdeenshire</option><option value="3515">Anglesey</option>
                        </select>
                      </div> -->
									</div>
									<hr>
									<div class="col-md-12">

										<!--                       <button class="btn btn-primary  pull-right"  -->
										<!--                       type="submit" data-toggle="collapse"  -->
										<!--                       data-parent="#checkout-page"  -->
										<!--                       data-target="#shipping-address-content"  -->
										<!--                       id="button-payment-address" -->
										<!--                        onclick="go_save()">회원가입하기</button> -->
										<button type="submit" class="btn btn-primary  pull-right">会員登録</button>
										<div class="checkbox pull-right">
											<label> <input type="checkbox"> I have read
												and agree to the <a title="Privacy Policy"
												href="javascript:;">Privacy Policy</a> &nbsp;&nbsp;&nbsp;
											</label>
										</div>

									</div>

								</div>
								</div>
							</form>
							<!--  -->
						</div>
					</div>
					<!-- END PAYMENT ADDRESS -->

					<!-- BEGIN SHIPPING ADDRESS -->

					<!-- BEGIN CONFIRM -->

					<!-- END CONFIRM -->
				</div>
				<!-- END CHECKOUT PAGE -->
			</div>
			<!-- END CONTENT -->
		</div>
		<!-- END SIDEBAR & CONTENT -->
	</div>
</div>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function emailSend(){
	let clientEmail = document.getElementById(elementld:'emailText').value;
	let emailYN = isEamil(clientEmail); 
	
	if(emailYN == true){
		
		$.ajax({
			type:"POST",
			url:"api/member/email",
			data:{userEmail:clientEmail},
			success:function(data){
				
			},error :function(e){
				alert("오류입니다. 잠시 후 다시 시도해주시길 바랍니다.");
			}
		});
	}else{
		alert('올바른 이메일 형식을 입력해주세요');
	}
	
}

function isEmail(asValue){
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return regExp.test(asValue);
}




	// 우편번호 찾기 화면을 넣을 element
	var element_layer = document.getElementById('layer');

	function closeDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
	}

	function sample2_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 동항목 변수
						var guAddr = ''; //구 항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== '' && /[동]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.

							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample2_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample2_extraAddress").value = '';

						}

						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.sigungu !== ''
									&& /[구]$/g.test(data.sigungu)) {
								guAddr += data.sigungu;
							}

							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample2_guAddr").value = guAddr;

						} else {
							document.getElementById("sample2_guAddr").value = '';

						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample2_postcode').value = data.zonecode;
						document.getElementById("sample2_address").value = addr;
						document.getElementById("sample2_guAddr").value = guAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("address1").focus();

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_layer.style.display = 'none';
					},
					width : '100%',
					height : '100%',
					maxSuggestItems : 5
				}).embed(element_layer);

		// iframe을 넣은 element를 보이게 한다.
		element_layer.style.display = 'block';

		// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		initLayerPosition();
	}

	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition() {
		var width = 300; //우편번호서비스가 들어갈 element의 width
		var height = 400; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 5; //샘플에서 사용하는 border의 두께

		// 위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
				+ 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
				+ 'px';
	}

	/* 내가 추가한 것 */
	/*      function emailCheck(){
	       var id = $('#email').val(); //id값이 "id"인 입력란의 값을 저장
	       $.ajax({
	           url:'emailCheck.do', //Controller에서 인식할 주소
	           type:'post', //POST 방식으로 전달
	           data:{id:id},
	           success:function(){
	               console.log("처리 성공 시 변경되는 내용");
	           },
	           error:function(){
	               alert("에러입니다");
	           }
	       });
	   }; */
	/* 내가 추가한 것 */
	function go_save() {
		if (document.formm.email.value == "") {
			alert("メールアドレスを入力してください。");
			document.formm.email.focus();
			return false;
		} else if (formm.passwd.value == "") {
			alert("パスワードを入力してください。");
			formm.passwd.foucs();
			return false;
		} else if (formm.passwd.value != formm.pwdcheck.value) {
			alert("パスワードが一致しません");
			formm.passwd.focus();
			return false;
		} else {
			return true;
		}
	}

	$(function() {

		$("#email").blur(function() {
			$.ajax({
				type : 'post',
				url : "/join/emailCheck.do",
				data : {
					email : $("#email").val()
				},
				dataType : 'text',
				success : function(cnt) {
					console.log(cnt);
					if (cnt == 0) {
						if ($("#email").val() != "") {
							alert("使用可能なメールアドレスです。");
						}
					} else {
						if ($("#email").val() != "") {
							alert("使用不可能なメールアドレスです。");
							$("#email").val("");
							$("#email").focus();
						}
					}
				},
				error : function() {
					alert("通信エラー");
				}
			})
		})

		//닉네임

		$("#nick").blur(function() {
			$.ajax({
				type : 'post',
				url : "/join/nickCheck.do",
				data : {
					nick : $("#nick").val()
				},
				dataType : 'text',
				success : function(cnt) {
					console.log(cnt);
					if (cnt == 0) {
						if ($("#nick").val() != "") {
							alert("使用可能なニックネームです。");
						}
					} else {
						if ($("#nick").val() != "") {
							alert("使用不可能なニックネームです。");
							$("#nick").val("");
							$("#nick").focus();
						}
					}
				},
				error : function() {
					alert("通信エラー");
				}
			})
		})

		//

	});
</script>
<%@include file="../footer.jsp"%>
