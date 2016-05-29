/**
 *  한글 봇 블루투스 모듈 
 *  
 *  1. 페이지에 접속하면 블루투스 연결을 요청한다.
 *  2. 연결이 끊긴 경우 초기페이지로 이동시켜 다시 블루투스연결을 요청한다.
 *  3. 블루투스 연결이 정상적인 경우 component의 블루투스란에 정보를 연결상태를 정상으로 표시해준다.
 *  
 *  4. 모든 문서에 공통적으로 한글봇 기계의 텍스트를 받는 input을 생성한다.
 *  5. input의 데이터가 바뀔 때마다 페이지에 답을 전송하는 공통모듈을 만든다.
 */
/*
$(document).ready(function(){
	var broswerInfo = navigator.userAgent;
	var bluetoothConnectionStatus = 
	if(broswerInfo.indexOf("HangeulBotAndroidAPP")>-1){
		alert("앱으로 접속하셨습니다.");
	}else{
		alert("앱으로 접속하지 않으셨습니다. 정상적인 사용이 불가능합니다.");
	}
	
	
	$('.bluetoothBtn').click(function(){
		turnOnbluetooth();
	})
	
	
});
function bluetoothDisconnected(){
	alert('블루 투스 연결이 해제되었습니다.');
}

function turnOnbluetooth(){
	window.HangeulBotAndroidAPP.turnOnbluetooth();
}
function getBluetoothMsg(Msg){
	$('#latestMSG').val(Msg);
	$('#connectStatus').val("connected");
	alert('정상적으로 값이 전송되었습니다.');
}
*/

/*var bluetoothConnectionStatus = 
	

function getBluetoothInfo(macAdreess){
	$('#MacAddress').val(macAdreess);
	$('#connectStatus').val("connected");
	alert('블루투스 연결이 정상적으로 이루어졌습니다.');
}

*/