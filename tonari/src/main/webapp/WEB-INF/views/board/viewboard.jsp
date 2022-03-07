<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/resources/custom/css/board.css">

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="/">Home</a></li>
			<c:choose>
				<c:when test="${bvo.category==1 }">
					<li><a href="listboard?category=1">お知らせ</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="listboard?category=2">イベント</a></li>
				</c:otherwise>
			</c:choose>
			<li class="active">${bvo.title }
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
					<table style="width:100%;">
						<colgroup>
							<col style="width:70%;">
							<col style="width:30%;">
						</colgroup>
						<tr>
							<th>
								<div style="min-height: 50px;">
									<p style="font-size: 20px">${bvo.title }</p>
								</div>
							</th>
							<c:choose>
								<c:when test="${bvo.upDate_date==null }">
									<td><div style="min-height: 50px;">${bvo.write_date }</div></td>
								</c:when>
								<c:otherwise>
									<td><div style="min-height: 50px;">${bvo.upDate_date }</div></td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td colspan="2" style="border-top: 1px solid #ccc;">
								<div style="min-height: 300px; text-align: left; padding-top: 15px;">${bvo.content }</div>
							</td>
						</tr>
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