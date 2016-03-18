<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- Bootstrap Core CSS -->
    <link href="${initParam.root}bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom CSS -->
    <link href="${initParam.root}css/style.css" rel="stylesheet">
    
    <!-- Javascript & jQuery -->
    <script src="${initParam.root}js/jquery-2.1.1.min.js"></script>
    <script src="${initParam.root}js/script.js"></script>
    <script src="${initParam.root}js/jquery.appear.js"></script>
    
</head>
<script type="text/javascript">
	
	$(document).ready(function(){
		if("${requestScope.loginResult}"=="wrongEmail") {
			alert("이메일 주소를 확인해주세요");
		} else if("${requestScope.loginResult}"=="wrongPassword") {
			alert("비밀번호를 확인해주세요");
		}
	});

</script>
<body>
	<div class="container">
	    <div class="row" style="padding-top: 80px;">
	        <div class="col-md-2 col-md-offset-5">
		        <div class="section-title text-center">
		            <h3>로그인</h3>
		            <br>
		            <br>
		        </div>
		        
	            <form action="${initParam.root}memberLogin.do" method="post" name="sentMessage" id="contactForm" novalidate>
	                <div class="row">
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="이메일" name="memberEmail" required data-validation-required-message="이메일을 입력해주세요">
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="비밀번호" name="memberPassword" required data-validation-required-message="비밀번호를 입력해주세요">
                            <p class="help-block text-danger"></p>
                        </div>
	                    <div class="clearfix"></div>
                        <div id="success"></div>
                        <button type="submit" class="btn btn-primary btn-block">로그인</button>
	                </div>
	            </form>
	            
	            <div style="text-align: center; margin-top:20px">
					<a href="#">
                           <span>아이디 찾기</span>
					</a> |
					<a href=#">
                           <span>비밀번호 찾기</span>
					</a>
				</div>
	        </div>
	    </div>
	</div>
</body>
</html>