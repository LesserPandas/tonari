<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>
<link rel="stylesheet" href="/resources/custom/css/board.css">


<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li>
				<a href="/board/search?orderby=teacher">先生サーチ</a>
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
							<li class="list-group-item clearfix"><a
								href="/board/search?type=category&&keyword=${sidelist.category_bno}">
									<i class="fa fa-angle-right"></i>${sidelist.category_name }
							</a></li>
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
								<img src="${teacher.image }" alt="Cool green dress with red bell" class="img-responsive">
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
									<label class="control-label">科目 :</label>
									<strong>${teacher.category_name }</strong>
								</div>
								<div class="pull-right">
									<label class="control-label">地域:</label>
									<strong>${teacher.gu }&nbsp;${teacher.dong }</strong>
								</div>
							</div>
							<div style="margin-bottom: 30px;">
								<span style="font-size:16px;">出来る曜日:</span>
								<strong style="font-size:18px;">${teacher.date }</strong>
							</div>
							<div class="pull-right">
								<button class="button largeButton">1:1 チャット</button>
								<c:choose>
									<c:when test="${like.teacher_bno==teacher.teacher_bno }">
										<button class="pull-right squareButton likeButton likeButtonActive" 
											id="teacher_${teacher.teacher_bno}" onclick="like(${teacher.teacher_bno},${nowUser.bno })">♥
										</button>
									</c:when>
									<c:otherwise>
										<button class="pull-right squareButton likeButton " 
											id="teacher_${teacher.teacher_bno}" onclick="like(${teacher.teacher_bno},${nowUser.bno })">♥
										</button>
									</c:otherwise>
								</c:choose>
							</div>
							
						</div>
						<div class="product-page-content ">
							<ul class="nav nav-tabs" id="myTab">
								<li class="active"><a href="#TeacherInfo" data-toggle="tab">先生のPR</a></li>
								<li><a href="#Reviews" data-toggle="tab">レビュー</a></li>
								<c:if test="${not empty nowUser }">
									<li><a href="#ReviewWrite" data-toggle="tab">レビューを残す</a></li>
								</c:if>
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
												<span class="pull-right" style="display:inline;" id="${review.nick}">
													<img src = "/resources/custom/images/starTeacher.png" 
													style="width: 17px; height: 17px;">
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
										<input type="hidden" name="member_bno" value="${nowUser.bno }">
										<input type="hidden" name="nowUser.nick" value="${nowUser.nick }">
										
										<h2>レビューを残す</h2>
										<div name="myform" id="myform">
											<fieldset>
												<legend> 点数</legend>
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
											<label for="country">簡単コメント <span class="require">*</span></label>
											<select class="form-control input-sm" id="nocoment" name="nocoment">
												<option value="">選択</option>
												<option value="うまく教えて下さいます">うまく教えて下さいます</option>
												<option value="親切にしてもらいました">親切にしてもらいました</option>
												<option value="最高です">最高です</option>
												<option value="普通です">普通です</option>

											</select>
										</div>
										<div class="form-group">
											<label for="review">コメント <span class="require"></span></label>
											<textarea class="form-control" rows="8" id="content" name="content"></textarea>
										</div>
										<div class="padding-top-20 pull-right">
											<button type="submit" class="btn btn-primary">レビュー</button>
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
<script>
$(document).ready(function(){
	var stars = "${review}";
	console.log(stars[0].score);
})
</script>
<script src="/resources/custom/js/board.js" type="text/javascript"></script>
<%@ include file ="../footer.jsp" %>