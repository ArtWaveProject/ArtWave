<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CodePen - Sign Up/Sign In Responsive form</title>
<link rel="stylesheet" href="../signup/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		let checkId=false
		let checkNick=false
		let checkEmail=false
		let checkPwd=false
		$('#idCheck').click(function() {
			let id = $('#id')
			if(id.val().trim()===''){
				id.focus()
				return
			}
			$.ajax({
				type:'post',
				url:'../member/idCheck.do',
				data:{
					'id':id.val()
				},
				success:function(result){
					if(result==='OK'){
						checkId=true
						id.attr('readonly', 'readonly')
						$('#idCheck').hide()
					}
					else{
						alert('이미 존재하는 ID입니다')
						id.val('')
						id.focus()
					}
				}
			})
		})
		$('#nickCheck').click(function() {
			let nick = $('#nick')
			if(nick.val().trim()===''){
				nick.focus()
				return
			}
			$.ajax({
				type:'post',
				url:'../member/nickCheck.do',
				data:{
					'nickname':nick.val()
				},
				success:function(result){
					if(result==='OK'){
						checkNick=true
						nick.attr('readonly', 'readonly')
						$('#nickCheck').hide()
					}
				}
			})
		})
		$('#postBtn').on('click', function() {
			new daum.Postcode({
				oncomplete : function(data) {
					$('#post').val(data.zonecode)
					$('#addr1').val(data.address)
				}
			}).open()
		})
		$('#pwdCheck').keyup(function() {
			let pwd=$('#pwd').val()
			let pwd_temp=$('#pwdCheck').val()
			console.log(pwd)
			console.log(pwd_temp)
			if(pwd.trim()===''){
				$('#pwdState').css('color', 'red')
				$('#pwdState').text('비밀번호를 아직 입력하지 않았습니다')
				return
			}
			if(pwd===pwd_temp){
				$('#pwdState').css('color', 'green')
				$('#pwdState').text('비밀번호가 일치합니다')
			}
			else{
				$('#pwdState').css('color', 'red')
				$('#pwdState').text('비밀번호가 일치하지 않습니다')
			}
		})
		$('#pwd').keyup(function() {
			let pwd=$('#pwd').val()
			let pwd_temp=$('#pwdCheck').val()
			console.log(pwd)
			console.log(pwd_temp)
			if(pwd_temp.trim()==''){
				return
			}
			if(pwd===pwd_temp){
				$('#checkColor').css('color', 'green')
				$('#checkColor').text('비밀번호가 일치합니다')
				checkPwd=true
			}
			else{
				$('#checkColor').css('color', 'red')
				$('#checkColor').text('비밀번호가 일치하지 않습니다')
				checkPwd=false
			}
		})
		$('#birth').change(function() {
			let date=$('#birth').val()
			console.log(date)
			let year=date.substring(0,4)
			let month=date.substring(5,7)
			let day=date.substring(8,10)
			console.log(year)
			console.log(month)
			console.log(day)
		})
	})
</script>
</head>
<body>
	<!-- partial:index.partial.html -->
	<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

	<div class="login">
		<div class="login__content">
			<div class="login__img">
				<img src="https://image.freepik.com/free-vector/code-typing-concept-illustration_114360-3581.jpg" alt="user login">
			</div>
			<div class="login__forms">
				<!--         login form -->
				<form action="" class="login__register" id="login-in">
					<h1 class="login__title">Sign In</h1>
					<div class="login__box">
						<i class='bx bx-user login__icon'></i>
						<input type="text" placeholder="Username" class="login__input">
					</div>
					<div class="login__box">
						<i class='bx bx-lock login__icon'></i>
						<input type="text" placeholder="Password" class="login__input" >
					</div>
					<a href="#" class="login__forgot">Forgot Password? </a> <a href="#" class="login__button">Sign In</a>

					<div>
						<span class="login__account login__account--account">Don't Have an Account?</span> <span class="login__signin login__signin--signup"
							id="sign-up">Sign Up</span>
					</div>
				</form>

				<!--         create account form -->
				<form action="" class="login__create none" id="login-up">
					<h1 class="login__title">Create Account</h1>
					<div class="login__box">
						<i class='bx bx-user login__icon'></i>
						<input type="text" placeholder="Username" class="login__input">
					</div>

					<div class="login__box">
						<i class='bx bx-user login__icon'></i>
						<input type="text" placeholder="ID" class="login__input" id="id" style="display: inline-block;">
						<input class="login_input" type="button" id="idCheck" value="중복확인">
					</div>

					<div class="login__box">
						<i class='bx bx-at login__icon'></i>
						<input type="text" placeholder="Nick name" class="login__input" id="nick">
						<input class="login_input" type="button" id="nickCheck" value="중복확인">
					</div>

					<div class="login__box">
						<i class='bx bx-lock login__icon'></i>
						<input type="text" placeholder="Password" class="login__input" id="pwd">
					</div>

					<div class="login_box">
						<i class="bx bx-at login__icon"></i>
						<input type="date" id="birth" max="2000-01-01" class="login__input" height="30" width="100px">
					</div>
					<div class="login__box">
						<i class='bx bx-lock login__icon'></i>
						<input type="text" placeholder="Confirm Password" class="login__input" id="pwdCheck" style="inline-block">
						<p id="pwdState"><font color="blue" id="checkColor"></font></p>
					</div>

					<div class="login__box">
						<i class='bx bx-at login__icon'></i>
						<input type="text" placeholder="Email" class="login__input">
					</div>

					<div class="login__box">
						<i class='bx bx-at login__icon'></i>
						<input type="text" placeholder="post" class="login__input" id="post" readonly="readonly">
						<input class="login_input" type="button" id="postBtn" value="우편번호 검색">
					</div>

					<div class="login__box">
						<i class='bx bx-at login__icon'></i>
						<input type="text" placeholder="addr" class="login__input" id="addr1" readonly="readonly">
					</div>

					<div class="login__box">
						<i class='bx bx-at login__icon'></i>
						<input type="text" placeholder="addr2" class="login__input" id="addr2">
					</div>


					<a href="#" class="login__button">Sign Up</a>

					<div>
						<span class="login__account login__account--account">Already have an Account?</span> <span class="login__signup login__signup--signup"
							id="sign-in">Sign In</span>
					</div>

					<div class="login__social">
						<a href="#" class="login__social--icon"> <i class='bx bxl-facebook'></i>
						</a> <a href="#" class="login__social--icon"> <i class='bx bxl-twitter'></i>
						</a> <a href="#" class="login__social--icon"> <i class='bx bxl-google'></i>
						</a> <a href="#" class="login__social--icon"> <i class='bx bxl-github'></i>
						</a>
					</div>
				</form>

				<form action="" class="login__create none" id="login-up">
					<h1 class="login__title">Create Account</h1>
					<div class="login__box">
						<i class='bx bx-user login__icon'></i>
						<input type="text" placeholder="Username" class="login__input">
					</div>

					<div class="login__box">
						<i class='bx bx-at login__icon'></i>
						<input type="text" placeholder="Email" class="login__input">
					</div>

					<div class="login__box">
						<i class='bx bx-lock login__icon'></i>
						<input type="text" placeholder="Password" class="login__input">
					</div>

					<a href="#" class="login__button" id=signupBtn>Sign Up</a>

					<div>
						<span class="login__account login__account--account">Already have an Account?</span> <span class="login__signup login__signup--signup"
							id="sign-in">Sign In</span>
					</div>

					<div class="login__social">
						<a href="#" class="login__social--icon"> <i class='bx bxl-facebook'></i>
						</a> <a href="#" class="login__social--icon"> <i class='bx bxl-twitter'></i>
						</a> <a href="#" class="login__social--icon"> <i class='bx bxl-google'></i>
						</a> <a href="#" class="login__social--icon"> <i class='bx bxl-github'></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- partial -->
	<script src="../signup/script.js"></script>

</body>
</html>
