<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CodePen - Sign Up/Sign In Responsive form</title>
<link rel="stylesheet" href="../member/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		$('#findType').change(function() {
			let findType=$("input:radio[name='type']:checked").val()
			$('#phone2').val('')
			$('#phone3').val('')
			$('#findEmailData').val('')
			$('#findResult').html('')
			if(findType==='1'){
				$('#findPhone').removeClass('none')
				$('#findEmail').addClass('none')
			}
			else{
				$('#findEmail').removeClass('none')
				$('#findPhone').addClass('none')
			}
			$('#findBtn').removeClass('none')
		})
		$('#findBtn').click(function() {
			let ss
			let findType=$("input:radio[name='type']:checked").val()
			if(findType==='1'){
				let phone1=$('select[name=phone1] option:checked').val()
				let phone2=$('#phone2').val()
				if(phone2.trim()===''){
					alert('전화번호를 전부 입력하세요')
					$('#phone2').focus()
					return
				}
				let phone3=$('#phone3').val()
				if(phone3.trim()===''){
					alert('전화번호를 전부 입력하세요')
					$('#phone3').focus()
					return
				}
				ss=phone1+phone2+phone3
				console.log(ss)
			}
			else{
				ss=$('#findEmailData').val()
				if(ss.trim()===''){
					alert('이메일을 입력하세요')
					$('#findEmailData').focus()
					return
				}
			}
			console.log(type)
			$.ajax({
				type:'post',
				url:'../member/idFind.do',
				data:{
					'type':findType,
					'ss':ss
				},
				success:function(result){
					let text
					if(result==='NO'){
						text='<font color="red">등록된 아이디가 존재하지 않습니다</font>'
					}
					else{
						text='등록된 아이디 : <font color="#4AD395">'+result+'</font>'
					}
					$('#findResultDiv').removeClass('none')
					$('#findResult').html(text)
				}
			})
		})
		$('#findTypePwd').change(function() {
			$('#phone2Pwd').val('')
			$('#phone3Pwd').val('')
			$('#findEmailDataPwd').val('')
			$('#findResultPwd').html('')
			let findType=$("input:radio[name='typePwd']:checked").val()
			if(findType==='1'){
				$('#findPhonePwd').removeClass('none')
				$('#findEmailPwd').addClass('none')
			}
			else{
				$('#findEmailPwd').removeClass('none')
				$('#findPhonePwd').addClass('none')
			}
			$('#findBtnPwd').removeClass('none')
		})
		$('#findBtnPwd').click(function() {
			let ss
			let findType=$("input:radio[name='typePwd']:checked").val()
			let id=$('#idPwd').val()
			if(id.trim()===''){
				alert('아이디를 입력하세요')
				$('#idPwd').focus()
				return
			}
			if(findType==='1'){
				let phone1=$('select[name=phone1Pwd] option:checked').val()
				let phone2=$('#phone2Pwd').val()
				if(phone2.trim()===''){
					alert('전화번호를 전부 입력하세요')
					$('#phone2Pwd').focus()
					return
				}
				let phone3=$('#phone3Pwd').val()
				if(phone3.trim()===''){
					alert('전화번호를 전부 입력하세요')
					$('#phone3Pwd').focus()
					return
				}
				ss=phone1+phone2+phone3
				console.log(ss)
			}
			else{
				ss=$('#findEmailDataPwd').val()
				if(ss.trim()===''){
					alert('이메일을 입력하세요')
					$('#findEmailDataPwd').focus()
					return
				}
			}
			console.log(type)
			$.ajax({
				type:'post',
				url:'../member/pwdFind.do',
				data:{
					'id':id,
					'type':findType,
					'ss':ss
				},
				success:function(result){
					let text
					if(result==='NO'){
						text='<font color="red">등록된 비밀번호가 존재하지 않습니다</font>'
					}
					else{
						text='등록된 비밀번호 : <font color="#4AD395">'+result+'</font>'
					}
					$('#findResultDivPwd').removeClass('none')
					$('#findResultPwd').html(text)
				}
			})
		})
		$('#forgot').click(function(){
			$('#login-in').removeClass("block");
		    $('#find-account').removeClass("none");

		    $('#login-in').addClass("none");
		    $('#find-account').addClass("block");
		})
		$('#returnLogin').click(function(){
			$('#phone2').val('')
			$('#phone3').val('')
			$('#findEmailData').val('')
			$('#findResult').html('')
			$('#login-in').removeClass("none");
		    $('#find-account').removeClass("block");

		    $('#login-in').addClass("block");
		    $('#find-account').addClass("none");
		})
		$('#forgotPwd').click(function(){
			$('#login-in').removeClass("block");
		    $('#find-Pwd').removeClass("none");

		    $('#login-in').addClass("none");
		    $('#find-Pwdt').addClass("block");
		})
		$('#returnLoginPwd').click(function(){
			$('#phone2Pwd').val('')
			$('#phone3Pwd').val('')
			$('#findEmailDataPwd').val('')
			$('#findResultPwd').html('')
			$('#idPwd').val('')
			$('#login-in').removeClass("none");
		    $('#find-Pwd').removeClass("block");

		    $('#login-in').addClass("block");
		    $('#find-Pwd').addClass("none");
		})
		let checkId=false
		let checkNick=false
		let checkEmail=false
		let checkPwd=false
		let checkPhone=true
		let type=${type}
		if(type===0){
			loginin.classList.remove("block");
		    loginup.classList.remove("none");

		    loginin.classList.add("none");
		    loginup.classList.add("block");
		}
		$('#idCheck').click(function() {
			let id = $('#signUpId')
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
						$('#idIcon').css('display', '')
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
						$('#nickIcon').css('display', '')
					}
					else{
						alert('이미 존재하는 닉네임입니다')
						nick.val('')
						nick.focus()
					}
				}
			})
		})
		$('#phoneCheck').click(function() {
			let sel = $('select[name=phone] option:checked').val()
			if(sel===''){
				$('#phone_first').attr('disabled', 'true')
				$('#phoneCheck').hide()
				$('#phonekIcon').css('display', '')
				return
			}
			if($('#phone_second').val().trim()===''){
				alert('전화번호를 정확히 입력하세요')
				$('#phone_second').focus()
				return
			}
			if($('#phone_third').val().trim()===''){
				alert('전화번호를 정확히 입력하세요')
				$('#phone_third').focus()
				return
			}
			let phone=sel+$('#phone_second').val()+$('#phone_third').val()
			console.log(phone)
			$.ajax({
				type:'post',
				url:'../member/phoneCheck.do',
				data:{
					'phone':phone
				},
				success:function(result){
					if(result==='OK'){
						checkPhone=true
						$('#phone_second').attr('readonly', true)
						$('#phone_third').attr('readonly', true)
						$('#phone_first').attr('disabled', 'true')
						$('#phoneCheck').hide()
						$('#phoneIcon').css('display', '')
					}
					else{
						alert('이미 존재하는 전화번호입니다')
						$('#phone_second').val('')
						$('#phone_third').val('')
					}
				}
			})
		})
		$('#emailCheck').click(function() {
			let email = $('#email')
			if(email.val().trim()===''){
				email.focus()
				return
			}
			console.log(email.val())
			$.ajax({
				type:'post',
				url:'../member/emailCheck.do',
				data:{
					'email':email.val()
				},
				success:function(result){
					console.log(result)
					if(result==='OK'){
						checkEmail=true
						email.attr('readonly', 'readonly')
						$('#emailCheck').hide()
						$('#emailIcon').css('display', '')
					}
					else{
						alert('이미 존재하는 이메일 입니다')
						$('#email').val('')
						$('#email').focus()
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
			let pwd=$('#signUppwd').val()
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
				checkPwd=true
			}
			else{
				$('#pwdState').css('color', 'red')
				$('#pwdState').text('비밀번호가 일치하지 않습니다')
				checkPwd=false
			}
		})
		$('#signUppwd').keyup(function() {
			let pwd=$('#signUppwd').val()
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
		$('#sexCheck').change(function() {
			let sex=$("input:radio[name='sex']:checked").val();
			console.log(sex)
		})
		$('select[name=phone]').change(function() {
			let sel=$('select[name=phone]').val()
			if(sel===''){
				checkPhone=true
				$('#phone_second').val('')
				$('#phone_third').val('')
				$('#phone_second').attr('readonly', true)
				$('#phone_third').attr('readonly', true)
			}
			else{
				checkPhone=false
				$('#phone_second').attr('readonly', false)
				$('#phone_third').attr('readonly', false)
				
			}
		})
		$('#signUpBtn').click(function() {
			if(!checkId){
				$('#signUpId').focus()
				return
			}
			if(!checkNick){
				$('#nick').focus()
				return
			}
			if(!checkEmail){
				$('#email').focus()
				return
			}
			if(!checkPhone){
				$('#email').focus()
				return
			}
			if(!checkPwd){
				$('#pwdCheck').focus()
			}
			let id=$('#signUpId').val()
			let pwd=$('#signUppwd').val()
			let name=$('#name').val()
			if(name==='')
				return
			let nickname=$('#nick').val()
			let date=$('#birth').val()
			if(date==='')
				return
			let year=date.substring(0,4)
			let month=date.substring(5,7)
			let day=date.substring(8,10)
			date=year+'/'+month+'/'+day
			let sex=$("input:radio[name='sex']:checked").val();
			let post=$('#post').val()
			if(post==='')
				return
			let addr1=$('#addr1').val()
			let addr2=$('#addr2').val()
			let phone= $('select[name=phone] option:checked').val()
			if(phone!=''){
				phone=$('select[name=phone] option:checked').val()+'-'+$('#phone_second').val()+'-'+$('#phone_third').val()
			}
			let email=$('#email').val()
			console.log(date)
			console.log(phone)
			$.ajax({
				type:'post',
				url:'../member/signUp.do',
				data:{
					'id':id,
					'pwd':pwd,
					'nickname':nickname,
					'name':name,
					'birthday':date,
					'sex':sex,
					'post':post,
					'addr1':addr1,
					'addr2':addr2,
					'phone':phone,
					'email':email
				},
				success:function(){
					location.href='../movie/moviemain.do'
				}
			})
		})
	})
	function login() {
		let id = $('#id').val()
		if (id.trim() === '') {
			alert('아이디를 입력하세요')
			$('#id').focus()
			return
		}
		let pwd = $('#pwd').val()
		if (pwd.trim() === '') {
			alert('비밀번호를 입력하세요')
			$('#pwd').focus()
			return
		}
		$.ajax({
			type:'post',
			url:'login_ok.do',
			data:{
				'id':id,
				'pwd':pwd
			},
			success:function(result){
				if(result==='OK'){
					location.href='../movie/moviemain.do'
				}
				else if(result==='NOID'){
					alert('ID가 존재하지 않습니다')
					$('#id').val('')
					$('#pwd').val('')
					$('#id').focus()
					return
				}
				else if(result==='NOPWD'){
					alert('비밀번호가 틀렸습니다')
					$('#pwd').val('')
					$('#pwd').focus()
					return
				}
			}
		})
	}
</script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: url('dust.png') no-repeat center center fixed;
	background-size: cover;
	font-family: Arial, sans-serif;
}

.login {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login__create, .login__find {
	left: -4rem;
}
</style>
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<!-- partial:index.partial.html -->

	<div class="login">
		<div class="login__content">
			<div class="login__forms">
				<!--         login form -->
				<form action="" class="login__register" id="login-in">
					<h1 class="login__title">Sign In</h1>
					<div class="login__box">
						<i class='bx bx-user login__icon'></i> <input type="text" placeholder="Username" class="login__input" id="id">
					</div>
					<div class="login__box">
						<i class='bx bx-lock login__icon'></i> <input type="password" placeholder="Password" class="login__input" id="pwd">
					</div>
					<a href="#" class="login__button" onclick="login()">Sign In</a>

					<div>
						<span class="login__signin login__signin--signup" id="forgot">Forgot Account? </span>&nbsp;<span class="login__signin login__signin--signup" id="forgotPwd">Forgot Password? </span><br> <span class="login__account login__account--account">Don't
							Have an Account?</span> <span class="login__signin login__signin--signup" id="sign-up">Sign Up</span>
					</div>
				</form>

				<!--         create account form -->
				<div class="login__create none" id="login-up">
					<h1 class="login__title">Create Account</h1>
					<div class="login__box">
						<i class='bx bx-face login__icon'></i> <input type="text" placeholder="Username" class="login__input" id="name" required>
					</div>

					<div class="login__box">
						<i class='bx bx-user login__icon'></i> <input type="text" placeholder="ID" class="login__input" id="signUpId"> <input type="button"
							value="중복확인" id="idCheck"> <img src="check.png" width="20px" id="idIcon" height="20px" style="background: none; display: none;">
					</div>

					<div class="login__box">
						<i class='bx bx-ghost login__icon'></i> <input type="text" placeholder="Nick name" class="login__input" id="nick"> <input type="button"
							value="중복확인" id="nickCheck"> <img src="check.png" width="20px" id="nickIcon" height="20px" style="background: none; display: none;">
					</div>

					<div class="login__box">
						<i class='bx bx-lock login__icon'></i> <input type="text" placeholder="Password" class="login__input" id="signUppwd">
					</div>

					<div class="login__box">
						<i class='bx bx-lock login__icon'></i> <input type="text" placeholder="Confirm Password" class="login__input" id="pwdCheck">
						<p style="margin: 0 auto;">
							<font size="1px" id="pwdState">&nbsp;</font>
						</p>
					</div>

					<div class="login__box">
						<i class='bx bx-phone login__icon'></i> <input type="text" placeholder="Phone" class="login__input" readonly>
						<div class="phone-container">
							<select name="phone" class="phone-prefix" style="margin-right: 6px;" id="phone_first">
								<option value="">없음</option>
								<option value="02">02</option>
								<option value="010">010</option>
								<option value="011">011</option>
							</select> <input type="text" placeholder="Phone" class="phone-input" style="margin-right: 6px;" id="phone_second" readonly maxlength="4"> <input
								type="text" placeholder="Phone" class="phone-input" id="phone_third" readonly maxlength="4">
								<input type="button"
							value="중복확인" id="phoneCheck"> <img src="check.png" width="20px" id="phoneIcon" height="20px" style="background: none; display: none;">
						</div>
					</div>

					<div class="login__box">
						<i class='bx bx-cake login__icon'></i> <input type="text" placeholder="Birth" class="login__input" readonly> <input type="date" required
							id="birth">
					</div>
					<div class="login__box" style="text-align: right;" id="sexCheck">
						<i class='bx bx-heart login__icon'></i> <input type="text" placeholder="Gender" class="login__input" readonly> <label
							class="login__input"> <input type="radio" value="남자" name="sex" id="sex" checked> 남자
						</label> <label class="login__input"> <input type="radio" value="여자" name="sex" id="sex"> 여자
						</label>
					</div>

					<div class="login__box">
						<i class='bx bx-at login__icon'></i> <input type="text" placeholder="Email" class="login__input" id="email"> <input type="button"
							value="중복확인" id="emailCheck"> <img src="check.png" width="20px" id="emailIcon" height="20px" style="background: none; display: none;">
					</div>

					<div class="login__box">
						<i class='bx bx-mail-send login__icon'></i> <input type="text" placeholder="post" class="login__input" readonly="readonly" id="post"> <input
							type="button" value="우편번호 찾기" id="postBtn" required>
					</div>
					<div class="login__box">
						<i class='bx bx-map login__icon'></i> <input type="text" placeholder="addr" class="login__input" readonly="readonly" id="addr1">
					</div>
					<div class="login__box">
						<i class='bx bx-map login__icon'></i> <input type="text" placeholder="addr" class="login__input" id="addr2">
					</div>


					<a href="#" class="login__button" id="signUpBtn">Sign Up</a>

					<div>
						<span class="login__account login__account--account">Already have an Account?</span> <span class="login__signup login__signup--signup"
							id="sign-in">Sign In</span>
					</div>

				</div>
				<!-- 아이디찾기 페이지 -->
				<div class="login__find none" id="find-account">
					<h1 class="login__title">Find Account</h1>
					<div class="login__box" id="findType">
						<i class='bx bx-search login__icon'></i> <input type="text" placeholder="type" class="login__input" readonly> <label
							class="login__input"> <input type="radio" value="1" name="type" id="type"> 전화번호
						</label> <label class="login__input"> <input type="radio" value="2" name="type" id="type"> 이메일
						</label>
					</div>
					<div class="login__box none" id="findPhone">
						<i class='bx bx-phone login__icon'></i> <input type="text" placeholder="Phone" class="login__input" readonly>
						<div class="phone-container">
							<select name="phone1" class="phone-prefix" style="margin-right: 6px;" id="phone1">
								<option value="02">02</option>
								<option value="010">010</option>
								<option value="011">011</option>
							</select> <input type="text" placeholder="Phone" class="phone-input" style="margin-right: 6px;" id="phone2" maxlength="4"> <input type="text"
								placeholder="Phone" class="phone-input" id="phone3" maxlength="4">
						</div>
					</div>
					<div class="login__box none" id="findEmail">
						<i class='bx bx-search login__icon'></i> <input type="text" placeholder="Email" class="login__input" id="findEmailData">
					</div>
					<div class="none" id="findBtn">
						<span style="cursor: pointer;" class="login__button">Find</span>
					</div>
					<div id="findResultDiv none">
						<span id="findResult" class="login__account login__account--account" style="font-size: 25px;"></span>
					</div>
					<div>
						<span class="login__account login__account--account">Already have an Account?</span> <span class="login__signup login__signup--signup"
							id="returnLogin">Sign In</span>
					</div>
				</div>
				<!-- 비밀번호찾기 페이지 -->
				<div class="login__find none" style="height: 360px !important;" id="find-Pwd">
					<h1 class="login__title">Find Password</h1>
					<div class="login__box" id="findIdPwd">
						<i class='bx bx-user login__icon'></i> <input type="text" placeholder="ID" class="login__input" id="idPwd">
					</div>
					<div class="login__box" id="findTypePwd">
						<i class='bx bx-search login__icon'></i> <input type="text" placeholder="type" class="login__input" readonly> <label
							class="login__input"> <input type="radio" value="1" name="typePwd" id="typePwd"> 전화번호
						</label> <label class="login__input"> <input type="radio" value="2" name="typePwd" id="typePwd"> 이메일
						</label>
					</div>
					<div class="login__box none" id="findPhonePwd">
						<i class='bx bx-phone login__icon'></i> <input type="text" placeholder="Phone" class="login__input" readonly>
						<div class="phone-container">
							<select name="phone1Pwd" class="phone-prefix" style="margin-right: 6px;" id="phone1Pwd">
								<option value="02">02</option>
								<option value="010">010</option>
								<option value="011">011</option>
							</select> <input type="text" placeholder="Phone" class="phone-input" style="margin-right: 6px;" id="phone2Pwd" maxlength="4"> <input type="text"
								placeholder="Phone" class="phone-input" id="phone3Pwd" maxlength="4">
						</div>
					</div>
					<div class="login__box none" id="findEmailPwd">
						<i class='bx bx-search login__icon'></i> <input type="text" placeholder="Email" class="login__input" id="findEmailDataPwd">
					</div>
					<div class="none" id="findBtnPwd">
						<span style="cursor: pointer;" class="login__button">Find</span>
					</div>
					<div id="findResultDivPwd none">
						<span id="findResultPwd" class="login__account login__account--account" style="font-size: 25px;"></span>
					</div>
					<div>
						<span class="login__account login__account--account">Already have an Account?</span> <span class="login__signup login__signup--signup"
							id="returnLoginPwd">Sign In</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- partial -->
	<script src="../member/script.js"></script>

</body>
</html>
