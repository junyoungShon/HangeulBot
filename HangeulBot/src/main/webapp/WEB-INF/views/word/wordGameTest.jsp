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
		<!-- Bootstrap Core CSS -->
        <link href="${initParam.root}bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<script src="${initParam.root}bootstrap/js/bootstrap.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="js/modernizr.custom.js"></script>
		<script src="js/jquery.cbpFWSlider.js"></script>
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
	</style>
	<script>
		function getBluetoothInfo(macAdreess){
			$('#MacAddress').val(macAdreess);
			$('#connectStatus').val("connected");
			alert('블루투스 연결이 정상적으로 이루어졌습니다.');
		}
		function lostConnection(){
			alert('연결이실패하였습니다.');
		}
		$(document).ready(function() {
			//안드로이드 앱이 맞다면 아래 내용 실행 (블루투스 온!)
			window.HangeulBotAndroidAPP.turnOnbluetooth();
			
			
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
		
		var timeLimitForAnswer = 60;
		var deadline = new Date(Date.parse(new Date()) + timeLimitForAnswer * 1000);


		
		var startTime = 0;
		var endTime = 0;
		var i = 0;
		var totalStudyTime = 0;
		
		function submitAnswer() {
			
			if(i==9) {
				loaction.href = "#myModal";
				return;
			}
			
			clearInterval(timeinterval);
			deadline = new Date(Date.parse(new Date()) + timeLimitForAnswer * 1000);
			initializeClock('clockdiv', deadline);
			
			var dateInfo = new Date();
			endTime = dateInfo.getTime();
			
			var isCorrect;
			
			if($("input[name=input]").val()==$("input[name=word_"+i+"]").val()) {
				isCorrect = 1;
			} else {
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
			
			$("input[name=input]").val("").focus();
			
			$('.cbp-fwnext').click();
			startTime = dateInfo.getTime();
			i++;
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
							<img width="35%" style="margin : 30px; border: 1px solid grey; max-height:400px;" src="images/wordList/${questionList.word}.jpg" alt="${questionList.word}"/>
							<img width="45%" style="margin : 30px; max-height:400px;" src="images/wordList/${questionList.word}_가이드.png" alt="${questionList.word}_가이드"/>
							<input type="hidden" name="word_${status.index}" value="${questionList.word}">
							<input type="hidden" name="wordId_${status.index}" value="${questionList.wordId}">
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
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
		</div>
		      
        <div class="bluetoothConnectInterface" style="text-align: center">
        	한글봇 MAC : <input type="text" id="MacAddress" value="notConnected" readonly="readonly">
        	가장 최근 보낸 문자열 : <input type="text" id="latestMSG" value="notConnected" readonly="readonly">
        	연결 상태 : <input type="text" id="connectStatus" value="notConnected" readonly="readonly">
        	<button onclick="turnOnbluetooth()" value="연결">연결</button>
        </div>
		<div class="modal fade" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Modal title</h4>
		      </div>
		      <div class="modal-body">
		        <p>One fine body&hellip;</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
	</body>
</html>
