<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/custom/css/board.css">


<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li>
				<a href="/board/search?orderby=teacher">선생님 찾기/</a>
				<a href="/board/category?category=${teacher.category_bno}">${teacher.category_name }</a>
			</li>
			<li class="active">${teacher.nick }</li>
		</ul>
	<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
			<!-- BEGIN SIDEBAR -->
			<div class="sidebar col-md-3 col-sm-5">
				<div class="sidebar-filter margin-bottom-25">
					<ul class="list-group margin-bottom-25 sidebar-menu">
						<c:forEach items="${sidelist }" var="sidelist">
							<li class="list-group-item clearfix">
								<a href="/board/category?category=${sidelist.category_bno }"> 
									<i class="fa fa-angle-right"></i>${sidelist.category_name }
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
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
								<span>${teacher.score }</span>
							</div>
							<h1>${teacher.title }</h1>
							<div class="price-availability-block clearfix">
								<div class="price">
									<strong>${teacher.nick }</strong>
								</div>
							</div>
							<div class="description">
								<p>${teacher.coment }</p>
							</div>
							<div class="product-page-options">
								<div class="pull-left">
									<label class="control-label">과목 :</label>
									<strong>${teacher.category_name }</strong>
								</div>
								<div class="pull-right">
									<label class="control-label">지역:</label>
									<strong>${teacher.gu }구&nbsp;${teacher.dong }동</strong>
								</div>
							</div>
							<div style="margin-bottom: 30px;">
								<span style="font-size:16px;">가능 한 날짜:</span>
								<strong style="font-size:18px;">월,수</strong>
							</div>
							<div class="pull-right">
								<button class="button largeButton">1:1 채팅</button>
								<button class="pull-right squareButton likeButton" id="like" onclick="like()">♥</button>
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
									<p>${teacher.content}</p>
								</div>
								<div class="tab-pane fade" id="Reviews">
									<c:forEach items="${review }" var="review">
										<div class="review-item clearfix">
											<div class="review-item-submitted">
												<strong style="display: inline">${review.nick }</strong>
												<span class="pull-right" style="display:inline;">
													${review.scorestar }
												</span> 
												<div class="rateit" data-rateit-value="5"
													data-rateit-ispreset="true" data-rateit-readonly="true"></div>
											</div>
											<div class="review-item-content">
												<p>${review.content }</p>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="tab-pane fade in " id="ReviewWrite">
									<!--<p>There are no reviews for this product.</p>-->


									<!-- BEGIN FORM-->
									<form class="reviews-form" action="/board/writeReview" method="post" onsubmit="return writeReview()">
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
										<input type="hidden" name="teacher_bno" value="${teacher.teacher_bno }">
										<input type="hidden" name="member_bno" value="5">
<<<<<<< HEAD
=======
										<input type="hidden" name="bno" value="36">
>>>>>>> namhyun
										<input type="hidden" name="nick" value="임시연습용">
										
										<h2>Write a review</h2>
										<div name="myform" id="myform">
											<fieldset>
												<legend> 별점</legend>
												<input type="radio" name="score" value="5" id="rate1">
												<label for="rate1">⭐</label> 
												<input type="radio" name="score" value="4" id="rate2">
												<label for="rate2">⭐</label> 
												<input type="radio" name="score" value="3" id="rate3">
												<label for="rate3">⭐</label> 
												<input type="radio" name="score" value="2" id="rate4">
												<label for="rate4">⭐</label> 
												<input type="radio" name="score" value="1" id="rate5">
												<label for="rate5">⭐</label>
											</fieldset>
										</div>
										<div class="form-group" style="width: 300px;">
											<label for="country">빠른 댓글 <span class="require">*</span></label>
											<select class="form-control input-sm" id="nocoment" name="nocoment">
												<option value="">선택</option>
												<option value="훌륭해요">훌륭해요</option>
												<option value="최고예요">최고에요</option>
												<option value="좋아요">좋아요</option>
												<option value="보통이예요">보통이에요</option>

											</select>
										</div>
										<div class="form-group">
											<label for="review">댓글 <span class="require"></span></label>
											<textarea class="form-control" rows="8" id="content" name="content"></textarea>
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