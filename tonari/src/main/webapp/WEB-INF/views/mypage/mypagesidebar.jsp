<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="sidebar col-md-3 col-sm-5">
	<ul class="list-group margin-bottom-25 sidebar-menu">
		<li class="list-group-item clearfix">
			<h4>MyPage</h4>
		</li>
		<li class="list-group-item clearfix">
			<i class="fa fa-angle-right"></i><a href="studentInfoModify">개인정보 수정</a>
		</li>
		<li class="list-group-item clearfix">
			<i class="fa fa-angle-right"></i><a href="teacherlike.jsp">좋아요 한 선생님 보기</a>
		</li>
		<li class="list-group-item clearfix">
			<i class="fa fa-angle-right"></i><a href="teacherlist.jsp">나의 선생님 보기(결제된 사람만)</a>
		</li>
		<li class="list-group-item clearfix">
			<i class="fa fa-angle-right"></i><a href="teacherJoin.jsp">선생님으로 등록</a>
		</li>
		<li class="list-group-item clearfix">
			<i class="fa fa-angle-right"></i><a href="subscription.jsp">(선생님으로 등록 이후 확인 시 바로 연결)구독하는 화면</a>
		</li>
		<c:if test ="${1==1}"> <!-- 선생님일때 확인 -->  
			<li class="list-group-item clearfix">
				<h4>Teacher Menu</h4>
			</li>
			<li class="list-group-item clearfix">
				<i class="fa fa-angle-right"></i><a href="/mypage/teacherModify">선생 정보 수정</a>
			</li>
			<li class="list-group-item clearfix">
				<i class="fa fa-angle-right"></i><a href="studentList.jsp">나의 학생</a>
			</li>
			<li class="list-group-item clearfix">
				<i class="fa fa-angle-right"></i><a href="subResult.jsp">구독결과 화면</a>
			</li>
		</c:if>
	</ul>
</div>