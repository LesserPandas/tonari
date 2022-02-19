<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>
    
    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">My Account Page</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
         <%@ include file ="../side.jsp" %>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <h1>My page</h1>
            <div class="content-page">
              <h3></h3>
              <ul>
                <li><a href="studentInfoModify">개인정보 수정</a></li>
                <li><a href="teacherlike.jsp">좋아요 한 선생님 보기</a></li>
                <li><a href="teacherlist.jsp">나의 선생님 보기(결제된 사람만)</a></li>
                <li><a href="teacherJoin.jsp">선생님으로 등록</a></li>
                <li><a href="subscription.jsp">(선생님으로 등록 이후 확인 시 바로 연결)구독하는 화면</a></li>
              </ul>
              <hr>

              <h3>선생님 메뉴</h3>
              <ul>
              	
              	<li><a href="teacherModfiy.jsp">선생 정보 수정</a></li>
                <li><a href="studentList.jsp">나의 학생</a></li>
                <li><a href="subResult.jsp">구독결과 화면</a></li>
                
                
              </ul>
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

<%@ include file="../footer.jsp" %>