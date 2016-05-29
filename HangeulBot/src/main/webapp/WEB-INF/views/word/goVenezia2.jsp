<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<link href="${initParam.root}bootstrap/css/bootstrap.min.css" rel="stylesheet">
		        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="${initParam.root}css/component.css" />
        <link rel="stylesheet" type="text/css" href="${initParam.root}css/star-rating-svg.css">
        
		<script src="${initParam.root}js/modernizr.js"></script> <!-- Modernizr -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
		<script src="${initParam.root}bootstrap/js/bootstrap.js"></script>
		
	<style type="text/css">
		.wrapper { 
				
			}
			body {
			    margin: 0px;
			    overflow: hidden;
			    background: url(${initParam.root}images/veneziaGame/veneziaBg.gif) no-repeat center center fixed; 
				-webkit-background-size: cover;
				-moz-background-size: cover;
				-o-background-size: cover;
				background-size: cover;
				color : black;
			}
	</style>
    <!-- 보조 함수 -->
    <script>
    
    	
        // 랜덤한 정수를 생성합니다.
        function nextRandomInteger(limit) {
            return Math.round(Math.random() * limit);
        }

        // 양음으로 랜덤한 속도를 생성하는 함수입니다.
        function randomSpeed(maxSpeed) {
            return Math.random() * maxSpeed - Math.random() * maxSpeed;
        }
    </script>
    <!-- 생성자 함수 -->
    <script>
        // MovingText의 생성자 함수
        var canvasWidth = $(window).width()-400;
        var canvasHeight = $(window).height()-200;
        var currentAnswerNum = 0;
        var questionList = [];
        
		<c:forEach items="${requestScope.questionList}" var="questionList" varStatus="status">
		questionList.push({"word":"${questionList.word}","wordId":"${questionList.wordId}"});
		</c:forEach>
		
		var questionNum = 0;
        function MovingText() {
            // 위치와 속도 속성
            this.x = nextRandomInteger(canvasWidth);
            this.y = nextRandomInteger(canvasHeight);
            this.vx = randomSpeed(7);
            this.vy = randomSpeed(7);

            // 문서 객체를 생성합니다.
            this.body = document.createElement('img');
            this.body.src = '${initParam.root}images/wordList/'+questionList[questionNum].word+'_가이드.png'
            this.body.id ='question'+questionNum
            this.body.style.width = '400px'
            this.body.style.height = '200px'
            this.body.style.position = 'absolute';
            questionNum++;
            // 문서 객체를 document.body에 추가합니다.
            document.body.appendChild(this.body);
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
        function playEffectSound(soundName){
			var broswerInfo = navigator.userAgent;
			//위시룸 안드로이드 앱이 맞다면 아래 내용 실행
			
			window.HangeulBotAndroidAPP.playEffectSound(soundName);
		}
        window.onload = function () {
            // 변수를 선언합니다.
           	var movingTexts = [];
            
            //배경음악 재생
			playEffectSound('bgMusic');
            // 배열에 MovingText 객체 100개를 생성합니다.
            for (var i = 0; i < 3; i++) {
                movingTexts.push(new MovingText());
            }

            // 움직입니다.
            setInterval(function () {
                for (var i in movingTexts) {
                    movingTexts[i].move();
                }
            }, 1000 / 30);
        		
    			$('#goAnswer').click(function(){
    				//alert('정답입니다!');
    				playEffectSound('magicChime');
    				var options = {
				        'effect': 'splash',
				        'effectOptions': {
				            'color': 'rgba(255,255,255,1)',
				            'radius': 2000,
				            'duration': 3000
				        },
    					
				    };
    				$('#currentAnswerPicture').attr('src','${initParam.root}images/wordList/'+questionList[currentAnswerNum].word+'.jpg')
    				
					setTimeout(function(){
	    				$('#congarteModal').modal('show')
	    				
	    				setTimeout(function(){
							$('#congarteModal').modal('hide');
	    				},8000);
					},2000); 
    				
    				$('#question'+currentAnswerNum).attr('src','${initParam.root}images/veneziaGame/explosion-animated.gif');
    				setTimeout(function(){
    					$('#question'+currentAnswerNum).hide();
    					currentAnswerNum++;
    				},1000);
    				$('#congarteModal').on('show.bs.modal', function (e) {
    					//$('#question0').attr('src','${initParam.root}images/wordList/사과.jpg');
    				})
    				movingTexts.splice(0,1);
    				
    			})
    			$('#goWrong').click(function(){
    				playEffectSound('slideWhitle');
    			})
    			$('#goFinish').click(function(){
    				playEffectSound('victoryCrowd');
    				$('#finishModal').modal('show');
    				setTimeout(function(){
    					$('#goIndex').click();
    				},10000);
    			})
    			$('#goIndex').click(function(){
    				playEffectSound('stop');
    				location.href = '{initParam.root}goIndex.do';
    			})
        };
        
    </script>
</head>
<body>
	 <div class="wrapper">
	 	<button class="btn btn-success" id="goAnswer">정답!</button>
	 	<button class="btn btn-warn" id="goWrong">오답!</button>
	 	<button class="btn btn-warn" id="goFinish">끝!</button>
	 </div>
	 <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="congarteModal">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	  		<img src="${initParam.root}images/wordList/사과.jpg" style="width:100%; height:100%;" id="currentAnswerPicture">
	    </div>
	  </div>
	</div>
	 <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="finishModal">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	  		<img src="${initParam.root}images/veneziaGame/congratulation.gif" style="width:100%; height:100%;">
	  		<button class="btn btn-success" id="goIndex" style="width:100%"><h4>홈으로</h4></button>
	    </div>
	  </div>
	</div>
	
	
	<%--   <!-- 곻통부분 시작 -네비게이션 버튼  -->
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
        <script src="${initParam.root}js/jquery.appear.js"></script>
        <script src="${initParam.root}js/script.js"></script>
			<script src="${initParam.root}js/main.js"></script> <!-- Resource jQuery -->
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
		</script> --%>
</body>

</html>