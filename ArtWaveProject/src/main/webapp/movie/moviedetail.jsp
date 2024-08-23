<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../movie/mstyle.css">
<link rel="stylesheet" href="../assets/css/fontawesome.css">
<script type="text/javascript">
$(function() {
	let listCheck=false
	let likeCheck=false
	let id=$('#id').val()
	if(id.length>0){
		console.log(id)
		$.ajax({
			type:'post',
			url:'../like/likeCheck.do',
			data:{
				'tno':${vo.mno},
				'type':4
			},
			success:function(result){
				if(result==='OK'){
					likeCheck=true
					$('#likeBtnIcon').attr('src', 'likeon.png')
				}
				else{
					likeCheck=false
					$('#likeBtnIcon').attr('src', 'likeoff.png')
				}
			}
		})
	}
	else{
		$('#likeBtn').css('display', 'none')
	}
	$('#likeBtn').click(function() {
		let mno=$('#mno').val()
		if(likeCheck===true){
			$.ajax({
				type:'post',
				url:'../like/likeOff.do',
				data:{
					'tno':mno,
					'type':4
				},
				success:function(result){
					if(result>=0){
						likeCheck=false
						$('#likeBtnIcon').attr('src', '../movie/likeoff.png')
						$('#likeCount').text(result)
					}
				}
			})
		}
		else{
			$.ajax({
				type:'post',
				url:'../like/likeOn.do',
				data:{
					'tno':mno,
					'type':4
				},
				success:function(result){
					if(result>=0){
						likeCheck=true
						$('#likeBtnIcon').attr('src', '../movie/likeon.png')
						$('#likeCount').text(result)
					}
				}
			})
		}
	})
	
  $('#writeBtn').on('click', function() {
    const mrcontent = $('#mrcontent').val().trim(); // 입력된 댓글 텍스트
    if (msg === "") {
        $('#mrcontent').focus(); // 댓글이 비어 있을 경우 포커스
        return;
    }
    const mno = $(this).data("mcno"); // 영화 번호

    $.ajax({
        type: 'post',
        url: '../movie/mreviewinsert.do',
        data: { 'mcno': mno, "mrcontent": mrcontent },
        success: function(result) {
            if (result === 'OK') {
                mreviewList(mno); // 댓글 작성 후 댓글 목록 업데이트
            } else {
                alert(result); // 실패 시 경고창
            }
        },
        error: function(request, status, error) {
            console.log(error); // 오류 발생 시 콘솔에 로그
        }
    })
})

// 삭제
window.mreviewDelete = function(mrno, mcno) {
    $.ajax({
        type: 'post',
        url: '../movie/mreviewdelete.do',
        data: { "mrno": mrno },
        success: function(result) {
            if (result === "OK") {
                mreviewList(mcno); // 댓글 삭제 후 댓글 목록 업데이트
            } else {
                alert(result); // 실패 시 경고창
            }
        },
        error: function(request, status, error) {
            console.log(error); // 오류 발생 시 콘솔에 로그
        }
    })
}

window.mreviewUpdate = function(mrno) {
    $('.updates').hide(); // 모든 수정 영역 숨기기
    $('#m' + mrno).show(); // 선택한 댓글의 수정 영역 표시
}

window.mreviewUpdateData = function(mrno, mcno) {
    const mrcontent = $('#mrcontent' + mrno).val().trim(); // 입력된 댓글 텍스트
    if (mrcontent === "") {
        $('#mrcontent' + mrno).focus(); // 댓글이 비어 있을 경우 포커스
        return;
    }
    $.ajax({
        type: 'post',
        url: '../movie/mreviewupdate.do',
        data: { "mrno":mrno, "mrcontent": mrcontent },
        success: function(result) {
            if (result === 'OK') {
                mreviewList(mcno); // 댓글 수정 후 댓글 목록 업데이트
            } else {
                alert(result); // 실패 시 경고창
            }
            $('#m' + mrno).hide(); // 수정 영역 숨기기
        },
        error: function(request, status, error) {
            console.log(error); // 오류 발생 시 콘솔에 로그
        }
    })
}
function mreviewList(mcno) {
    $.ajax({
        type: 'post',
        url: '../movie/mreviewlist.do',
        data: { "mcno": mcno },
        success: function(json) {
            const mreviews = JSON.parse(json); // JSON 문자열을 객체로 변환
            let html = '';

            mreviews.forEach(function(mreview) {
                html += '<table class="table">';
                html += '<tr>';
                html += '<td class="text-left">'+mreview.nickname + '(' + mreview.dbday + ')</td>';
                html += '<td class="text-right">';
                if (mreview.id === mreview.sessionId) {
                    html += '<span class="btn btn-xs btn-success ups" onclick="mreviewUpdate(' + mreview.mrno + ')">수정</span>&nbsp;';
                    html += '<input type=button class="btn btn-xs btn-warning" value="삭제" onclick="mreviewDelete(' + mreview.mrno + ',' + mreview.mcno + ')">';
                }
                html += '</td>';
                html += '</tr>';
                html += '<tr>';
                html += '<td colspan="2">';
                html += '<pre style="white-space:pre-wrap;border:none;background:white">' + mreview.mrcontent + '</pre>';
                html += '</td>';
                html += '</tr>';
                html += '<tr class="updates" id="m' + mreview.mrno + '" style="display:none">';
                html += '<td>';
                html += '<textarea rows="4" cols="70" id="mrcontent' + mreview.mrno + '" style="float: left">' + mreview.mrcontent + '</textarea>';
                html += '<input type=button value="댓글수정" onclick="replyUpdateData(' + mreview.mrno + ',' + mreview.mcno + ')" style="width: 100px;height: 85px;background-color: rgb(64,0,64);color:white">';
                html += '</td>';
                html += '</tr>';
                html += '</table>';
            })

            $('#mreview').html(html); // 댓글 목록을 업데이트
            $('#mrcontent').val(""); // 댓글 입력란 초기화
        },
        error: function(request, status, error) {
            console.log(error); // 오류 발생 시 콘솔에 로그
        }
    })
}
})
</script>
</head>
<body>
	<div class="page-content2">
	<div class="mlbefore">
	   	<i class="fa fa-chevron-circle-left"></i>
		  <input type="button" id='backbtn' name="이전 페이지로 이동" value="뒤로 가기" onclick="javascript:history.back()"> 
	</div>
	<div class="container">
	 <input type="hidden" value="${sessionScope.id}" id="id">
     <input type="hidden" value="${vo.mno}" id="mno">
	<table class="mdtable">
       <tr>
        <td width="40%" class="text-center" rowspan="16">
          <img src="https://www.kobis.or.kr${vo.mposter }" style="width: 100%">
        </td>
        </tr>
        <tr>
        <td>
          <h2 id="motitle" class="text-left">&nbsp;${vo.mtitle}&nbsp;&emsp;</h2>      
            <button id="likeBtn">
				<img src="" id="likeBtnIcon">
		  </button>   
        </td>
        </tr>
        <tr>
          <td>
          <h4 id="moinfo1">&nbsp;${vo.mrday}&nbsp;개봉&nbsp;|&nbsp;${vo.mtime}&nbsp;|&nbsp;${vo.mgrade}&nbsp;<br>
          &nbsp;누적관객수&nbsp;:&nbsp; ${vo.mcount }명&nbsp;|&nbsp;${vo.mnation }&nbsp;</h4>
       </td>
       <tr>
        <td class="text-left" id="moinfo2">소개</td>
        </tr>
        <tr>
        <td id="moinfo3"> ${vo.msynop } </td>
       </tr>
       <tr>
        <td id="moinfo4">장르 &nbsp;:&nbsp; ${vo.mgenre} </td>
       </tr>
       <tr>
        <td id="moinfo5">감독 &nbsp;:&nbsp; ${vo.mdirector} </td>
       </tr>
       <c:if test="${vo.mactor!=null }">
       <tr>
        <td id="moinfo6">출연 &nbsp;:&nbsp; ${vo.mactor} </td>
       </tr>
       </c:if>
       </table>
        
		<div class="moviebook">
            <h3>  <br></h3>
                <div class="owl-features owl-carousel">
                 <c:forEach var="mbvo" items="${mbList }">
                  <input type="hidden" value="${vo.mno}" id="mno">
				 <div class="item">
				 <div class="thumb">
                <img src="${mbvo.cover }"  alt="">
                 <div class="hover-effect">
                      <h6><i class="fa fa-eye"></i><a href="../book/detail.do?bno=${mbvo.bno }"  title="상세정보 확인">상세정보</a></h6>
                      </div>
                <h4 id="text2"><span>${mbvo.btitle }</span></h4>
                <ul>
                    <li>&nbsp; ${mbvo.price }원</li>
                </ul>
            </div>
        </div>
          </c:forEach>
        </div>
        </div>
        </div>
		</div>
	<div style="height: 20px"></div>
	    <h2 class="sectiontitle">리뷰</h2>
	    <table class="table" id="mreview_table">
	      <tbody>
	        <tr>
	          <td id="review">
	          </td>
	        </tr>
	      </tbody>
	    </table>
	    <c:if test="${sessionScope.id!=null }">
	     <table class="table">
	       <tr>
	        <td>
	         <textarea rows="4" cols="100" id="msg" style="float: left"></textarea>
	         <input type=button value="댓글쓰기" style="width: 100px;height: 85px;background-color: rgb(64,0,64); color:white" 
	         id="writeBtn" data-cno="${vo.mno }">
	        </td>
	       </tr>
	     </table>
	    </c:if>
	</div>
	</div>
</body>
</html>