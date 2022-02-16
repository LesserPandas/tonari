<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/custom/css/board.css">

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li class="active">선생님 찾기</li>
		</ul>
		<!-- BEGIN SIDEBAR & CONTENT -->

		<div class="row margin-bottom-40">
			<!-- BEGIN SIDEBAR -->
			<%@ include file="side_board.jsp"%>
			<!-- END SIDEBAR -->
			<!-- BEGIN CONTENT -->
			<div class="col-md-9 col-sm-7">
				<div class="content-search margin-bottom-20">
					<div class="row">
						<div class="col-md-6">
							<h1>
								<em>개꿀 선생님</em>을 찾아보자!
							</h1>
						</div>
						<div class="col-md-6">
							<form action="#">
								<div class="input-group">
									<input type="text" placeholder="개꿀 선생님을 검색해보자" class="form-control" name="searchText"> 
									<span class="input-group-btn">
										<button class="btn btn-primary" type="submit">Search</button>
									</span>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="row list-view-sorting clearfix">
					<div class="col-md-2 col-sm-2 list-view">
						<a href="javascript:;"><i class="fa fa-th-large"></i></a> 
						<a href="javascript:;"><i class="fa fa-th-list"></i></a>
					</div>
					<div class="col-md-10 col-sm-10">
						<div class="pull-right">
							<label class="control-label">정렬</label>
							<select class="form-control input-sm" onchange="if(this.value) location.href=(this.value);">
								<c:choose>
									<c:when test="${orderby=='teacher'}">
										<option value="/board/search?orderby=teacher" selected="selected">신규</option>
										<option value="/board/search?orderby=a">가까운 지역</option>
										<option value="/board/search?orderby=score">별점</option>
									</c:when>
									<c:when test="${orderby=='score' }">
										<option value="/board/search?orderby=teacher">신규</option>
										<!-- member의 위치 받아올것 -->
										<option value="/board/search?orderby=a">가까운 지역</option>
										<option value="/board/search?orderby=score" selected="selected">별점</option>
									</c:when>
									<c:otherwise>
										<option value="/board/search?orderby=teacher">신규</option>
										<option value="/board/search?orderby=a" selected="selected">가까운 지역</option>
										<option value="/board/search?orderby=score">별점</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
					</div>
				</div>
				<!-- BEGIN PRODUCT LIST -->
				<div class="row product-list">
					<!-- PRODUCT ITEM START -->
					<c:forEach items="${list}" var="list">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="product-item">
								<div style="text-align: right;">
									<span>별점 :&nbsp;${list.score}</span>
								</div>
								<div class="pi-img-wrapper">
									<img src="/resources/assets/pages/img/products/model1.jpg"
										class="img-responsive" alt="">
									<div>
										<a href="#" class=" btn-default fancybox-button" 
										style="border: none; text-align: center; padding: 0; margin: 0;">
											<!-- "<br>내용<br>" -->
										</a>
									</div>
								</div>
								<div class="teacherInfo">
									<div style="display: inline"> ${list.category}</div>
									<div class="pull-right">${list.gu}구&nbsp;${list.dong}동</div>
								</div>
								<div class="teacherInfo">
									<h3 style="display: inline">
										<a href="info" style="font-weight: bold; font-size: 18px;">${list.title }</a>
									</h3>
									<c:choose>
										<c:when test="">
											<button class="pull-right squareButton likeButton likeButtonActive" id="like" onclick="like()">♥</button>
										</c:when>
										<c:otherwise>
											<button class="pull-right squareButton likeButton" id="like" onclick="like()">♥</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- PRODUCT ITEM END -->
				</div>
				<!-- END PRODUCT LIST -->
				<!-- BEGIN PAGINATOR -->
				<div class="row">
					<div class="col-md-12 col-sm-12" style="text-align: center">
						<ul class="pagination">
							<li><a href="javascript:;">&laquo;</a></li>
							<li><a href="javascript:;">1</a></li>
							<li><span>2</span></li>
							<li><a href="javascript:;">3</a></li>
							<li><a href="javascript:;">4</a></li>
							<li><a href="javascript:;">5</a></li>
							<li><a href="javascript:;">&raquo;</a></li>
						</ul>
					</div>
				</div>
				<!-- END PAGINATOR -->
			</div>
			<!-- END CONTENT -->
		</div>
		<!-- END SIDEBAR & CONTENT -->
	</div>
</div>
<script src="/resources/custom/js/board.js" type="text/javascript"></script>
<%@ include file="../footer.jsp"%>