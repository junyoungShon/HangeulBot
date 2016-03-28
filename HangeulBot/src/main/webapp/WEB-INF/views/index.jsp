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
		
			function turnOnbluetooth(){
				var broswerInfo = navigator.userAgent;
				
				//위시룸 안드로이드 앱이 맞다면 아래 내용 실행
				window.HangeulBotAndroidAPP.turnOnbluetooth();
			}
			function getBluetoothInfo(macAdreess){
				$('#MacAddress').val(macAdreess);
				$('#connectStatus').val("connected");
				alert('블루투스 연결이 정상적으로 이루어졌습니다.');
			}
			function lostConnection(){
				alert('연결이실패하였습니다.');
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
        <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
         <span class="glyphicon glyphicon-arrow-left" aria-hidden="true" style="color:white;font-size:50px"></span>
        </div>
        
      </div>
    </nav>
        
        <!-- Start Main Body Section -->
        <div class="mainbody-section text-center" style="margin-top: 5%">
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
        

      
        <div class="bluetoothConnectInterface" style="text-align: center">
        	한글봇 MAC : <input type="text" id="MacAddress" value="notConnected" readonly="readonly">
        	가장 최근 보낸 문자열 : <input type="text" id="latestMSG" value="notConnected" readonly="readonly">
        	연결 상태 : <input type="text" id="connectStatus" value="notConnected" readonly="readonly">
        	<button onclick="turnOnbluetooth()" value="연결">연결</button>
        </div>
                
    </body>
    
</html>
