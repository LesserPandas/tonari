<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<link href="/resources/custom/css/tmypage.css" rel="stylesheet">

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li><a href="">마이페이지</a></li>
			<li class="active">선생님 등록</li>
		</ul>
		<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
			<!-- BEGIN SIDEBAR -->
			<%@ include file="../mypagesidebar.jsp"%>
			<!-- END SIDEBAR -->
			<!-- BEGIN CONTENT -->
			<div class="col-md-9 col-sm-7">
				<div class="product-page">
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<div class="image-container">
								<img style="display: block; max-width: 100%; height: auto;"
									id="preview-image" src="${tvo.image }">
							</div>
						</div>
						<form name="teacherinfo" action="/mypage/teacherJoin" 
							method="post" enctype="multipart/form-data" onsubmit = "return chkjoin()"> 
						<input type="hidden" name="dodate" id="dodate">
						<input type="hidden" name="member_bno" value="${tvo.member_bno }">
						<input type="hidden" name="age" id="age">
							<div class="col-md-6 col-sm-6">
								<input class="form-control" type="text" id="title" name="title" 
									value= "${tvo.title }" placeholder="소개 타이틀">
								<div class="price-availability-block clearfix">
									<div class="price">
										<strong>${nowUser.nick }</strong>
										<input type="hidden" name="nick" value="${nowUser.nick }">
									</div>
								</div>
								<div class="description">
									<div class="form-group">
										<label for="name">선생님의 한마디 <span class="require">*</span></label>
										<input type="text" class="form-control" id="coment" name="coment"
											value="${tvo.coment }" placeholder="20글자 내외로 적으세요!">
									</div>
								</div>
								<div class="product-page-options">
									<div class="pull-left">
										<label class="control-label">과목 :</label> 
										<select class="form-control input-sm" name="category" id="category">
											<option value="1">일본어</option>
											<option value="2">JAVA</option>
											<option value="3">PYTHON</option>
											<option value="4">JAVASCRIPT</option>
											<option value="5">SPRING</option>
											<option value="6">HTML5+CSS3</option>
											<option value="7">DATABASE</option>
										</select>
									</div>
									<div class="pull-left">
										<label class="control-label">지역 :</label>
										<strong style="">${tvo.gu }&nbsp;${tvo.dong }</strong>
									</div>
									<div class= "col-md-12" style="margin-top: 3px;">
										<div class="row">
										<label class="control-label">생년월일 :</label>
											<select id="select_year" class="form-control input-sm" onchange="javascript:lastday();"> 
												<option>년</option> 
											</select>
											<select id="select_month" class="form-control input-sm" onchange="javascript:lastday();"> 
												<option>월</option> 
											</select>
											<select id="select_day" class="form-control input-sm"> 
												<option>일</option> 
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<p>수업이 가능한 날짜를 선택해 주세요!</p>
									<table class="teacherdate">
										<tr>
											<th>일</th>
											<th>월</th>
											<th>화</th>
											<th>수</th>
											<th>목</th>
											<th>금</th>
											<th>토</th>
										</tr>
										<tr class="">
											<td>
												<label for="sun"></label>
												<input type="checkbox" name="date" id="sun" value="64">
											</td>
											<td>
											<input type="checkbox" name="date" id="mon" value="32">
												<label for="mon"></label>
											</td>
											<td>
												<input type="checkbox" name="date" id="tue" value="16">
												<label for="tue"></label>
											</td>
											<td>
												<input type="checkbox" name="date" id="wed" value="8">
												<label for="wed"></label>
											</td>
											<td>
												<input type="checkbox" name="date" id="thu" value="4">
												<label for="thu"></label>
											</td>
											<td>
												<input type="checkbox" name="date" id="fri" value="2">
												<label for="fri"></label>
											</td>
											<td>
												<input type="checkbox" name="date" id="sat" value="1">
												<label for="sat"></label>
											</td>
										</tr>
									</table>
								</div>
								<div class="description">
									<div class="form-group">
										<div style="display:flex">
											<input type="number" name="howmuch" id="howmuch" 
											class="form-control howmuch"
											placeholder="하루 당 원하는 가격 입력">
											<span class="col-md-2 japanesemoney">円</span>
										</div>
										<label for="name">프로필 사진 선택<span class="require">*</span></label>
										<input style="display: block;" type="file" id="uploadFile" name="uploadFile">
									</div>
								</div>
							</div>
							<div class="product-page-content">
								<ul id="myTab" class="nav nav-tabs">
									<li class=""><a href="#Reviews" data-toggle="tab">자기 소개</a></li>
								</ul>
								<div id="myTabContent" class="tab-content">
									<div class="formgroup">
										<label for="review">자기소개글 작성<span class="require">*</span></label>
										<textarea name="content" id="contnet" class="summernote"></textarea>
									</div>

									<div class="padding-top-20">
										<button type="submit" class="btn btn-primary">저장</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END SIDEBAR & CONTENT -->


	<!-- END SIMILAR PRODUCTS -->
</div>

<script src="/resources/custom/js/tmypage.js" type="text/javascript"></script>
<script>

$(function(){
	var dodate = ${json};
	var day = $("input[name=date]");
	for (var i=0; i<dodate.length;i++){
		for (var j=0; j<day.length;j++){
			if(dodate[i]==day[j].value){
				day[j].checked=true;
			}
		}
	}
})
$(function(){
	var age ="${tvo.age}";
	var today = new Date(); 
	var today_year= today.getFullYear();
	var year = today_year-age;
	$("#select_year").val(year);
	var howmuch = "${tvo.howmuch}";
	$("#howmuch").val(howmuch);
})
$(function(){
	$("#contnet").val('${tvo.content}');
		$('#contnet').summernote({
		height: 300,
		fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
		fontNamesIgnoreCheck : [ '맑은고딕' ],
		focus: false,
		callbacks: {
			onImageUpload: function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i], this);
				}
			}
		}
	});
})

</script>
<%@ include file="../../footer.jsp"%>