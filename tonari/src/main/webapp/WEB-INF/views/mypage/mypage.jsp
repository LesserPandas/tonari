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
				<h1 style="padding-bottom: 20px;">학생 메뉴</h1>
				<div class="content-page" style="font-size: 20px;">
					<h3 style="margin-bottom: 10px;"></h3>
					<ul>
						<li style="padding-bottom: 15px;"><a
							href="/mypage/studentinfo">개인정보 수정</a></li>
						<li style="padding-bottom: 15px;"><a href="/mypage/like">좋아요
								한 선생님 보기</a></li>
						<li style="padding-bottom: 15px;"><a
							href="/mypage/payteacherList">나의 선생님 보기</a></li>
						<li style="padding-bottom: 15px;"><a
							href="/mypage/subscription">선생님으로 등록</a></li>
					</ul>
					<!-- <hr> -->
				</div>
			</div>
			<div class="col-md-6 col-sm-6">
			<h1 style="padding-bottom: 20px;">선생님 메뉴</h1>
				<div class="content-page" style="font-size: 20px;">
					<h3 style="margin-bottom: 10px;"></h3>
					<ul>

						<li style="padding-bottom: 15px;"><a
							href="/mypage/teacherUpdate">선생 정보 수정</a></li>
						<li style="padding-bottom: 15px;"><a
							href="/mypage/studentList">나의 학생</a></li>
						<li style="padding-bottom: 15px;"><a
							href="/mypage/subResult">구독결과 화면</a></li>


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