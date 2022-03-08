<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

			<!-- END SIDEBAR -->

			<!-- BEGIN CONTENT -->
			<div class="col-md-12 col-sm-12">
				<h1>自分のの先生リスト</h1>
				<div class="goods-page">
					<div class="goods-data clearfix">
						<div class="table-wrapper-responsive">
							<table summary="Shopping cart">
								<tr>
									<th class="goods-page-image">写真</th>
									<th class="goods-page-description">説明</th>
									<th class="goods-page-stock">科目</th>
									<th class="goods-page-price">金額</th>
									<th class="goods-page-yo">授業曜日</th>
									<th class="goods-page-ju">授業日(週)</th>
									<th class="goods-page-pay">支払い日にち</th>
								</tr>
								<c:forEach items="${last }" var="last">
									<tr>
										<td class="goods-page-image"><a href="javascript:;"><img
												src="${last.image}"
												alt="Berry Lace Dress"></a></td>
										<td class="goods-page-description">
											<h3>
												<a href="javascript:;">${last.nick }</a>
											</h3>
											<p>
												${last.coment }
											</p> <em><a href="/board/info?teacher_bno=${last.teacher_bno }">先生履歴</a></em>
										</td>
										<td class="goods-page-stock">${last.category_name }</td>
										<td class="goods-page-price"><strong>${last.pay}円</strong></td>
										<td class="goods-page-yo"><strong>${last.date}</strong></td>
										<td class="goods-page-pay"><strong>${last.submonth}</strong></td>
										<td class="goods-page-pay"><strong>${last.write_date2}</strong></td>
										
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