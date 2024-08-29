<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의 상세보기</title>
<!-- 기존 CSS 및 JS 라이브러리 링크들은 그대로 유지 -->
<style type="text/css">
.btn-info {
    color: #fff;
    background-color: #ffa657;
    border-color: #ffa657;
}
.bg-light {
    margin-top: 150px;
}
.container {
    background-color: white;
    border-radius: 10px;
}
body {
    background-color: white;
}
.text-primary {
    background: linear-gradient(
        113.07441835248278deg,
        rgba(255, 156, 156, 1) 7.897508384699059%,
        rgba(255, 156, 156, 1) 11.040067389186005%,
        rgba(255, 147, 5, 1) 89.43417444706309%
    );
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    color: transparent;
}
</style>
</head>
<body>
<div class="container">
    <div class="col-12">
        <div class="bg-light rounded h-100 p-4">
            <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>문의 상세보기</h3>
            
            <table class="table">
						  <tr>
						    <th width="10%">번호</th>
						    <td width="15%">${vo.no}</td>
						    <th width="10%">작성일</th>
						    <td width="20%">${vo.dbday}</td>
						    <th width="10%">답변 상태</th>
						    <td width="30%">
						      <c:if test="${vo.isreply == 0}">
						        <span style="color: red">답변대기</span>
						      </c:if>
						      <c:if test="${vo.isreply != 0}">
						        <span style="color: #FF8F0B;">답변완료</span>
						      </c:if>
						    </td>
						  </tr>
						  
						  <tr>
						    <th width="10%">제목</th>
						    <td colspan="5">${vo.subject}</td>
						  </tr>
						  <tr>
						    <th width="10%">내용</th>
						    <td colspan="5" style="height: 200px; vertical-align: top;">${vo.content}</td>
						  </tr>
						  
						  <%-- <c:if test="${vo.isreply != 0}">
						    <tr>
						      <th width="10%">답변 내용</th>
						      <td colspan="5" style="height: 200px; vertical-align: top;">${vo.content}</td>
						    </tr>
						  </c:if>   --%>
						</table>
            
            <div class="text-center mt-4">
                <a href="../replyboard/list.do" class="btn btn-secondary">목록으로</a>
                <c:if test="${sessionScope.id == vo.id}">
                    <%-- <a href="../replyboard/update.do?no=${vo.no}" class="btn btn-primary">수정</a> --%>
                    <a href="../replyboard/delete.do?no=${vo.no}" class="btn btn-danger">삭제</a>
                </c:if>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- 기타 JS 파일들 -->
</body>
</html>