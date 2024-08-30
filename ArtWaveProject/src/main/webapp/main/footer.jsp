<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.bblack{
		color: #555 !important;
		font-weight: bold;
	}
	.black{
		color: black !important;
	}
	footer .row {
        display: flex;
        align-items: center; /* 세로 가운데 정렬 */
        justify-content: space-between; /* 각 컬럼 사이의 공간을 균등하게 배치 */
    }
    footer .col-lg-3 img {
        max-width: 100%; /* 이미지 크기를 조절 */
        height: auto;
    }
    footer .container {
        margin: 0px auto;
    }
    footer .link{
    border: 1px solid #ddd;
    padding : 8px;
    border-radius: 10px;
    color: #888;
    }
</style>
</head>
<body>
	<footer>
		<div class="container" style="margin-top: 150px;">
			<div class="row">
			<div class="col-lg-2" style="vertical-align: middle;">
			<img src="../main/footer_logo.png">
			</div>
				<div class="col-lg-7 " style="vertical-align: middle;">
					<p class="bblack" style="text-align: left;">
						강북교육센터 Gangbuk<br>
						서울특별시 마포구 월드컵북로 21 풍성빌딩 2,3,4층 쌍용강북교육센터<br>
						Tel_02-336-8546~8     Fax_02-334-5405
					</p>
				</div>
				<div class="col-lg-3" style="text-align: right;">
				<h4 style="color: black; margin-right: 35px; margin-bottom: 15px;">고객문의</h4>
						<a class="link" href="../noticeboard/boardList.do">공지사항</a>
						<a class="link" href="../replyboard/list.do">1:1문의</a>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>