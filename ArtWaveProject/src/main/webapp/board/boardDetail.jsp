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
        font-size: 30px;
        color: black;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
    }
    .table td, .table th {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: left;
    }
    .text-center {
        text-align: center;
    }
    .text-right {
        text-align: right;
    }
    .button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 4px;
        transition: background 0.3s;
    }
    .button:hover {
        background-color: #0056b3;
    }
    .button.cancel {
        background-color: #dc3545;
    }
    .button.cancel:hover {
        background-color: #c82333;
    }
    .button.edit {
        background-color: #28a745;
    }
    .button.edit:hover {
        background-color: #218838;
    }
    .deleteBtn {
        background: none;
        border: none;
        font-size: 15px;
        width: 0px;
        height: 0px;
        color: red;
        cursor: pointer;
        margin-left: -5px;
    }
    
    .reply-section textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        resize: vertical;
        font-size: 16px;
        margin-top:
    }
    
     .reply-section input[type="button"] {
        width: 80%;
        height: 60px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background 0.3s, transform 0.3s;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        margin-top: -5px;
    }

    .reReplyBtn{
         background-color: #007bff; 
         color: white; 
         border: none; 
         border-radius: 5px; 
         cursor: pointer; 
         font-size: 16px; 
         transition: background 0.3s, transform 0.3; 
         box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    
    }
    .reReplyBtn:hover {
        background-color: #0056b3;
        transform: scale(1.02);
    }
    
    .reReplyBtn:active {
        background-color: #004494;
        transform: scale(0.98);
    }
    
    .reply-section input[type="button"]:hover {
        background-color: #0056b3;
        transform: scale(1.02);
    }

    .reply-section input[type="button"]:active {
        background-color: #004494;
        transform: scale(0.98);
    }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let state=-5
let id = '${id}'
	$(function() {
		replyList()
		$('#content').click(function() {
			if (id.length < 2) {
				alert('로그인이 필요합니다')
				$('#content').blur()
			}
		})
		$('#replyBtn').click(function() {
			let content = $('#content').val()
			if (content.trim() === '') {
				alert('내용을 입력하세요')
				return			}
			$.ajax({
				type:'post',
				url:'../board/replyInsert.do',
				data:{
					'fbno':${detail.fbno},
					'depth':1,
					'content':content
				},
				success:function(){
					$('#content').val('')
					replyList()
					replyCount()
				}
			})
		})
		$('#deleteBtn').click(function() {
			$.ajax({
				type:'post',
				url:'../board/boardDelete.do',
				data:{'fbno':${detail.fbno}},
				success:function(){
					location.href="../board/boardList.do"
				}
			})
		})
	})
	function tableShow(frno) {
		if(frno===state){
			$('#table'+frno).css('display', 'none')
			state=-5
		}
		else{
			$('.reReplyTable').css('display', 'none')
			console.log(frno)
			$('#table'+frno).css('display', '')
			state=frno
		}
	}
	function replyList() {
		$.ajax({
			type:'post',
			url:'../board/replyList.do',
			data:{
				'fbno':${detail.fbno}
			},
			success:function(result){
				json=JSON.parse(result)
				let html=''
					html+='<table class="table">'
					json.map(function(reply) {
					html+='<tr>'
					if(reply.depth===1){
						html+='<td width="10%" style="font-weight:bold;">'+reply.nick+'</td>'
					}
					else{
						html+='<td width="10%">'+reply.nick+'</td>'
					}
					if(reply.depth===1){
						html+='<td style="cursor:pointer;width:70%;" onclick="tableShow('+reply.frno+')"><pre>'+reply.content+'</pre>'
					}
					else{
						html+='<td style="width:70%;"><pre style="margin-left:20px;">ㄴ'+reply.content+'</pre>'	
					}
					html+='</td>'
					if(reply.id===reply.sessionId){
						html+='<td style="width:18%;" style="text-align:center;">'+reply.dbday+'</td>'
						html+='<td style="width:2%;" style="padding:0px;"><button onclick="replyDelete('+reply.frno+', '+reply.depth+')" type="button" class="deleteBtn" data-rno="'+reply.frno+'">x</button></td>'
					}
					else{
						html+='<td style="width:18%;" style="text-align:center;">'+reply.dbday+'</td>'
						html+='<td style="width:2%;" style="text-align:right;"></td>'
					}
					html+='</tr>'
					if(reply.depth==1){
						html += '<tr>';
	                    html += '<td colspan="5" style="text-align:right; padding:0px;" class="reply-form">'
	                    html += '<table class="table reReplyTable" id="table' + reply.frno + '" style="display:none;">'
	                    html += '<tr>'
	                    html+='<td width="85%" style="vertical-align: middle;">'
	                    html += '<textarea onclick="reReplyCheck('+reply.frno+')" id="content'+reply.frno+'" style="width: 100%; padding: 10px ;border: 1px solid #ddd; border-radius: 4px; resize: none; font-size: 16px; margin-top:"></textarea></td>'
	                    html += '<td width="15%" style="vertical-align: middle;">'
	                    html += '<input class="reReplyBtn" onclick="reReplyInsert('+reply.frno+')" type="button" style="width: 120px; height: 60px;" value="작성"></td>'
	                    html += '</tr>'
	                    html += '</table>'
	                    html += '</td>'
	                    html += '</tr>'
					}
				})
					html+='</table>'
				$('#reply').html(html)
			}
		})
	}
	function reReplyCheck(frno) {
		if (id.length < 2) {
			alert('로그인이 필요합니다')
			$('#content'+frno).blur()
			return
		}
	}
	function reReplyInsert(frno) {
		let content = $('#content'+frno).val()
		if (content.trim() === '') {
			alert('내용을 입력하세요')
			return
		}
		$.ajax({
			type:'post',
			url:'../board/replyInsert.do',
			data:{
				'fbno':${detail.fbno},
				'depth':2,
				'root':frno,
				'content':content
			},
			success:function(){
				$('#content'+frno).val('')
				tableShow(frno)
				replyList()
				replyCount()
			}
		})
	}
		function replyDelete(frno, depth) {
			if(depth===1){
				$.ajax({
					type:'post', 
					url:'../board/replyCheck.do',
					data:{'root':frno},
					success:function(result){
						if(result!=0){
							alert('댓글을 지울 수 없습니다')
							return
						}
						else{
							$.ajax({
								type:'post',
								url:'../board/replyDelete.do',
								data:{'frno':frno},
								success:function(result){
									replyList()
									replyCount()
								}
							})
						}
					}
				})
			}
			else{
				$.ajax({
					type:'post',
					url:'../board/replyDelete.do',
					data:{'frno':frno},
					success:function(result){
						replyList()
						replyCount()
					}
				})
			}
		}
		function replyCount() {
			let fbno=${detail.fbno}
			$.ajax({
				type:'post',
				url:'../board/replyCount.do',
				data:{'fbno':fbno},
				success:function(result){
					$('#reply1').text(result)
					$('#reply2').text(result)
				}
			})
		}
</script>
</head>
<body>
	<div class="container" style="margin-top: 150px; border: 1px solid #ddd;
        border-radius: 8px; padding: 40px;">
        <div class="header" >
            <h4>글 상세보기</h4>
        </div>
        <table class="table">
            <tr>
                <td colspan="2">
                    <span style="font-weight: bold; font-size: 20px; margin-right: 5px;">[${type}]</span><span style="font-weight: bold; font-size: 20px;">${detail.fbsubject}</span>
                </td>
            </tr>
            <tr>
                <td width="85%">${detail.nick}&nbsp;&nbsp;|&nbsp;&nbsp;${detail.dbday}</td>
                <td width="15%" class="text-right" style="text-align: center;">
                    조회수 ${detail.fbhit}&nbsp;&nbsp; 댓글 <span id="reply1">${count}</span>개
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 500px; font-size: 18px;">
                    <pre>${detail.content}</pre>
                </td>
            </tr>
            <tr class="text-right">
                <td colspan="2">
                    <c:if test="${sessionScope.id == detail.id}">
                        <input type="button" value="삭제" id="deleteBtn" class="button cancel">
                        <input type="button" value="수정" id="writeBtn" class="button edit">
                    </c:if>
                    <input type="button" value="목록" onclick="javascript:history.back()" class="button">
                </td>
            </tr>
        </table>
        <table class="table">
            <thead>
                <tr>
                    <td colspan="2">
                        전체 댓글 <span id="reply2">${count}</span>개
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="2" id="reply" style="border: transparent; padding: 0;"></td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td width="85%" class="reply-section">
                        <textarea id="content" rows="3" cols="10" style="resize: none;" placeholder="댓글을 입력하세요"></textarea>
                    </td>
                    <td width="15%" class="reply-section">
                        <input type="button" id="replyBtn" value="작성">
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
</body>
</html>