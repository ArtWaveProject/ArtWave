<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

    body {
        font-family: Arial, sans-serif;
    }
    .header {
        text-align: center;
        margin-bottom: 20px;
    }
    .header h4 {
        margin: 0;
        font-size: 30px;
        color: #333;
    }
    .search-bar {
        display: flex;
        justify-content: flex-end;
        margin-bottom: 20px;
    }
    .search-bar select, .search-bar input[type="text"], .search-bar input[type="button"] {
        margin-left: 5px;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .search-bar input[type="button"] {
        background-color: #3b84d1;
        color: white;
        cursor: pointer;
        width: 60px;
    }
    .search-bar input[type="button"]:hover {
        background-color: #0056b3;
    }
    .genreTable {
        width: 100%;
        margin-bottom: 0px;
        border-collapse: collapse;
    }
    .genreTable td {
        padding: 0;
        vertical-align: middle;
    }
    .genreTable a {
        display: block;
        padding: 10px;
        text-align: center;
        color: #333;
        text-decoration: none;
        border: 2px solid #ddd;
        border-radius: 4px 4px 0 0;
        background: #fff;
        font-size: 14px;
        transition: background 0.3s, border-color 0.3s;
    }
    .genreTable a:hover {
        background: #3b84d1;
        color: #fff;
        border-color: #3b84d1;
    }
    .genreTable .active a {
        background: #3b84d1;
        color: #fff;
        border-color: #3b84d1;
    }
    .genreTable .anext a {
        border-left: none;
    }
    .table {
        width: 100%;
        margin-bottom: 50px;
        border-collapse: collapse;
        background: #fff;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .table th, .table td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    .table th {
        background: #f4f4f4;
    }
    .table tr:hover {
        background: #f1f1f1;
    }
    .table .title {
        color: #3b84d1;
        text-decoration: none;
    }
    .table .title:hover {
        text-decoration: underline;
    }
    .button-container {
        text-align: right;
        margin-top: 20px;
    }
    .button-container input[type="button"] {
        background-color: #3b84d1;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 4px;
        transition: background 0.3s;
    }
    .button-container input[type="button"]:hover {
        background-color: #0056b3;
    }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function check(id) {
		if (id === '')
			alert('로그인이 필요합니다')
		else {
			location.href = "../board/boardInsert.do"
		}
	}
</script>
</head>
<body>
	 <div class="container" style="margin-top: 200px;">
        <div class="header">
            <h4>자유게시판</h4>
        </div>
        <div class="search-bar">
            <select name="option">
                <option value="0">검색 옵션 선택</option>
                <option value="1">닉네임</option>
                <option value="2">제목</option>
                <option value="3">내용</option>
            </select>
            <input type="text" size="25" name="ss" class="input input-sm" placeholder="검색어 입력">
            <input type="button" value="검색">
        </div>
        <table class="genreTable">
            <tr>
                <td width="20%" class="genreBtn ${type==''?'active':''}">
                    <a href="../board/boardList.do">전체</a>
                </td>
                <td width="20%" class="genreBtn ${type==1?'active':type==''?'anext':''}">
                    <a href="../board/boardList.do?type=1">자유</a>
                </td>
                <td width="20%" class="genreBtn ${type==2?'active':type=='1'?'anext':''}">
                    <a href="../board/boardList.do?type=2">영화</a>
                </td>
                <td width="20%" class="genreBtn ${type==3?'active':type==2?'anext':''}">
                    <a href="../board/boardList.do?type=3">도서</a>
                </td>
                <td width="20%" class="genreBtn ${type==4?'active':type==3?'anext':''}">
                    <a href="../board/boardList.do?type=4">음악</a>
                </td>
            </tr>
        </table>
        <table class="table">
            <thead>
                <tr>
                    <th width="5%" class="text-center">번호</th>
                    <th width="50%" class="text-center">제목</th>
                    <th width="15%" class="text-center">닉네임</th>
                    <th width="20%" class="text-center">작성일</th>
                    <th width="10%" class="text-center">조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vo" items="${bList}" varStatus="i">
                    <tr>
                        <td>${count-i.index}</td>
                        <td><a href="../board/boardDetail.do?fbno=${vo.fbno}" class="title">[${vo.typeDetail}] ${vo.fbsubject}</a></td>
                        <td>${vo.nick}</td>
                        <td>${vo.dbday}</td>
                        <td>${vo.fbhit}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="button-container">
            <input type="button" id="writeBtn" value="글 작성" onclick="check('${sessionScope.id}')">
        </div>
    </div>
</body>
</html>