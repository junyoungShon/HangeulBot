<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <title>Fullscreen Slit Slider with CSS3 and jQuery</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Fullscreen Slit Slider with CSS3 and jQuery" />
        <meta name="keywords" content="slit slider, plugin, css3, transitions, jquery, fullscreen, autoplay" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        		<!-- CSS -->
        <link href="${initParam.root}bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${initParam.root}css/demoWordGame.css" />
        <link rel="stylesheet" type="text/css" href="${initParam.root}css/styleWordGame.css" />
        <link rel="stylesheet" type="text/css" href="${initParam.root}css/customWordGame.css" />
        <link rel="stylesheet" type="text/css" href="${initParam.root}css/reset.css" />
<!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
        <!-- Custom CSS -->
        <link href="${initParam.root}css/style.css" rel="stylesheet">
	
        <!-- Custom Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
		<script type="text/javascript" src="${initParam.root}js/modernizr.WordGame.79639.js"></script>
		 		<link rel="stylesheet" type="text/css" href="${initParam.root}css/component.css" />
		<script src="${initParam.root}js/modernizr.js"></script> <!-- Modernizr -->
		<noscript>
			<link rel="stylesheet" type="text/css" href="${initParam.root}css/styleNoJS.css" />
		</noscript>
    	<style type="text/css">
    		.sl-slide-inner{
    			 	background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("${initParam.root}images/wordList/가수.jpg");
				    background-image: -moz-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("${initParam.root}images/wordList/가수.jpg");
				    background-image: -o-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("${initParam.root}images/wordList/가수.jpg");
				    background-image: -ms-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("${initParam.root}images/wordList/가수.jpg");
				    background-image: -webkit-gradient(linear, left top, left bottom, from(rgba(0, 0, 0, 0.5)), to(rgba(0, 0, 0, 0.5))), url("${initParam.root}images/wordList/가수.jpg");
				    background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("${initParam.root}images/wordList/가수.jpg");
    		}
    		.blockImg{
    		 height : 30%; 
			  overflow : auto; 
			  margin : auto; 
			  position : absolute; 
			  top : 0; left : 0;  bottom : 0; right : 0; 
    		}
    	</style>
    </head>
    
    <body>
        
        <div class="container demo-1">
		
			<!-- Codrops top bar -->
            <div class="codrops-top clearfix">
                <a href="http://tympanus.net/Tutorials/CSS3BouncingBall/">
                    <strong>&laquo; Main </strong>메인으로 돌아갑니다.
                </a>
                    <input type="text" id="answer" value=""/>
                    <input type="button" id="answerSubmit" value="전송"/>
                    <input type="button" id="answerSubmit1" value="전송1"/>
                <span class="right">
                    <a href="http://tympanus.net/codrops/?p=9357">
                        <strong>학습을 중단합니다.</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->

        
            <div id="slider" class="sl-slider-wrapper">
				<div class="sl-slider" >
				<c:forEach items="${requestScope.questionList}" var="questionList" varStatus="status">
					<div class="sl-slide questionSlide" data-orientation="vertical" data-slice1-rotation="10" 
					data-slice2-rotation="-45" data-slice1-scale="2" data-slice2-scale="2" >
						<div class="sl-slide-inner" 
						style=
					"background-size:cover;background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('${initParam.root}images/wordList/${questionList.word}.jpg');
				    background-image: -moz-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('${initParam.root}images/wordList/${questionList.word}.jpg');
				    background-image: -o-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('${initParam.root}images/wordList/${questionList.word}.jpg');
				    background-image: -ms-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('${initParam.root}images/wordList/${questionList.word}.jpg');
				    background-image: -webkit-gradient(linear, left top, left bottom, from(rgba(0, 0, 0, 0.5)), to(rgba(0, 0, 0, 0.5))), url('${initParam.root}images/wordList/${questionList.word}.jpg');
				    background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('${initParam.root}images/wordList/${questionList.word}.jpg');">
							<img class="blockImg"src="images/wordList/${questionList.word}_가이드.png" alt="${questionList.word}_가이드"/>
							<input type="hidden" name="word_${status.index}" value="${questionList.word}">
							<input type="hidden" name="wordId_${status.index}" value="${questionList.wordId}">
							${status.index}
						</div>
					
					</div>
					</c:forEach>
					<div class="sl-slide correctSlide" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
						<div class="sl-slide-inner">
							<div class="deco" style="background-image: url(); backgroud-size:cover;">
								<img src="${initParam.root}images/참잘했어요.jpg" style="width:250px; height:250px; border-radius:300px;">
							</div>
							<h2>맞았다 임마</h2>
							<blockquote><p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p><cite>Albert Schweitzer</cite></blockquote>
						</div>
					</div>
					<div class="sl-slide wrongSlide" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
						<div class="sl-slide-inner">
							<div class="deco" style="background-image: url(); backgroud-size:cover;">
								<img src="${initParam.root}images/wrong.png" style="width:250px; height:250px; border-radius:300px;">
							</div>
							<h2>틀렸다 임마 다시간다</h2>
							<blockquote><p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p><cite>Albert Schweitzer</cite></blockquote>
						</div>
					</div>
					
				</div><!-- /sl-slider -->
				<input type="text" value="0" id="isCorrectStatus">
				<nav id="nav-arrows" class="nav-arrows">
					<span class="nav-arrow-prev">Previous</span>
					<span class="nav-arrow-next">Next</span>
				</nav>

					<!-- actual preloader -->
					<div class="loader">
						<div class="progress-bar"><div class="progress-stripes"></div><div class="percentage">0%</div></div>
					</div>
				

			</div><!-- /slider-wrapper -->
			 <!-- Start End Alert Section -->
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
		                            <h3>학습 완료!</h3>
		                            <!-- <p>아이의 학습 상황을 한 눈에 확인할 수 있습니다.</p> -->
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col-md-12" align="center" valign="middle">
		                            <img width="50%" style="margin : 30px;" src="images/참잘했어요.jpg" alt="참잘했어요!"/>
		                        </div>
		                        <div class="clearfix"></div>
		                        <div class="col-lg-12 text-center">
		                            <div id="success"></div>
		                            <button type="button" class="btn btn-primary" onclick="replay()">한 번 더 할래요!</button>
		                            <button type="button" class="btn btn-primary" onclick="goToMain()">그만할게요</button>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="audioSpace" style="display: none">
		      	   <audio id="succesAudio" style="width:25%" controls>Canvas not supported</audio>
		        	<input type="text" id="succesAudioFile" value="${initParam.root}soundEffect/success1.mp3" size="60" />
		      	   <audio id="retryAudio" style="width:25%" controls>Canvas not supported</audio>
		        	<input type="text" id="retryAudioFile" value="${initParam.root}soundEffect/retry.mp3" size="60" />
		        </div>
        <!-- End End Alert Section -->
        </div>
	     
        <script src="${initParam.root}js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${initParam.root}js/jquery.ba-cond.min.js"></script>
		<script type="text/javascript" src="${initParam.root}js/jquery.slitslider.js"></script>
		<script src="${initParam.root}bootstrap/js/bootstrap.js"></script>
		<script type="text/javascript">	
			var retryAudio =document.getElementById('retryAudio');
			retryAudio.src = document.getElementById('retryAudioFile').value;
		
			var succesAudio =document.getElementById('succesAudio');
			succesAudio.src = document.getElementById('succesAudioFile').value;
		
			var currentImageName = $("input[name=word_"+answerIndex+"]").val();
			var startTime = 0;
			var endTime = 0;
			var answerIndex = 0;
			var totalStudyTime = 0;
			function playEffectSound(soundName){
				var broswerInfo = navigator.userAgent;
				
				//위시룸 안드로이드 앱이 맞다면 아래 내용 실행
				window.HangeulBotAndroidAPP.playEffectSound(soundName);
			}
			$(function() {
				var Page = (function() {
					var $navArrows = $( '#nav-arrows' ),
						$nav = $( '#nav-dots > span' ),
						slitslider = $( '#slider' ).slitslider( {
							onBeforeChange : function( slide, pos ) {
								$nav.removeClass( 'nav-dot-current' );
								$nav.eq( pos ).addClass( 'nav-dot-current' );
							}
						} ),
						init = function() {
							initEvents();
						},
						initEvents = function() {
							// add navigation events
							$navArrows.children( ':last' ).on( 'click', function() {
								slitslider.next();
								return false;
							} );
							$navArrows.children( ':first' ).on( 'click', function() {
								slitslider.previous();
								return false;
							} );
							$nav.each( function( i ) {
								$( this ).on( 'click', function( event ) {
									var $dot = $( this );
									if( !slitslider.isActive() ) {
										$nav.removeClass( 'nav-dot-current' );
										$dot.addClass( 'nav-dot-current' );
									}
									slitslider.jump( i + 1 );
									return false;
								} );
							} );
							//정답이 변경되면 맞을 때는 2슬라이드로 틀렸을 때는 3 슬라이드로 이동시킨다.
							$('#answerSubmit').click(function(){
							
						currentImageName = $("input[name=word_"+answerIndex+"]").val();
							$('.sl-slide-inner').eq(answerIndex).css({
								'background-image': "linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)), url('${initParam.root}images/wordList/"+currentImageName+".jpg')",
								'background-image': "-moz-linear-gradient(top, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)),url('${initParam.root}images/wordList/"+currentImageName+".jpg')",
								'background-image': "-o-linear-gradient(top, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)),url('${initParam.root}images/wordList/"+currentImageName+".jpg')",
								'background-image': "-ms-linear-gradient(top, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)),url('${initParam.root}images/wordList/"+currentImageName+".jpg')",
								'background-image': "-webkit-gradient(linear, left top, left bottom, from(rgba(0, 0, 0, 0)),url('${initParam.root}images/wordList/"+currentImageName+".jpg')",
								'background-image': "-webkit-linear-gradient(top, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)),url('${initParam.root}images/wordList/"+currentImageName+".jpg')" 
							});
							$('.blockImg').eq(answerIndex).animate({height: '300px', opacity: '0.4'}, "slow");
							$('.blockImg').eq(answerIndex).animate({height: '150px', opacity: '0.4'}, "slow");
							$('.blockImg').eq(answerIndex).animate({height: '300px', opacity: '0.4'}, "slow");
							$('.blockImg').eq(answerIndex).animate({height: '150px', opacity: '0.4'}, "slow");
							$('.blockImg').eq(answerIndex).animate({height: '0px', opacity: '0.4'}, "slow");
							setTimeout( function() {
								currentImageName = $("input[name=word_"+answerIndex+"]").val();
								$('.sl-slide-inner').eq(answerIndex).css({
									'background-image': "linear-gradient(to bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('${initParam.root}images/wordList/"+currentImageName+".jpg')",
									'background-image': "-moz-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),url('${initParam.root}images/wordList/"+currentImageName+".jpg')",
									'background-image': "-o-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),url('${initParam.root}images/wordList/"+currentImageName+".jpg')",
									'background-image': "-ms-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),url('${initParam.root}images/wordList/"+currentImageName+".jpg')",
									'background-image': "-webkit-gradient(linear, left top, left bottom, from(rgba(0, 0, 0, 0.5)),url('${initParam.root}images/wordList/"+currentImageName+".jpg')",
									'background-image': "-webkit-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),url('${initParam.root}images/wordList/"+currentImageName+".jpg')" 
								});
								$('.blockImg').eq(answerIndex).animate({height: '250px', opacity: '1.0'}, "slow");
								$('.blockImg').eq(answerIndex).css('src','${initParam.root}images/wordList/"'+currentImageName+'"_가이드.png")');
								
								
								
								console.log('현재 슬라이드 '+answerIndex);
								//정답이 맞았을 경우 
								if($('#isCorrectStatus').val()==1){
									$('.loader').css('display','none');
									
									slitslider.jump(11);
									//succesAudio.play();
									playEffectSound("success");
									setTimeout( function() {
										slitslider.jump(answerIndex+1);
										if(answerIndex==9) {
											$.ajax({
												url: "${initParam.root}updateTotalStudyTimeAndMemberBabyGrade.do",
												data: "memberEmailId=${sessionScope.loginUserInfo.memberEmailId}",
												cache: false,
												success: function(){
												},
												error:function(request,status,error){
										        	//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
												}
											});
											openRegisterModal();
											return;
										}
										$progress.animate({
											width:(answerIndex+1)*10+"%"
										}, 2000, function() {
											$percent.text(10*(answerIndex+1)+"%");
											
											clearInterval(calcPercent);
											clearInterval(stripesAnim);
										});
										$('.loader').css('display','block');
									},3000);
									answerIndex++;
								//오답일 경우
								}else{
									$('.loader').css('display','none');
									slitslider.jump(12);
									playEffectSound("retry");
									//retryAudio.play();
									setTimeout( function() {
										slitslider.jump(answerIndex+1);
										$('.loader').css('display','block');
										if(answerIndex==9) {
											$.ajax({
												url: "${initParam.root}updateTotalStudyTimeAndMemberBabyGrade.do",
												data: "memberEmailId=${sessionScope.loginUserInfo.memberEmailId}",
												cache: false,
												success: function(){
												},
												error:function(request,status,error){
										        	//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
												}
											});
											openRegisterModal();
											return;
										}
									},3000);
								}
								
								
								
								console.log('현재 슬라이드 '+answerIndex);
								$('#isCorrectStatus').val('noSubmit');
						    }, 3000); 
								
								
							});
						};
						return { init : init };
				})();

				Page.init();
			});
			/* SET RANDOM LOADER COLORS FOR DEMO PURPOSES */	
			
			setSkin("green");
			

		
			// Stripes interval
			var stripesAnim;
			var calcPercent;
			
			$progress = $('.progress-bar');
			$percent = $('.percentage');
			$stripes = $('.progress-stripes');
			$stripes.text('////////////////////////');
			
			/* CHANGE LOADER SKIN */
			$('.skin').click(function(){
				var whichColor = $(this).attr('id');
				setSkin(whichColor);
			});
			
			// Call function to load array of images
			preload();
			
			// Call function to animate stripes
			stripesAnimate(); 
			
			/* WHEN LOADED */
			$(window).load(function() {
				loaded = true;
				$progress.animate({
					width: "0%"
				}, 2000, function() {
					$percent.text('0%');
					clearInterval(calcPercent);
					clearInterval(stripesAnim);
				});
			});
			
			/*** FUNCTIONS ***/
			
			/* LOADING */
			function preload() {
				
				calcPercent = setInterval(function() {
					
					//loop through the items
					$percent.text(Math.floor(($progress.width() / $('.loader').width()) * 100) + '%');
					
				});
			}
			
			/* STRIPES ANIMATION */
			function stripesAnimate() {
				animating();
				stripesAnim = setInterval(animating, 2500);
			}

			function animating() {
				$stripes.animate({
					marginLeft: "-=30px"
				}, 2500, "linear").append('/');
			} 
			
			function setSkin(skin){
				$('.loader').attr('class', 'loader '+skin);
				
			}
			$(document).ready(function() {
				//안드로이드 앱이 맞다면 아래 내용 실행 (블루투스 온!)
				//window.HangeulBotAndroidAPP.turnOnbluetooth();
				var dateInfo = new Date();
				startTime = dateInfo.getTime();
				$('#answerSubmit1').click(function(){
					submitAnswer($('#answer').val());
				});
			});
			function openRegisterModal(){
				$('#regist-modal').modal();
			}
			
			
			
			function submitAnswer(userInputAnswer) {
				var dateInfo = new Date();
				endTime = dateInfo.getTime();
				var isCorrect;
				//alert('현재답'+$("input[name=word_"+answerIndex+"]").val());
				//alert('사용자의 입력값'+userInputAnswer);
				if(userInputAnswer==$("input[name=word_"+answerIndex+"]").val()) {
					$('#correct').css('display', 'block');
					isCorrect = 1;
					$('#isCorrectStatus').val(1);
					$('#answerSubmit').click();
				} else {
					$('#wrong').css('display', 'block');
					isCorrect = 0;
					$('#isCorrectStatus').val(0);
					$('#answerSubmit').click();
				}
				var spendTime = (endTime-startTime)/1000;
				spendTime = Math.round(spendTime);
				$.ajax({
					type: "POST",
					url: "${initParam.root}submitAnswerInWordgame.do",
					data: "memberEmailId=${sessionScope.loginUserInfo.memberEmailId}"
							+"&isCorrect="+isCorrect
							+"&spendTime="+spendTime
							+"&word="+$("input[name=word_"+answerIndex+"]").val()
							+"&wordId="+$("input[name=wordId_"+answerIndex+"]").val(),
					cache: false,
					success: function(){
					},
					error:function(request,status,error){
			        	//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
				
				startTime = dateInfo.getTime();
				
			}
			
		</script>
			<!-- 곻통부분 시작 -네비게이션 버튼  -->
     <div class="component">
				<!-- Start Nav Structure -->
				<button class="cn-button" id="cn-button">-</button>
				<div class="cn-wrapper opened-nav" id="cn-wrapper">
				    <ul>
				      <li><a href="${initParam.root}index.do"><span class="fa fa-arrow-up"></span></a></li>
				       <li class="bluetoothBtn"><a href="#" class="connectInfo"><h4>연결필요</h4><span class="fa fa-bluetooth"></span></a></li>
				      <li><a href="${initParam.root}index.do"><span class="fa fa-home"></span></a></li>
				      <li><a href="#"><span class="fa fa-bar-chart"></span></a></li>
				      <li><a href="${initParam.root}logout.do"><span class="fa fa-sign-out"></span></a></li>
				     </ul>
				</div>
				<div id="cn-overlay" class="cn-overlay on-overlay"></div>
				<!-- End Nav Structure -->
			</div>
          <!-- Javascript & jQuery -->
       
       
       <script src="${initParam.root}js/script.js"></script>
       <script src="${initParam.root}js/jquery.appear.js"></script>
        

      
    <script src="${initParam.root}js/main.js"></script> <!-- Resource jQuery -->
    <script src="${initParam.root}js/polyfills.js"></script> <!-- Resource jQuery -->
    <script src="https://npmcdn.com/flickity@1.2/dist/flickity.pkgd.min.js"></script>
        <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- 블루투스 관련 스크립트 -->
		<script type="text/javascript">
		$(document).ready(function(){
			var broswerInfo = navigator.userAgent;
			/*var bluetoothConnectionStatus = */
			if(broswerInfo.indexOf("HangeulBotAndroidAPP")>-1){
				//페이지 로딩 시 블루투스 상태를 체크하고 Componenet를 수정해준다
				checkBluetoothState();
			}else{
				alert("앱으로 접속하지 않으셨습니다. 정상적인 사용이 불가능합니다.");
			}
			
			
			$('.bluetoothBtn').click(function(){
				if($('.connectInfo').text()=='연결양호'){
					if(confirm('이미 블루투스가 연결된 상태입니다!\n 연결을 종료하시겠습니까?')){
						//블루투스 연결 종료
					};
				}else if($('.connectInfo').text()=='연결필요'){
					turnOnbluetooth();
					$('.connectInfo').html('<h4>연결중..</h4><span class="fa fa-bluetooth"></span>');
				}
				
			})
			
			
		});
		function bluetoothDisconnected(){
			alert('블루 투스 연결이 해제되었습니다.');
			$('.connectInfo').html('<h4>연결필요</h4><span class="fa fa-bluetooth"></span>');
		}
		function checkBluetoothState(){
			window.HangeulBotAndroidAPP.checkBluetoothState();
		}
		function returnBtState(btState){
			if(btState=='disConnect'){
				$('.connectInfo').html('<h4>연결필요</h4><span class="fa fa-bluetooth"></span>');
				alert('한글봇 하드웨어와 연동되지 않은 경우 이용이 불가합니다. 메인으로 돌아갑니다.');
				location.href='${initParam.root}index.do';
			}else{
				$('.connectInfo').html('<h4>연결양호</h4><span class="fa fa-bluetooth"></span>');
			}
		}
		function turnOnbluetooth(){
			window.HangeulBotAndroidAPP.turnOnbluetooth();
		}
		function getBluetoothMsg(Msg){
			$('#latestMSG').val(Msg);
			$('#connectStatus').val("connected");
		}
		function getBluetoothInfo(macAdreess){
			$('#MacAddress').val(macAdreess);
			$('#connectStatus').val("connected");
			alert('블루투스 연결이 정상적으로 이루어졌습니다.');
			$('.connectInfo').html('<h4>연결양호</h4><span class="fa fa-bluetooth"></span>');
		}
		function lostConnection(){
			alert('연결이실패하였습니다.');
		}
		</script>
	</body>
</html>