<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
</style>
<%@ include file="../../header.jsp"%>

<div class="main">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li><a href="">Store</a></li>
			<li class="active">My Wish List</li>
		</ul>
		<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
			<!-- BEGIN SIDEBAR -->
			<%@ include file="../mypagesidebar.jsp"%>
			<!-- END SIDEBAR -->

			<!-- BEGIN CONTENT -->
			<div class="col-md-9 col-sm-7">
				<h1>自分の学生リスト</h1>
				<div class="goods-page">
					<div class="goods-data clearfix">
						<div class="table-wrapper-responsive">
							<table summary="Shopping cart">
								<tr>

									<th class="goods-page-image">名前</th>
									<th class="goods-page-description">説明</th>
									<th class="goods-page-stock">授業スタート</th>
									<th class="goods-page-price" colspan="2">授業期限（週）</th>

								</tr>
								<c:forEach items="${last}" var="last">
								<tr>

									<td class="goods-page-stock">${last.name}</td>
									<td class="goods-page-description">
										<h3>
											<a href="javascript:;">${last.nick}</a>
										</h3>

									</td>
									<td class="goods-page-stock">${last.write_date}</td>
									<td class="goods-page-price"><strong>${last.submonth}</strong></td>

									<td class="del-goods-col"><a class="del-good"
										href="javascript:;">&nbsp;</a></td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- END CONTENT -->
		</div>
		<!-- END SIDEBAR & CONTENT -->
	</div>
</div>
<!-- END STEPS -->

<%@ include file="../../footer.jsp"%>