<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<link href="/resources/custom/css/tmypage.css" rel="stylesheet">

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="/">Home</a></li>
			<li><a href="/mypage">マイページ</a></li>
			<li class="active">先生登録</li>
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
									id="preview-image">
							</div>
						</div>
						<form name="teacherinfo" action="/mypage/teacherJoin" 
							method="post" enctype="multipart/form-data" onsubmit = "return chkjoin()">
						<input type="hidden" name="dodate" id="dodate">
						<input type="hidden" name="member_bno" value="${info.bno }">
						<input type="hidden" name="age" id="age">
							<div class="col-md-6 col-sm-6">
								<input class="form-control" type="text" id="title" name="title" placeholder="紹介タイトル">
								<div class="price-availability-block clearfix">
									<div class="price">
										<strong>${nowUser.nick }</strong>
										<input type="hidden" name="nick" value="${nowUser.nick }">
									</div>
								</div>
								<div class="description">
									<div class="form-group">
										<label for="name">先生の一言<span class="require">*</span></label>
										<input type="text" class="form-control" id="coment" name="coment"
											placeholder="20字以内で書いてください。">
									</div>
								</div>
								<div class="product-page-options">
									<div class="pull-left">
										<label class="control-label">科目 :</label> 
										<select class="form-control input-sm" name="category" id="category">
												<option value="1">日本語</option>
												<option value="2">JAVA</option>
												<option value="3">PYTHON</option>
												<option value="4">JAVASCRIPT</option>
												<option value="5">SPRING</option>
												<option value="6">HTML5+CSS3</option>
												<option value="7">DATABASE</option>
											</select>
									</div>
									<div class="pull-left">
										<label class="control-label">地域 :</label>
										<strong style="">${info.gu }&nbsp;${info.dong }</strong>
									</div>
									<div class= "col-md-12" style="margin-top: 3px;">
										<div class="row">
										<label class="control-label">生年月日 :</label>
											<select id="select_year" class="form-control input-sm" onchange="javascript:lastday();"> 
												<option>年</option> 
											</select>
											<select id="select_month" class="form-control input-sm" onchange="javascript:lastday();"> 
												<option>月</option> 
											</select>
											<select id="select_day" class="form-control input-sm"> 
												<option>日</option> 
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<p>受講可能な日にちを選んでください。</p>
									<table class="teacherdate">
										<tr>
											<th>日</th>
											<th>月</th>
											<th>火</th>
											<th>水</th>
											<th>木</th>
											<th>金</th>
											<th>土</th>
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
											<input type="number" name="tmoney" id="howmuch" 
											class="form-control howmuch" placeholder="希望講義料金入力（一日）">
											<span class="col-md-2 japanesemoney">円</span>
										</div>
										<label for="uploadFile">プロフィール写真選択<span class="require">*</span></label>
										<input style="display: block;" type="file" id="uploadFile" name="uploadFile">
									</div>
								</div>
							</div>
							<div class="product-page-content">
								<ul id="myTab" class="nav nav-tabs">
									<li class=""><a href="#Reviews" data-toggle="tab">自己紹介</a></li>
								</ul>
								<div id="myTabContent" class="tab-content">
									<div class="formgroup">
										<label for="review">自己紹介作成<span class="require">*</span></label>
										<textarea name="content" id="content" class="summernote"></textarea>
									</div>

									<div class="padding-top-20">
										<button type="submit" class="btn btn-primary">セーブ</button>
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
function image(){
	var uploadFile = document.getElementById("uploadFile").value;
	if(uploadFile == null){
		alert("写真を登録してください。");
		return false;
	}
}
</script>
<%@ include file="../../footer.jsp"%>