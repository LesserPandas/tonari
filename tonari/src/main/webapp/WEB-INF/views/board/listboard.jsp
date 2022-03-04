<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="/resources/custom/css/board.css">

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="/">Home</a></li>
			<c:choose>
				<c:when test="${category==1 }">
					<li class="active"><a href="listboard?category=1">お知らせ</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="listboard?category=2">イベント</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<!-- BEGIN SIDEBAR & CONTENT -->

		<div class="row margin-bottom-40">
			<!-- BEGIN SIDEBAR -->
			<div class="sidebar col-md-3 col-sm-5">
				<ul class="list-group margin-bottom-25 sidebar-menu">
					<li class="list-group-item clearfix"><a href="listboard?category=1"><i class="fa fa-angle-right"></i> お知らせ</a></li>
					<li class="list-group-item clearfix"><a href="listboard?category=2"><i class="fa fa-angle-right"></i> イベント</a></li>
					<li class="list-group-item clearfix"><a href="javascript:;"><i class="fa fa-angle-right"></i> QnA</a></li>
				</ul>
			</div>
			<!-- END SIDEBAR -->
			<!-- BEGIN CONTENT -->
			<div class="col-md-9 col-sm-7">
				<div>
					<c:choose>
						<c:when test="${category==1 }">
							<h2 style="text-align: center; padding-bottom: 30px;">お知らせ</h2>
						</c:when>
						<c:when test="${category==2 }">
							<h2 style="text-align: center; padding-bottom: 30px;">イベント</h2>
						</c:when>
					</c:choose>
					
					<table style="width:100%;">
						<colgroup>
							<col style="width:70%;">
							<col style="width:30%;">
						</colgroup>
						<c:forEach var="list" items="${list }">
							<tr>
								<th>
									<div style="min-height: 28px;">
										<a href="viewboard?board_bno=${list.bno}" style="font-size: 15px">${list.title }</a>
									</div>
									<div style="min-height: 10px; border-top: 1px #d5d5d5 solid"></div>
								</th>
								<c:choose>
									<c:when test="${bvo.upDate_date==null }">
										<fmt:parseDate var="date" value="${list.write_date}" pattern="yyyy-mm-dd" /> 
										<td>
											<div style="min-height: 28px;"><fmt:formatDate value="${date}" pattern="yyyy-mm-dd" /></div>
											<div style="min-height: 10px; border-top: 1px #d5d5d5 solid"></div>
										</td>
									</c:when>
									<c:otherwise>
										<fmt:parseDate var="date" value="${list.upDate_date}" pattern="yyyy-mm-dd" /> 
										<td>
											<div style="min-height: 50px;"><fmt:formatDate value="${date}" pattern="yyyy-mm-dd" /></div>
											<div style="min-height: 10px; border-top: 1px #d5d5d5 solid"></div>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- END CONTENT -->
		</div>
		<!-- END SIDEBAR & CONTENT -->
	</div>
</div>
<script src="/resources/custom/js/board.js" type="text/javascript"></script>
<%@ include file="../footer.jsp"%>