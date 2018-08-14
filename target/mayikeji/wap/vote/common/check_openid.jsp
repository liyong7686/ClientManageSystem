<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
var openid = '${openid}' ;
var appid  ;
//替换APPID  REDIRECT_URI
var oauth2_url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect';

//这里需要 添加输入 框的监听  如果有焦点了。把下面菜单 隐藏
$(function() {
	getAppId();
});

function getAppId(){
	$.get("/weixin/appid", function(result){
		appid = result;
		console.log("appid:"+appid);
		checkOpenid();
	});
}

//检测openid
function checkOpenid(){
	if(!openid){
		console.log('没有openid');
		//跳转登陆页面  把此页面记录缓存 
		console.log(location.href);
		window.sessionStorage.setItem("jumpURL",location.href);
		
		//取得当前域名 没有带http://   
		var host = document.domain; 
		console.log(host);
		//跳转微信登陆页面
		//  /weixin/oauth2
		////替换APPID  REDIRECT_URI
		oauth2_url =oauth2_url.replace("APPID", appid);
		oauth2_url =oauth2_url.replace("REDIRECT_URI", "http://"+host+"/wap/activity/oauth2");
		oauth2_url =oauth2_url.replace("STATE", activityId);
		
		console.log(oauth2_url);
		window.location=oauth2_url;
		
	}
}



</script>
