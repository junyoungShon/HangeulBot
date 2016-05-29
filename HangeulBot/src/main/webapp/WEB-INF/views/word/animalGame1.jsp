<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        <link href="${initParam.root}bootstrap/css/shaker.css" rel="stylesheet">
        <link href="${initParam.root}bootstrap/css/reset.css" rel="stylesheet">
         <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
        <!-- Custom CSS -->
        <link href="${initParam.root}css/style.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
		
  
   		<link rel="stylesheet" type="text/css" href="${initParam.root}css/component.css" />
		<script src="${initParam.root}js/modernizr.js"></script> <!-- Modernizr -->
    	<style type="text/css">
    		.wrapper { 
				background: url(${initParam.root}images/animalGame1/배경.png) no-repeat center center fixed; 
				-webkit-background-size: cover;
				-moz-background-size: cover;
				-o-background-size: cover;
				background-size: cover;
			}
			.questionImage{
				display: inline;
				width : 25%;
				margin-left :3%;
			
			}
			#pigImage img{
				 position:absolute;
				  left:0;
				  -webkit-transition: opacity 1s ease-in-out;
				  -moz-transition: opacity 1s ease-in-out;
				  -o-transition: opacity 1s ease-in-out;
				  transition: opacity 1s ease-in-out;
			}
			.guideImage{
				padding-top :2%;
				margin-left :15%;
				height : 230px;
				width: auto;
			}
			body {
			  
			    margin: 0px;
			    overflow: hidden;
			}
    	</style>
    </head>
    
    <body>
        <div class="wrapper">
        	<div class="guideImage">
        		<img alt="pig" src="${initParam.root}images/animalGame1/돼지_가이드.png" class="guideImage">
        	</div>
        	<div class="questionImage pigImage">
        		<img alt="pig" src="${initParam.root}images/animalGame1/돼지_검은색.png" class="questionImage pig shake-slow shake-constant">
        		<input type="text" name="word_0" value="돼지" style="display:none">
        	</div>
        	<div class="questionImage dogImage">
        		<img alt="dog" src="${initParam.root}images/animalGame1/개_검은색.png" class="questionImage dog">
        		<input type="text" name="word_1" value="개" style="display:none">
        	</div>
        	<div class="questionImage sheepImage">
        		<img alt="sheep" src="${initParam.root}images/animalGame1/양_검은색.png" class="questionImage sheep">
        		<input type="text" name="word_2" value="양" style="display:none">
        	</div>
        	<input type="button" id="answerSubmit" value="정답">
        	<input type="button" id="wrongAnswerSubmit" value="오답">
        </div>
      	
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script src="${initParam.root}bootstrap/js/bootstrap.js"></script>
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
       
        <script src="${initParam.root}js/jquery-2.1.1.min.js"></script>
        <script src="${initParam.root}js/script.js"></script>
        <script src="${initParam.root}js/jquery.appear.js"></script>
        

      
    <script src="${initParam.root}js/main.js"></script> <!-- Resource jQuery -->
    <script src="${initParam.root}js/polyfills.js"></script> <!-- Resource jQuery -->
		<script>
			function playEffectSound(soundName){
				var broswerInfo = navigator.userAgent;
				//위시룸 안드로이드 앱이 맞다면 아래 내용 실행
				
				window.HangeulBotAndroidAPP.playEffectSound(soundName);
			}
			var answerIndex = 0;
			$(document).ready(function(){
				$('.wrapper').css('width',$(document).width());
				$('.wrapper').css('height',$(document).height());
				playEffectSound("bgmusic");
			});
			$('#answerSubmit').click(function(){
				if(answerIndex==0){
					submitAnswer('돼지');
				}else if(answerIndex==1){
					submitAnswer('개');
				}else if(answerIndex==2){
					submitAnswer('양');
				}
				
			});
			$('#wrongAnswerSubmit').click(function(){
					submitAnswer('꿀');
				
			});
			function submitAnswer(userInputAnswer) {
				var dateInfo = new Date();
				endTime = dateInfo.getTime();
				var isCorrect;
				
				if(userInputAnswer==$("input[name=word_"+answerIndex+"]").val()) {
					isCorrect = 1;
					//돼지일 경우
					if(answerIndex==0){
						$('.pig').removeClass('shake-constant');
						$('.pig').removeClass('shake-slow');
						$('.guideImage').animate({opacity:'0'},1000,function(){
							$(".guideImage").attr('src','${initParam.root}images/animalGame1/개_가이드.png');
							$(".guideImage").animate({opacity: '1'},2000);
							playEffectSound("pig");
						});
						$('.pig').animate({opacity:'0'},1000,function(){
							$(".pig").attr('src','${initParam.root}images/animalGame1/돼지_컬러.png');
							$(".pig").animate({opacity: '1'},2000);
							$('.guideImage').css('padding-top','2%')
							$('.guideImage').css('margin-left','18%')
							
							$('.dog').addClass('shake-constant');
							$('.dog').addClass('shake-slow');
						});
						
					//개일 경우
					}else if(answerIndex==1){
						$('.dog').removeClass('shake-constant');
						$('.dog').removeClass('shake-slow');
						$('.guideImage').animate({opacity:'0'},1000,function(){
							$(".guideImage").attr('src','${initParam.root}images/animalGame1/양_가이드.png');
							$(".guideImage").animate({opacity: '1'},2000);
							playEffectSound("dog");
						});
						$('.dog').animate({opacity:'0'},1000,function(){
							$(".dog").attr('src','${initParam.root}images/animalGame1/개_컬러.png');
							$(".dog").animate({opacity: '1'},2000,function(){
								$('.guideImage').css('padding-top','2%')
								$('.guideImage').css('margin-left','22%')
							});
							
							
							$('.sheep').addClass('shake-constant');
							$('.sheep').addClass('shake-slow');
							
						});
					}else if(answerIndex==2){
						$('.sheep').removeClass('shake-constant');
						$('.sheep').removeClass('shake-slow');
						$('.guideImage').animate({opacity:'0'},1000,function(){
							$(".guideImage").attr('src','${initParam.root}images/animalGame1/양_가이드.png');
							playEffectSound("sheep");
							
						});
						$('.sheep').animate({opacity:'0'},1000,function(){
							$(".sheep").attr('src','${initParam.root}images/animalGame1/양_컬러.png');
							$(".sheep").animate({opacity: '1'},2000,function(){
								$('.guideImage').css('padding-top','2%');
								$('.guideImage').css('margin-left','22%');
							});
						});
						$('.dog').addClass('shake-constant');
						$('.dog').addClass('shake-slow');
						

						$('.pig').addClass('shake-constant');
						$('.pig').addClass('shake-slow');
						

						$('.sheep').addClass('shake-constant');
						$('.sheep').addClass('shake-slow');
						
						setTimeout(function(){
							setTimeout(function(){
								playEffectSound("dog");
							},2000)
							setTimeout(function(){
								playEffectSound("pig");
							},4000)
							setTimeout(function(){
								playEffectSound("sheep");
							},6000)
							setTimeout(function(){
								location.href='${initParam.root}index.do';
							},8000);
							
						},1000)
						
					}
					
					answerIndex++;
				} else {
					isCorrect = 0;
					playEffectSound("retry");
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
				
				var startTime = dateInfo.getTime();
				
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