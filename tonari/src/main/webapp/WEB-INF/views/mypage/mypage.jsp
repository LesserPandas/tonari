<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="main">
	<div class="container" style="padding-bottom: 50px;">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li><a href="">Store</a></li>
			<li class="active">My Account Page</li>
		</ul>
		<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
			<!-- BEGIN SIDEBAR -->

			<!-- END SIDEBAR -->

			<!-- BEGIN CONTENT -->
			<div  style="padding-top: 30px;">
			<div class="col-md-6 col-sm-6">
				<h1 style="padding-bottom: 20px;">学生メニュー</h1>
				<div class="content-page" style="font-size: 20px;">
					<h3 style="margin-bottom: 10px;"></h3>
					<ul>
						<li style="padding-bottom: 15px;"><a
							href="/mypage/studentinfo">個人情報修正</a></li>
						<li style="padding-bottom: 15px;"><a href="/mypage/like">お気に入りの先生閲覧</a></li>
						<li style="padding-bottom: 15px;"><a
							href="/mypage/payteacherList">自分の先生閲覧</a></li>
						<li style="padding-bottom: 15px;"><a
							href="/mypage/subscription">先生に登録</a></li>
					</ul>
					<!-- <hr> -->
				</div>
			</div>
			<div class="col-md-6 col-sm-6">
			<h1 style="padding-bottom: 20px;">先生メニュー</h1>
				<div class="content-page" style="font-size: 20px;">
					<h3 style="margin-bottom: 10px;"></h3>
					<ul>

						<li style="padding-bottom: 15px;"><a
							href="/mypage/teacherUpdate">先生情報修正</a></li>
						<li style="padding-bottom: 15px;"><a
							href="/mypage/studentList">私の学生</a></li>
						<li style="padding-bottom: 15px;"><a
							href="/mypage/subResult">購読結果画面</a></li>


					</ul>
				</div>
			</div>
			</div>
			<!-- END CONTENT -->
		</div>
		<!-- END SIDEBAR & CONTENT -->
	</div>
</div>

</body>
<!-- END BODY -->
</html>

<%@ include file="../footer.jsp"%>