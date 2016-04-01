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
    <script src="${initParam.root}js/jquery-1.12.1.min.js"></script>
    <script src="${initParam.root}js/jquery-2.1.1.min.js"></script>
    <script src="${initParam.root}js/script.js"></script>
    <script src="${initParam.root}js/jquery.appear.js"></script>
    
    <!-- Template js -->
    <script src="${initParam.root}bootstrap/js/bootstrap.js"></script>
    <script src="${initParam.root}bootstrap/js/bootstrap.min.js"></script>
    <script src="${initParam.root}bootstrap/js/bootstrap-datepicker.js"></script>
    <script src="${initParam.root}js/jqBootstrapValidation.js"></script>
    <script src="${initParam.root}js/modernizr.custom.js"></script>
    
</head>
<script type="text/javascript">
	
	$(document).ready(function(){
		if("${requestScope.loginResult}"=="wrongEmail") {
			alert("이메일 주소를 확인해주세요");
		} else if("${requestScope.loginResult}"=="wrongPassword") {
			alert("비밀번호를 확인해주세요");
		}
	});
	function openRegisterModal(){
		$('#regist-modal').modal();
	}
	

</script>
<body>
	<div class="container">
	    <div class="row" style="padding-top:15%;">
	        <div class="col-md-4 col-md-offset-4">
		        <div class="section-title text-center" style=" font-size: 100px; margin-bottom: 50px;">
		        	한글봇
		        </div>
		        	
	            <form action="${initParam.root}memberLogin.do" method="post" name="sentMessage" id="contactForm" novalidate>
	                <div class="row">
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="이메일" name="memberEmailId" required data-validation-required-message="이메일을 입력해주세요">
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
					<a href="#" onclick="openRegisterModal()">
                           <span>회원가입</span>
					</a> 
				</div>
	        </div>
	    </div>
	</div>
	  
        <!-- Start Regist Section -->
        <div class="section-modal modal fade regist" id="regist-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                
                <div class="container">
                    <div class="row">
                        <div class="section-title text-center">
                            <h3>한글봇 회원가입하기</h3>
                            <p>아이의 학습 상황을 한 눈에 확인할 수 있습니다.</p>
                        </div>
                    </div>
                   
                    
                    <div class="row" style="padding-top: 80px;">
                        <div class="col-md-12">
                            <form action="${initParam.root}memberRegist.do" method="post" >
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="이메일" name="memberEmailId" required data-validation-required-message="이메일을 입력해주세요">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="비밀번호" name="memberPassword" required data-validation-required-message="비밀번호를 입력해주세요">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="비밀번호 확인" name="memberPasswordCheck" required data-validation-required-message="비밀번호를 한번 더 입력해주세요">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="이름" name="memberName" required data-validation-required-message="이름을 입력해주세요">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="form-group">
                                            <input type="tel" class="form-control" placeholder="아이 이름" name="memberBabyName" required data-validation-required-message="아이 이름을 입력해주세요">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="아이 생년월일을 8자로 입력해주세요 (ex. 20150308)" name="memberBabyBirthDate" 
                                            required data-validation-required-message="아이 생일을 입력해주세요">
                                           <!--  <input type="tel" class="form-control" placeholder="아이 생일" id="babyBirthDay" style="background: white; cursor: pointer;"
		                                	readonly="readonly" required data-validation-required-message="아이 생일을 선택해주세요"> -->
                                            <p class="help-block text-danger"></p>
                                        </div>
										<div class="form-group">
                                            <div class="radio-inline">
												<label>
													<input type="radio" name="memberBabySex" id="babySex_male" value="male" checked>
														남자
												</label>
											</div>
											<div class="radio-inline">
												<label>
											  		<input type="radio" name="memberBabySex" id="babySex_female" value="female" checked>
											   			여자
												</label>
											</div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-lg-12 text-center">
                                        <div id="success"></div>
                                        <button type="submit" class="btn btn-primary">회원 가입</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                </div>
                
            </div>
        </div>
        <!-- End Regist Section -->
</body>
</html>