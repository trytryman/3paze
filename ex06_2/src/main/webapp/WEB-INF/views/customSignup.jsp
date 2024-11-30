<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h3>회원가입</h3>
	<form action="/customSignup" method="post">
		<input name="userid" placeholder="아이디"  type="text" required onblur="checkUsername()"/>
		<span id="usernameError" style="color: red;"></span>
		<input name="userpw" placeholder="비밀번호"  type="text" required/>
		<input name="userName" placeholder="이름"  type="text" required/>
		<input name="useremail" placeholder="이메일"  type="email" required/>
		<button type="submit">회원 가입</button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	
	
	<script>
        function checkUsername() {
            var username = document.getElementById("userid").value;
            var errorMessage = document.getElementById("usernameError");

            if (username === "") {
                errorMessage.textContent = "";
                return;
            }

            fetch("/checkUsernameExist?userid=" + username)
                .then(response => response.json())
                .then(data => {
                    if (data.exists) {
                        errorMessage.textContent = "이미 존재하는 아이디입니다.";
                    } else {
                        errorMessage.textContent = "";
                    }
                });
        }
    </script>
</body>
</html>