<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>
<link rel="stylesheet" href="/resources/custom/css/teacher.css">

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li><a href="">선생님 찾기/</a><a href="">일본어(카테고리)</a></li>
			<li class="active">ㅇㅇㅇ선생님</li>
		</ul>
	<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
			<!-- BEGIN SIDEBAR -->
			 <%@ include file ="side_board.jsp" %>
			<!-- END SIDEBAR -->
		
			<!-- BEGIN CONTENT -->
			<div class="col-md-9 col-sm-7">
				<div class="product-page">
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<div class="product-main-image product-main-image-overflow">
								<img src="/resources/assets/pages/img/products/model1.jpg" alt="Cool green dress with red bell" class="img-responsive">
							</div>
							<div class="product-other-images">
								<a href="/resources/assets/pages/img/products/model2.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="/resources/assets/pages/img/products/model2.jpg"></a>
								<a href="/resources/assets/pages/img/products/model3.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="/resources/assets/pages/img/products/model3.jpg"></a>
								<a href="/resources/assets/pages/img/products/model5.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="/resources/assets/pages/img/products/model5.jpg"></a>
							</div>
						</div>
						<div class="col-md-6 col-sm-6">
							<div class="pull-right starTeacher">
								<span>4.1</span>
							</div>
							<h1>프로필 타이틀</h1>
							<div class="price-availability-block clearfix">
								<div class="price">
									<strong>닉네임</strong>
								</div>
							</div>
							<div class="description">
								<p>간단 소개(한 두줄)</p>
							</div>
							<div class="product-page-options">
								<div class="pull-left">
									<label class="control-label">과목 :</label>
									<strong>소맥말이</strong>
								</div>
								<div class="pull-right">
									<label class="control-label">지역:</label>
									<strong>중구 용두동</strong>
								</div>
							</div>
							<div style="margin-bottom: 30px;">
								<span style="font-size:16px;">가능 한 날짜:</span>
								<strong style="font-size:18px;">월,수</strong>
							</div>
							<div class="pull-right">
								<button class="button largeButton">1:1 채팅</button>
								<button class="pull-right button squareButton likeButton" id="like" onclick="like()">♡</button>
							</div>
							
						</div>
						<div class="product-page-content ">
							<ul class="nav nav-tabs" id="myTab">
								<li class="active"><a href="#TeacherInfo" data-toggle="tab">강사 자기 소개</a></li>
								<li><a href="#Reviews" data-toggle="tab">강사 리뷰 보기</a></li>
								<li><a href="#ReviewWrite" data-toggle="tab">리뷰 쓰기</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade in active" id="TeacherInfo">
									<p>자기 소개 글</p>
								</div>
								<div class="tab-pane fade" id="Reviews">
									<div class="review-item clearfix">
										<div class="review-item-submitted">
											<strong style="display: inline">B** (이름 맨첫자만 보이게 하기)</strong>
											<span class="pull-right" style="display:inline;">★★★★☆</span> 
											<em>30/12/2013</em>
											<div class="rateit" data-rateit-value="5"
												data-rateit-ispreset="true" data-rateit-readonly="true"></div>
										</div>
										<div class="review-item-content">
											<p>Sed velit quam, auctor id semper a, hendrerit eget
												justo. Cum sociis natoque penatibus et magnis dis parturient
												montes, nascetur ridiculus mus. Duis vel arcu pulvinar dolor
												tempus feugiat id in orci. Phasellus sed erat leo. Donec
												luctus, justo eget ultricies tristique, enim mauris bibendum
												orci, a sodales lectus purus ut lorem.</p>
										</div>
									</div>
								</div>
								<div class="tab-pane fade in " id="ReviewWrite">
									<!--<p>There are no reviews for this product.</p>-->


									<!-- BEGIN FORM-->
									<form class="reviews-form" role="form" method="post" action="#" onsubmit="return checkReview()">
										<h2>Write a review</h2>


										<div name="myform" id="myform">
											<fieldset>
												<legend> 별점</legend>
												<input type="radio" name="rating" value="5" id="rate1">
												<label for="rate1">⭐</label> 
												<input type="radio" name="rating" value="4" id="rate2">
												<label for="rate2">⭐</label> 
												<input type="radio" name="rating" value="3" id="rate3">
												<label for="rate3">⭐</label> 
												<input type="radio" name="rating" value="2" id="rate4">
												<label for="rate4">⭐</label> 
												<input type="radio" name="rating" value="1" id="rate5">
												<label for="rate5">⭐</label>
											</fieldset>
										</div>
										<div class="form-group" style="width: 300px;">
											<label for="country">제목 <span class="require">*</span></label>
											<select class="form-control input-sm" id="country">
												<option value="">구분</option>
												<option value="2">훌륭해요</option>
												<option value="1">최고에요</option>
												<option value="1">좋아요</option>
												<option value="1">보통이에요</option>

											</select>
										</div>
										<div class="form-group">
											<label for="review">Review <span class="require">*</span></label>
											<textarea class="form-control" rows="8" id="review"></textarea>
										</div>
										<div class="padding-top-20 pull-right">
											<button type="submit" class="btn btn-primary">리뷰쓰기</button>
										</div>
									</form>
									<!-- END FORM-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- END CONTENT -->
		</div>
	<!-- END SIDEBAR & CONTENT -->
	</div>
</div>
<script src="/resources/custom/js/board.js" type="text/javascript"></script>
<%@ include file ="../footer.jsp" %>