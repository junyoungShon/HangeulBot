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
			.finalWrapper{
				background: url(${initParam.root}images/veneziaGame3/final_image.png) no-repeat center center fixed; 
				-webkit-background-size: cover;
				-moz-background-size: cover;
				-o-background-size: cover;
				background-size: cover;
				z-index:10;
				display:none;
				width:100%;
				height:100%
			}
			
			body {
			    margin: 0px;
			    overflow: hidden;
			}
			.cardImage{
				height : 300px;
				width : 210px;
				
			}
			.cardImage *{
				position: absolute;
			}
			.leftCard{
				margin-left:280px;
				display : inline;
				position:absolute;
			}
			.rightCard{
				/* margin-left:280px;
				display : inline;
				position:absolute; */
			}
			.finalCardImage0{
				height : 300px;
				width : 210px;
				display : absolute;
				top : 150px;
				left : -320px;				
			}
			.finalCardImage1{
				height : 300px;
				width : 210px;
				display : absolute;
				top : 150px;	
				left : 1120px;
			}
			.tempCtrl{
				display : inline;
				position: fixed;
				z-index : 9999;
			}
			.tempCtrl a {border:10px solid white;}
			.tempCtrl a, .tempCtrl em {float:left; display:block; margin:0 15px; border-radius:15px;}
			.tempCtrl a, .tempCtrl em {border:10px solid white}
			.tempCtrl span {display:none}

			/* .tempCtrl *{
				width : 10px;
				height : 10px;
			} */
			#answerSubmit{
				background-color: green;
			}
			#wrongAnswerSubmit{
				background-color: red;
			}
			#reload{
				background-color: yellow;
			}
			.hidden{
				visibility: hidden;
			}
			.showCard{
			
			}
    	</style>
    </head>
    
    <body>
  
    	<div class="tempCtrl">
			<a href="#" id="firstCtrl"><span>1</span></a>
			<em><span class="none">1</span></em>
			<a href="#"  id="reload"><span>3</span></a>
			<em><span id="">1</span></em>
			<a href="#" id="wrongAnswerSubmit"><span>1</span></a>
			<em><span class="none">1</span></em>
			<a href="#"  id="secondCtrl"><span>3</span></a>
		</div>

    	<div class="finalWrapper">
    		
    		<img src="${initParam.root}images/veneziaGame3/blankCard.png" class="finalCardImage0">
    		<img src="${initParam.root}images/veneziaGame3/blankCard.png" class="finalCardImage1">
    	</div>
        <div class="wrapper">
        	
        	<div class="cardArea">
        		<div class="leftCard">
        			<div class="front">
		        		<img src="${initParam.root}images/veneziaGame3/blankCard.png" class="cardImage">
        			</div>
        			<div class="back">
		        		<img src="${initParam.root}images/veneziaGame3/blankCard.png" class="cardImage" id="currentQuestionImage0">
        			</div>
        		</div>
        		<div class="rightCard">
        			<div class="front">
		        		<img src="${initParam.root}images/veneziaGame3/blankCard.png" class="cardImage">
        			</div>
        			<div class="back">
		        		<img src="${initParam.root}images/veneziaGame3/blankCard.png" class="cardImage" id="currentQuestionImage1">
        			</div>
        		</div>
        	</div>
        	<input type="text" id="firstAnswer" class="hidden">
        	<input type="text" id="secondAnswer" class="hidden">
        </div>
        
      
      	
      	
      	
      	
      	
		<!-- 곻통부분 시작 -네비게이션 버튼  -->
  <%--    <div class="component">
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
          <!-- Javascript & jQuery --> --%>
       
       
        
	<script src="${initParam.root}js/jquery-2.1.1.min.js"></script>
    <script src="${initParam.root}js/script.js"></script>
    <script src="${initParam.root}js/jquery.appear.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="${initParam.root}bootstrap/js/bootstrap.js"></script>
    <script src="${initParam.root}js/main.js"></script> <!-- Resource jQuery -->
    <script src="${initParam.root}js/polyfills.js"></script> <!-- Resource jQuery -->
    <script src="https://cdn.rawgit.com/nnattawat/flip/master/dist/jquery.flip.min.js"></script> <!-- Resource jQuery -->
    <!-- 블루투스 관련 스크립트 -->
    
		<script type="text/javascript">
		var gameData = {
				mode : [
					        {
								name : 'job',
								word : [
								        {english:'singer',korean:'가수'},
								        {english:'soldier',korean:'군인'}
								]	
							},
							{
								name : 'bug',
								word : [
								        {english:'ant',korean:'개미'},
								        {english:'butterfly',korean:'나비'}
								]	
							},
							{
								name : 'animal',
								word : [
								        {english:'lion',korean:'사자'},
								        {english:'hippo',korean:'하마'}
								]	
							},
							{
								name : 'fruit',
								word : [
								        {english:'watermelon',korean:'수박'},
								        {english:'cucumber',korean:'오이'}
								]	
							},
							{
								name : 'sports',
								word : [
								        {english:'baseball',korean:'야구'},
								        {english:'soccer',korean:'축구'}
								]	
							}
					],
				getMode : function(){
					var modeNumber = Math.floor(Math.random() * 5);
					return gameData.mode[modeNumber];
				}
			}	
		// MovingText의 생성자 함수
	    var canvasWidth = $(window).width()-400;
	    var canvasHeight = $(window).height()-500;
	    var currentAnswerNum = 0;
	    var questionList = [];
	    var movingTexts = [];
	 	// 랜덤한 정수를 생성합니다.
        function nextRandomInteger(limit) {
            return Math.round(Math.random() * limit);
        }

        // 양음으로 랜덤한 속도를 생성하는 함수입니다.
        function randomSpeed(maxSpeed) {
            return Math.random() * maxSpeed - Math.random() * maxSpeed;
        }
		
		
		var questionNum = 0;
	    function MovingText(currentMode,i) {
	        // 위치와 속도 속성
	        this.x = nextRandomInteger(canvasWidth);
	        this.y = nextRandomInteger(canvasHeight);
	        this.vx = randomSpeed(7);
	        this.vy = randomSpeed(7);

	        // 문서 객체를 생성합니다.
	        this.body = document.createElement('img');
	        this.body.src = '${initParam.root}images/veneziaGame3/'+currentMode.word[i].english+'_guide.png'
	        this.body.id ='question'+questionNum
	        this.body.style.width = '400px'
	        this.body.style.height = '200px'
	        this.body.style.position = 'absolute';
	        questionNum++;
	        // 문서 객체를 document.body에 추가합니다.
	        document.body.appendChild(this.body);
	        //인풋에 정답을 넣어줌
	        if(i==0){
		        $('#firstAnswer').val(currentMode.word[i].korean)
	        }else{
		        $('#secondAnswer').val(currentMode.word[i].korean)
	        }
	    }

	    MovingText.prototype.move = function () {
	        // 범위 검사
	        if (this.x < 0 || this.x > canvasWidth) { this.vx *= -1; }
	        if (this.y < 0 || this.y > canvasHeight) { this.vy *= -1; }
	        // 이동
	        this.x += this.vx;
	        this.y += this.vy;
	        // 화면에 이동 표시
	        this.body.style.left = this.x + 'px';
	        this.body.style.top = this.y + 'px';
	    };
			
	    var currentAnswerIndex = 0;
		var userCorrectAnswer ='notYet';
		var userCorrectNum=0;

		function submitAnswer(userInputAnswer) {
			if(userInputAnswer==$('#firstAnswer').val()){
				correctFirst()
				$('#firstAnswer').val('complete');
			}else if(userInputAnswer==$('#secondAnswer').val()){
				correctSecond();
				$('#secondAnswer').val('complete');
			}else{
				playEffectSound('retrySound');
				
			}
		}
	
		function correctFirst(){
			playEffectSound('success');
			$('#question0').attr('src','${initParam.root}images/veneziaGame/explosion-animated.gif');
			setTimeout(function(){
				$('#question0').hide();
			},1000);
			for(var i=0;i<11;i++){
		    	setTimeout(function(){
		    		 $(".leftCard").click();
		    	},100*i)
		    }
			userCorrectNum++
			if(userCorrectNum==2){
				finalEvent();
			}
		}
		function correctSecond(){
			playEffectSound('success');
			$('#question1').attr('src','${initParam.root}images/veneziaGame/explosion-animated.gif');
			setTimeout(function(){
				$('#question1').hide();
			},1000);
			for(var i=0;i<11;i++){
		    	setTimeout(function(){
		    		 $(".rightCard").click();
		    	},100*i)
		    }
			userCorrectNum++
			if(userCorrectNum==2){
				finalEvent();
			}
		}
		function finalEvent(){
			setTimeout(function(){
				playEffectSound('stop');
				playEffectSound('finalSound');
				$('.wrapper').hide( "slow");
				$('.finalWrapper').show( "slow");
			},2000)	
			setTimeout(function(){
				$( ".finalCardImage0" ).animate({ "left": "+=700px" }, 4000 );
				$( ".finalCardImage1" ).animate({ "left": "-=600px" }, 4000 );
			},3000)
			setTimeout(function(){
				window.location.reload(true);
			},5500)
		}
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
				//alert('한글봇 하드웨어와 연동되지 않은 경우 이용이 불가합니다. 메인으로 돌아갑니다.');
				//location.href='${initParam.root}index.do';
			}else{
				$('.connectInfo').html('<h4>연결양호</h4><span class="fa fa-bluetooth"></span>');
			}
		}
		function turnOnbluetooth(){
			window.HangeulBotAndroidAPP.turnOnbluetooth();
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
		function playEffectSound(soundName){
			var broswerInfo = navigator.userAgent;
			//위시룸 안드로이드 앱이 맞다면 아래 내용 실행
			
			window.HangeulBotAndroidAPP.playEffectSound(soundName);
		}

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
		playEffectSound('veneziaBg');
		
			var windowWidth = $(document).width();
			var windowHeight = $(document).height()
			$('.wrapper').css('width',windowWidth);
			$('.wrapper').css('height',windowHeight);
			$('.finalWrapper').css('height',windowHeight);
			$('.finalWrapper').css('height',windowHeight);
			//playEffectSound("bgmusic");
			
			//네이게이터 off
			$('.wrapper').click();
			
			//현재 모드를 랜덤으로 선택
			var currentMode = gameData.getMode();
			console.log("현재 게임 모드 ? "+currentMode.name);
			
			//현재 모드에 따라 배경 그림을 바꾼다.
			 $('.wrapper').css('background', 'url(${initParam.root}images/veneziaGame3/'+currentMode.name+'_bg.jpg) no-repeat center center fixed');
			//카드 이미지를 설정한다.
			 $('#currentQuestionImage0').attr('src','${initParam.root}images/veneziaGame3/'+currentMode.word[0].english+'_card.png')
			 $('#currentQuestionImage1').attr('src','${initParam.root}images/veneziaGame3/'+currentMode.word[1].english+'_card.png')
			 $('.finalCardImage0').attr('src','${initParam.root}images/veneziaGame3/'+currentMode.word[0].english+'_card.png')
			 $('.finalCardImage1').attr('src','${initParam.root}images/veneziaGame3/'+currentMode.word[1].english+'_card.png')
			 // 가이드 그림 두개 움직이게 한다.
		    for (var i = 0; i < 2; i++) {
		        movingTexts.push(new MovingText(currentMode,i));
		    }
		
		    // 움직임 부여
		    setInterval(function () {
		        for (var i in movingTexts) {
		            movingTexts[i].move();
		        }
		    }, 1000 / 30);
		    
		    //카드 이미지 자리잡자. (높이)
		    $('.cardImage').css('margin-top',windowHeight-350);
		    //세로 이미지 자리잡자.
		    $('.leftCard').css('margin-left',(windowHeight/2)-10);
		    $('.rightCard').css('margin-left',(windowHeight/2)+305);
		    //카드이미지가 동작할 수 있는 메서드를 대기 시킴
		    $(".rightCard").flip({
		    	speed : '200'
		    }); 
		    $(".leftCard").flip({
		    	speed : '200'
		    }); 
		    
			
			$('#answerDeliver').click(function(){
				submitAnswer($('#answer').val());
			})
			$('#firstCtrl').click(function(){
				correctFirst();
			});
			$('#secondCtrl').click(function(){
				correctSecond();
			});
			$('#reload').click(function(){
				playEffectSound('stop')
				window.location.reload(true);
			});
			$('#wrongAnswerSubmit').click(function(){
				playEffectSound('retrySound');
			});
			
			
			
	});
	
		</script>
		
	</body>
</html>