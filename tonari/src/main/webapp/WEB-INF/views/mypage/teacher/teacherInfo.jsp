<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<link rel="stylesheet" href="css/teacher.css">

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li><a href="">Store</a></li>
			<li class="active">ㅇㅇㅇ선생님</li>
		</ul>
		<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
			<!-- BEGIN SIDEBAR -->
			<%@ include file="../../side.jsp"%>

			<!-- END SIDEBAR -->

			<!-- BEGIN CONTENT -->
			<div class="col-md-9 col-sm-7">
				<div class="product-page">
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<div class="product-main-image">
								<img src="assets/pages/img/products/model7.jpg"
									alt="Cool green dress with red bell" class="img-responsive"
									data-BigImgsrc="assets/pages/img/products/model7.jpg">
							</div>
							<div class="product-other-images">
								<a href="assets/pages/img/products/model3.jpg"
									class="fancybox-button" rel="photos-lib"><img
									alt="Berry Lace Dress"
									src="assets/pages/img/products/model3.jpg"></a> <a
									href="assets/pages/img/products/model4.jpg"
									class="fancybox-button" rel="photos-lib"><img
									alt="Berry Lace Dress"
									src="assets/pages/img/products/model4.jpg"></a> <a
									href="assets/pages/img/products/model5.jpg"
									class="fancybox-button" rel="photos-lib"><img
									alt="Berry Lace Dress"
									src="assets/pages/img/products/model5.jpg"></a>
							</div>
						</div>


						<div class="col-md-6 col-sm-6">
							<div class="pull-right"
								style="color: #3e4d5c; direction: ltr; font: 400 21px 'Open Sans', Arial, sans-serif;"></div>
							<h1>선생님 프로필</h1>
							<div class="price-availability-block clearfix">
								<div class="price">
									<strong>닉네임</strong>
								</div>
							</div>
							<div class="description">
								<div class="form-group">
									<label for="name">선생님의 한마디 <span class="require">*</span></label>
									<ul style="list-style: none; padding-left: 0px;">
										<li style="padding-top: 10px; font-size: 24px;">열다섯글자안으로만소개가능!</li>
									</ul>
								</div>
							</div>
							<div class="product-page-options">
								<div class="pull-left">
									<label class="control-label">과목 :</label> <strong style="">헬스PT</strong>
								</div>

								<div class="pull-left">
									<label class="control-label">지역 :</label> <strong style="">00동</strong>
								</div>

							</div>


							<div class="form-group">
								<p>수업이 가능한 날짜</p>
								<table class="teacherdate">
									<tr style="text-align: left;">
										<th>일</th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>

										<th>토</th>
									</tr>
									<tr>
										<td><input type="checkbox" name="checker" id="checker1"><label
											for="checker1"></label></td>
										<td><input type="checkbox" name="checker" id="checker2"><label
											for="checker2"></label></td>

										<td><input type="checkbox" name="checker" id="checker1"><label
											for="checker3"></label></td>
										<td><input type="checkbox" name="checker" id="checker2"><label
											for="checker4"></label></td>

										<td><input type="checkbox" name="checker" id="checker1"><label
											for="checker5"></label></td>
										<td><input type="checkbox" name="checker" id="checker2"><label
											for="checker6"></label></td>
										<td><input type="checkbox" name="checker" id="checker2"><label
											for="checker7"></label></td>


									</tr>
								</table>

							</div>
						</div>

						<div class="product-page-content ">
							<ul class="nav nav-tabs" id="myTab">
								<li class="active"><a href="#Description" data-toggle="tab">강사
										자기 소개</a></li>
								<li><a href="#Information" data-toggle="tab">강사 리뷰 보기</a></li>
								<li><a href="#Reviews" data-toggle="tab">리뷰 쓰기</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade in active" id="Description">
									<p>자기 소개 글</p>
								</div>
								<div class="tab-pane fade" id="Information">
									<table class="datasheet">
										<tr>
											<th colspan="2">강사 프로필</th>
										</tr>

										<tr>
											<td class="datasheet-features-type">별점</td>
											<td>★★★★ (부트스트랩이 왜인지 안됩니다.. i태그로 변경하고 싶은데...) <i
												class="bi bi-star-fill"></i>
											</td>
										</tr>
										<tr>
											<td class="datasheet-features-type">좋아요</td>
											<td>155</td>
										</tr>
									</table>
									<div class="review-item clearfix">
										<div class="review-item-submitted">
											<strong>Bob</strong><span>좋아요</span> <em>30/12/2013 -
												07:37</em>
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
								<div class="tab-pane fade in " id="Reviews">
									<!--<p>There are no reviews for this product.</p>-->


									<!-- BEGIN FORM-->
									<form class="reviews-form" role="form">
										<h2>Write a review</h2>
										

										<div name="myform" id="myform" method="post" action="./save">
											<fieldset>
												<legend> 별점</legend>

												<input type="radio" name="rating" value="5" id="rate1"><label
													for="rate1">⭐</label> <input type="radio" name="rating"
													value="4" id="rate2"><label for="rate2">⭐</label> <input
													type="radio" name="rating" value="3" id="rate3"><label
													for="rate3">⭐</label> <input type="radio" name="rating"
													value="2" id="rate4"><label for="rate4">⭐</label> <input
													type="radio" name="rating" value="1" id="rate5"><label
													for="rate5">⭐</label>
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
										<!-- <div class="form-group">
											<label for="email">Rating</label>
											<input type="range"	value="4" step="0.25" id="backing5">
											<div class="rateit" data-rateit-backingfld="#backing5"
												data-rateit-resetable="false" data-rateit-ispreset="true"
												data-rateit-min="0" data-rateit-max="5"></div>
											
										</div> -->
										<div class="padding-top-20">
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

		<!-- BEGIN SIMILAR PRODUCTS -->

	</div>
</div>
</div>
<%@ include file="../../footer.jsp"%>