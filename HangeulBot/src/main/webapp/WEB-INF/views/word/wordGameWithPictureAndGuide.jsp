<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<meta name="description" content="Blueprint: " />
		<meta name="keywords" content="" />
		<meta name="author" content="Codrops" />
		<title>재미있는 한글 블럭 놀이! 한글봇</title>
		
		<!-- CSS -->
        <link href="${initParam.root}bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="${initParam.root}css/default.css" />
		<link rel="stylesheet" type="text/css" href="${initParam.root}css/component.css" />
		<link rel="stylesheet" type="text/css" href="${initParam.root}css/style.css" />
		
		<!-- JavaScript & JQuery -->
		<script src="${initParam.root}js/jquery-2.1.1.min.js"></script>
		<script src="${initParam.root}js/jqBootstrapValidation.js"></script>
		<script src="${initParam.root}http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="${initParam.root}js/modernizr.custom.js"></script>
		<script src="${initParam.root}js/jquery.cbpFWSlider.js"></script>
		<script src="${initParam.root}bootstrap/js/bootstrap.js"></script>
		<script src="${initParam.root}js/jquery.flip.js"></script>
	</head>
	<style type="text/css">
		#clockdiv{
		    font-family: sans-serif;
		    color: #fff;
		    display: inline-block;
		    font-weight: 100;
		    text-align: center;
		    font-size: 30px;
		}
		
		#clockdiv > div{
		    padding: 10px;
		    border-radius: 3px;
		    background: #00BF96;
		    display: inline-block;
		}
		
		#clockdiv div > span{
		    padding: 15px;
		    border-radius: 3px;
		    background: #00816A;
		    display: inline-block;
		}
		
		.smalltext{
		    padding-top: 5px;
		    font-size: 16px;
		}
		
		.resultAnswer {
			display: none;
			z-index: 100;
		}
	</style>
	<script>
	
		$(document).ready(function() {
			
			$(".card").flip();
			
			/*
				- how to call the plugin:
				$( selector ).cbpFWSlider( [options] );
				- options:
				{
					// default transition speed (ms)
					speed : 500,
					// default transition easing
					easing : 'ease'
				}
				- destroy:
				$( selector ).cbpFWSlider( 'destroy' );
			*/
	
			$( '#cbp-fwslider' ).cbpFWSlider();
			var dateInfo = new Date();
			startTime = dateInfo.getTime();
			
			initializeClock('clockdiv', deadline);
		});
		
		
		
		function getTimeRemaining(endtime) {
		  var t = Date.parse(endtime) - Date.parse(new Date());
		  var seconds = Math.floor((t / 1000) % 60);
		  return {
		    'total': t,
		    'seconds': seconds
		  };
		}

		
		var timeinterval;
		
		function initializeClock(id, endtime) {
		  var clock = document.getElementById(id);
		  var secondsSpan = clock.querySelector('.seconds');
		  
		  function updateClock() {
		    var t = getTimeRemaining(endtime);

		    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

		    if (t.total <= 0) {
		      clearInterval(timeinterval);
		      submitAnswer();
		    }
		  }

		  updateClock();
		  timeinterval = setInterval(updateClock, 1000);
		}
		
		//문제 제한시간 설정 - 60초 넘어가게 수정할것
		var timeLimitForAnswer = 60;
		var deadline = new Date(Date.parse(new Date()) + timeLimitForAnswer * 1000);

		function openRegisterModal(){
			$('#regist-modal').modal();
		}
		
		var startTime = 0;
		var endTime = 0;
		var i = 0;
		var totalStudyTime = 0;
		
		function submitAnswer() {
			
			clearInterval(timeinterval);
			deadline = new Date(Date.parse(new Date()) + timeLimitForAnswer * 1000);
			initializeClock('clockdiv', deadline);
			
			var dateInfo = new Date();
			endTime = dateInfo.getTime();
			
			var isCorrect;
			
			if($("input[name=input]").val()==$("input[name=word_"+i+"]").val()) {
				$('#correct').css('display', 'block');
				isCorrect = 1;
			} else {
				$('#wrong').css('display', 'block');
				isCorrect = 0;
			}
			
			var spendTime = (endTime-startTime)/1000;
			spendTime = Math.round(spendTime);
			
			$.ajax({
				type: "POST",
				url: "${initParam.root}submitAnswerInWordgame.do",
				data: "memberEmailId=${sessionScope.loginUserInfo.memberEmailId}"
						+"&isCorrect="+isCorrect
						+"&spendTime="+spendTime
						+"&word="+$("input[name=word_"+i+"]").val()
						+"&wordId="+$("input[name=wordId_"+i+"]").val(),
				cache: false,
				success: function(){
				},
				error:function(request,status,error){
		        	//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
			if(i==9) {
				
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
			
			$(".answerResult").css("display", "none");
			
			$("input[name=input]").val("").focus();
			
			$('.cbp-fwnext').click();
			startTime = dateInfo.getTime();
			i++;
		}
		
		
		function replay() {
			location.href = "${initParam.root}member_goWordGame.do";
		}
		
		function goToMain() {
			location.href = "${initParam.root}index.do";
		}
		
	</script>
	<body>
		<div class="container">
			<header class="clearfix">
				<a href="${initParam.root}index.do">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
					<span>한글봇</span>
				</a>
				<h1>낱말 맞추기</h1>
				<nav>
					<a href="#" class="icon-arrow-left" data-info="메인화면으로">Previous Blueprint</a>
					<a href="#" class="icon-drop" data-info="?">back to the Codrops article</a>
				</nav>
			</header>
			<div id="cbp-fwslider" class="cbp-fwslider" style="max-height:500px;">
				<ul>
				  	<c:forEach items="${requestScope.questionList}" var="questionList" varStatus="status">
						<li align="center" valign="middle">
							<!-- <img class="answerResult" id="correct" width="71%" src="images/correct.gif" alt="정답!"/>
							<img class="answerResult" id="wrong" width="23%" src="images/wrong.png" alt="오답!"/> -->
							<h3>단어 난이도 : ${questionList.wordGrade}</h3>
							<img width="35%" style="margin:30px; border: 1px solid grey; max-height:400px;" src="images/wordList/${questionList.word}.jpg" alt="${questionList.word}"/>
							<img width="45%" style="margin:30px; max-height:400px;" src="images/wordList/${questionList.word}_가이드.png" alt="${questionList.word}_가이드"/>
							<input type="hidden" name="word_${status.index}" value="${questionList.word}">
							<input type="hidden" name="wordId_${status.index}" value="${questionList.wordId}">
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<%-- <div class="card" style="margin:50px; z-index:100;">
		  <div class="front"> 
		    Front content
			<img width="35%" style="margin:30px; border: 1px solid grey; max-height:400px;" src="images/wordList/${questionList.word}.jpg" alt="${questionList.word}"/>
		  </div>
		  <div class="back">
		    Back content
			<img width="45%" style="margin:30px; max-height:400px;" src="images/wordList/${questionList.word}_가이드.png" alt="${questionList.word}_가이드"/>
		  </div>
		</div> --%>
		<div align="center">
			<div id="clockdiv">
				<div>
				    <span class="seconds"></span>
				</div>
			</div>
		</div>
		<br><br>
		<div align="center">
			<input type="text" name="input" onkeydown="javascript: if (event.keyCode == 13) {submitAnswer();}">
			<input type="button" value="제출" onclick="submitAnswer()">
			<input type="button" value="뒤집기" onclick="flip()">
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
        <!-- End Regist Section -->
		
	</body>
</html>
