<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../include/importSource.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/user/myPage/login.css">
<title>로그인</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<main>
		<section>
			<div class="login">
				<div class="introduce">
					<img src="/resources/images/pet.png"><br> <br>
					<h2>펫 라운지에 오신것을 환영합니다.</h2>
				</div>
				<h1>Login</h1>
				<hr>
				<br>
				<form action="/userLogin/page.do" method="get">
					<input type="text" name="u" placeholder="Username"
						required="required" /> <input type="password" name="p"
						placeholder="Password" required="required" />
					<button type="submit" class="btn btn-primary btn-block btn-large">로그인</button>
					<div>
						<button type="button" class="btn_2" onclick="showIdPwFindPage()" style="line-height: initial;">아이디 / 비밀번호 찾기</button>
						<button type="button" class="btn_3" onclick="showRegisterPage()" style="line-height: initial;">회원가입</button>
					</div>
				</form>
			</div>
		</section>
	</main>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script>
	function showIdPwFindPage() {
		location.href="/idpwFind/page.do"
	}
	
	function showRegisterPage() {
		location.href="/userRegister/page.do"
	}
	
	</script>
</body>
</html>