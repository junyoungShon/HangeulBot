<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <title>한글봇 동물농장-1</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Fullscreen Slit Slider with CSS3 and jQuery" />
        <meta name="keywords" content="slit slider, plugin, css3, transitions, jquery, fullscreen, autoplay" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        		<!-- CSS -->
        <link href="${initParam.root}bootstrap/css/bootstrap.min.css" rel="stylesheet">
		        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="${initParam.root}css/component.css" />
		<script src="${initParam.root}js/modernizr.js"></script> <!-- Modernizr -->
	    <link rel="stylesheet" href="https://npmcdn.com/flickity@1.2/dist/flickity.min.css">
    	<style type="text/css">
    		.wrapper { 
				background: url(${initParam.root}images/veneziaGame/veneziaBg.gif) no-repeat center center fixed; 
				-webkit-background-size: cover;
				-moz-background-size: cover;
				-o-background-size: cover;
				background-size: cover;
				color : black;
			}
			body {
			    margin: 0px;
			    overflow: hidden;
			}
			.gameSpace{
				width : 800px;
				height : 650px;
				margin : 0 auto;
				position: relative;
				left:0px;
			}
			.question{
				width : 400px;
				height : 150px;
				position:absolute;
				top:-150px;
				left:200px;
			
			}
			.wordImg{
				display: none;
				height : 150px;
				border-radius: 50px;
			}
    	</style>
    </head>
    
    <body>
       <div class="wrapper">
       		<div class="gameSpace">
       		<c:forEach items="${requestScope.questionList}" var="questionList" varStatus="status">
       			<div class="question" id="question${status.index}">
       				<img height="150px" class="guideImg" src="${initParam.root }images/wordList/${questionList.word}_가이드.png" alt="${questionList.word}_가이드"/>
       				<img height="150px" class="wordImg" src="${initParam.root }images/wordList/${questionList.word}.jpg" alt="${questionList.word}"/>
					<input type="hidden" name="word_${status.index}" value="${questionList.word}" id="word_${status.index}" class="wordAnswer">
					<input type="hidden" name="wordId_${status.index}" value="${questionList.wordId}">
       			</div>
       		</c:forEach>
       		</div>
       		<button onclick="submitAnswer(false)" vlaue="">오답</button>
       		<button onclick="submitAnswer(true)" value="정답전송">정답</button>
       </div>
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
			
			
		<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
		<script src="${initParam.root}bootstrap/js/bootstrap.js"></script>
		  <script src="${initParam.root}js/script.js"></script>
        <script src="${initParam.root}js/jquery.appear.js"></script>
    <script src="${initParam.root}js/main.js"></script> <!-- Resource jQuery -->
    <script src="${initParam.root}js/polyfills.js"></script> <!-- Resource jQuery -->
		<script>
		var questionList = [];
		<c:forEach items="${requestScope.questionList}" var="questionList" varStatus="status">
			questionList.push({"word":"${questionList.word}","wordId":"${questionList.wordId}"})
		</c:forEach>
		$(document).ready(function(){
			$('.wrapper').css('width',$(window).width());
			$('.wrapper').css('height',$(window).height());
			//$('.gameSpace').css('left',(($(window).width()-800)/2))
			var question = $('.question');
			for(var i=0;i<$('.question').length;i++){
				if(i%2==0){
					$('.question').eq(i).css('left',Math.floor(Math.random() * 200)+"px")
				}else{
					$('.question').eq(i).css('left',Math.floor((Math.random() * 400-Math.random() * 200))+"px");
				}
			}
			  
			moveOddWordToBottom(0);
			moveEvenWordToBotton(1);
		});
		
		//단어 내려오는 애니메이션 함수
		function moveOddWordToBottom(index){
			$('.question').eq(index).addClass("activeAnswer");
			$('.question').eq(index).animate({top:"500px"}, 40000, function(){
				$('.question').eq(index).css('display','none');
				$('.question').eq(index).removeClass("activeAnswer");
				index = index +2;
				if(index<10){
					moveOddWordToBottom(index);
				}
			});
		}
		function moveEvenWordToBotton(index){
			$('.question').eq(index).addClass("activeAnswer");
			$('.question').eq(index).animate({top:"500px"}, 60000, function(){
				$('.question').eq(index).css('display','none');
				$('.question').eq(index).removeClass("activeAnswer");
				index = index +2;
				if(index<10){
					moveEvenWordToBotton(index);
				}
			});
		}
		function submitAnswer(isCorrect){
			var userAnswer = $('#userAnser').val();
			for(var i=0;i<$('.activeAnswer').length;i++){
				if($('.activeAnswer').eq(i).children('.wordAnswer').val() == userAnswer || isCorrect==true){
						$('.activeAnswer').eq(i).children('.guideImg').hide(1000,function(){
					});
					$('.activeAnswer').eq(i).children('.wordImg').show(2000,'swing',function(){
						/* $('.activeAnswer').eq(i).children('.wordImg').animate({height:"600px"},function(){
							
						}) */
					});
					setTimeout(function(){
						$('.activeAnswer').eq(i).children('.wordImg').hide();
						$('.activeAnswer').eq(i).removeClass("activeAnswer");
					},4000)
				}
			}
		}
		function showAnswerImage(index){
			
		}
		</script>
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
				//location.href='${initParam.root}index.do';
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