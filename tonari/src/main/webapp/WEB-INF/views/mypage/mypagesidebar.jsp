<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="sidebar col-md-3 col-sm-5">
	<ul class="list-group margin-bottom-25 sidebar-menu">
		<li class="list-group-item clearfix">
			<h4>マイページ</h4>
		</li>
		<li class="list-group-item clearfix">
			<i class="fa fa-angle-right"></i><a href="studentInfoModify">個人情報修正</a>
		</li>
		<li class="list-group-item clearfix">
			<i class="fa fa-angle-right"></i><a href="teacherlike.jsp">お気に入りの先生閲覧</a>
		</li>
		<li class="list-group-item clearfix">
			<i class="fa fa-angle-right"></i><a href="teacherlist.jsp">自分の先生閲覧【お払い済みの人のみ】</a>
		</li>
		<li class="list-group-item clearfix">
			<i class="fa fa-angle-right"></i><a href="/mypage/teacherJoin">先生に登録</a>
		</li>
		<li class="list-group-item clearfix">
			<i class="fa fa-angle-right"></i><a href="subscription.jsp">(先生登録以降確認し、すぐにつながる）購読の画面</a>
		</li>
		<c:if test ="${1==1}"> <!-- 선생님일때 확인 -->  
			<li class="list-group-item clearfix">
				<h4>先生メニュー</h4>
			</li>
			<li class="list-group-item clearfix">
				<i class="fa fa-angle-right"></i><a href="/mypage/teacherModify">先生情報修正</a>
			</li>
			<li class="list-group-item clearfix">
				<i class="fa fa-angle-right"></i><a href="studentList.jsp">私の学生</a>
			</li>
			<li class="list-group-item clearfix">
				<i class="fa fa-angle-right"></i><a href="subResult.jsp">購読結果画面</a>
			</li>
		</c:if>
	</ul>
</div>