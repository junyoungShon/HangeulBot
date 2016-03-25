<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

        <title>한글봇 콘텐츠</title>

        <!-- Bootstrap Core CSS -->
        <link href="${initParam.root}bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome CSS -->
        <link href="${initParam.root}css/font-awesome.min.css" rel="stylesheet">
		
		<!-- Custom CSS -->
        <link href="${initParam.root}css/animate.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${initParam.root}css/style.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
		
		<!-- Bootstrap datepicker CSS -->
        <link href="${initParam.root}bootstrap/css/bootstrap-datepicker.min.css" rel="stylesheet">

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
        
        

        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
		<script type="text/javascript">
		
			function gotoVowelPanix(){
				var broswerInfo = navigator.userAgent;
				alert(broswerInfo.toString());
				
				//위시룸 안드로이드 앱이 맞다면 아래 내용 실행
				//window.HangeulBotAndroidAPP.MainToVowelPanix();
			}
			
			/* $(function() {
				$( "#babyBirthDay" ).datepicker({ minDate: -1095, maxDate: "+10M", changeMonth: true,
				changeYear: true , dateFormat: "yy-mm-dd" });
			}); */
			
			//키 입력 방지
			$('#babyBirthDay').on('keypress', function(e) {
			    e.preventDefault();
			    return false;
			});
			
			function openRegisterModal(){
				$('#regist-modal').modal();
			}
			
		</script>
		<style type="text/css">
			.selector-on {
				border: medium;
				border-color: black;"
			}
		</style>
    </head>

    <body>
        
        <!-- Start Logo Section -->
        <section id="logo-section" class="text-center">
            <div class="container">
                <div class="row">
					<h3>한글봇 디지털 컨텐츠</h3>
					<div style="text-align: center; margin-top:20px">
						<c:choose>
							<c:when test="${empty sessionScope.loginUserInfo}">
								<a href="${initParam.root}goLoginPage.do">
		                            <span>로그인</span> 
		                        </a> |
							</c:when>
							<c:otherwise>
								<a href="${initParam.root}logout.do" onclick="return confirm('정말 로그아웃 하시겠습니까?')">
		                            <span>로그아웃</span>
		                        </a> |
							</c:otherwise>
						</c:choose>
                        <a href="#" data-toggle="modal" onclick="openRegisterModal()">
                            <span>회원가입</span>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Logo Section -->
        
        
        <!-- Start Main Body Section -->
        <div class="mainbody-section text-center">
            <div class="container">
                <div class="row">
                	<div class="col-md-12">
	                    <div class="col-md-6">
	                    	<div class="menu-item green selector-off" id="consonant">
	                            <a href="#clients-modal" data-toggle="modal">
	                                <i class="fa fa-file-photo-o"></i>
	                                <p>자음 놀이</p>
	                            </a>
	                        </div>
	                        <div class="menu-item blue selector-on" id="vowel">
	                            <a href="#" onclick="gotoVowelPanix()">
	                                <i class="fa fa-magic"></i>
	                                <p>모음 놀이</p>
	                            </a>
	                        </div>
	                    </div>
	                    
	                    <div class="col-md-6">
	                    	<div class="menu-item light-red selector-off" id="contentsSelector3">
	                            <a href="${initParam.root}member_goWordGame.do">
	                                <i class="fa fa-user"></i>
	                                <p>낱말 놀이</p>
	                            </a>
	                        </div>
							<div class="menu-item color">
								<a href="${initParam.root}member_goParentsPage.do">
									<i class="fa fa-area-chart"></i>
									<p>학습 통계</p>
	                            </a>
							</div>
	                    </div>
					</div>
                </div>
            </div>
        </div>
        <!-- End Main Body Section -->
        
        
        <!-- Start Copyright Section -->
        <div class="copyright text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div>Design & Developed by <a href="" target="_blank">CoreCross</a></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Copyright Section -->
        
        
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
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="footer-regist-info">
                                <h4>Contact info</h4>
                                <ul>
                                    <li><strong>E-mail :</strong> your-email@mail.com</li>
                                    <li><strong>Phone :</strong> +8801-6778776</li>
                                    <li><strong>Mobile :</strong> +8801-45565378</li>
                                    <li><strong>Web :</strong> yourdomain.com</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="footer-social text-center">
                                <ul>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row" style="padding-top: 80px;">
                        <div class="col-md-12">
                            <form action="${initParam.root}memberRegist.do" method="post" name="sentMessage" id="contactForm" novalidate>
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
        
        
        <!-- Start Report Section -->
        <div class="section-modal modal fade" id="report-modal" tabindex="-1" role="dialog" aria-hidden="true">
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
                            <h3>About Us</h3>
                            <p>Duis aute irure dolor in reprehenderit in voluptate</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="about-text">
                                <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. It has roots in a piece of classical Latin literature from 45 BC</p>
                                <div class="row">
                                    <div class="col-md-4 col-sm-6">
                                        <ul>
                                            <li><i class="fa fa-check-square"></i>Sed ut perspiciatis unde omnis iste natus</li>
                                            <li><i class="fa fa-check-square"></i>Nor again is there anyone who loves</li>
                                            <li><i class="fa fa-check-square-o"></i>At vero eos et accusamus et iusto odio</li>
                                            <li><i class="fa fa-check-square-o"></i>Et harum quidem rerum facilis</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-4 col-sm-6">
                                        <ul>
                                            <li><i class="fa fa-check-square"></i>Nor again is there anyone who loves</li>
                                            <li><i class="fa fa-check-square"></i>Nor again is there anyone who loves</li>
                                            <li><i class="fa fa-check-square-o"></i>Et harum quidem rerum facilis</li>
                                            <li><i class="fa fa-check-square-o"></i>At vero eos et accusamus et iusto odio</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-4 col-sm-6">
                                        <ul>
                                            <li><i class="fa fa-check-square"></i>Nor again is there anyone who loves</li>
                                            <li><i class="fa fa-check-square"></i>Nor again is there anyone who loves</li>
                                            <li><i class="fa fa-check-square-o"></i>Et harum quidem rerum facilis</li>
                                            <li><i class="fa fa-check-square-o"></i>At vero eos et accusamus et iusto odio</li>
                                        </ul>
                                    </div>
                                </div><!-- /.row -->
                            </div>
                        </div>
                    </div><!-- /.row -->
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="skill-shortcode">
                        
                                <!-- Progress Bar -->
                                <div class="skill">
                                    <p>Web Design</p>          
                                    <div class="progress">         
                                        <div class="progress-bar" role="progressbar"  data-percentage="60">
                                            <span class="progress-bar-span" >60%</span>
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>  
                                </div>

                                <!-- Progress Bar -->
                                <div class="skill">
                                    <p>HTML & CSS</p>          
                                    <div class="progress">         
                                        <div class="progress-bar" role="progressbar"  data-percentage="95">
                                            <span class="progress-bar-span" >95%</span>
                                            <span class="sr-only">95% Complete</span>
                                        </div>
                                    </div>  
                                </div>

                                <!-- Progress Bar -->
                                <div class="skill">
                                    <p>Wordpress</p>          
                                    <div class="progress">         
                                        <div class="progress-bar" role="progressbar"  data-percentage="80">
                                            <span class="progress-bar-span" >80%</span>
                                            <span class="sr-only">80% Complete</span>
                                        </div>
                                    </div>  
                                </div>

                                <!-- Progress Bar -->
                                <div class="skill">
                                    <p>Joomla</p>          
                                    <div class="progress">         
                                        <div class="progress-bar" role="progressbar"  data-percentage="100">
                                            <span class="progress-bar-span" >100%</span>
                                            <span class="sr-only">100% Complete</span>
                                        </div>
                                    </div>  
                                </div>

                                <!-- Progress Bar -->
                                <div class="skill">
                                    <p>Extension</p>          
                                    <div class="progress">         
                                        <div class="progress-bar" role="progressbar"  data-percentage="70">
                                            <span class="progress-bar-span" >70%</span>
                                            <span class="sr-only">70% Complete</span>
                                        </div>
                                    </div>  
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="custom-tab">
                        
                                <ul class="nav nav-tabs nav-justified" role="tablist">
                                    <li class="active"><a href="#tab-1" role="tab" data-toggle="tab">Our Mission</a></li>
                                    <li><a href="#tab-2" role="tab" data-toggle="tab">Our Vission</a></li>
                                    <li><a href="#tab-3" role="tab" data-toggle="tab">Company History</a></li>
                                </ul>

                                <div class="tab-content">

                                    <div class="tab-pane active" id="tab-1">
                                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>
                                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
                                     </div>


                                    <div class="tab-pane" id="tab-2">
                                        <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>
                                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
                                    </div>


                                    <div class="tab-pane" id="tab-3">
                                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
                                    </div>

                                </div><!-- /.tab-content -->

                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        <!-- End Report Section -->
        
        
                
    </body>
    
</html>
