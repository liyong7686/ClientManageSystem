<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 强制  高速模式 渲染网页    -->
<meta name=”renderer” content=”webkit”>
<meta http-equiv=”X-UA-Compatible” content=”IE=Edge,chrome=1″ >

<!--添加  jq  支持加载-->
<script	src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<!--添加  jq  支持加载-->

<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL -->

<!-- 加入移动布局 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<!-- 加入移动布局 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--添加  本地 mui  支持-->
<script src="${pageContext.request.contextPath}/static/mui/js/mui.min.js"></script>
<link href="${pageContext.request.contextPath}/static/mui/css/mui.css" rel="stylesheet"/>
<!--添加  本地  mui  支持-->

<!--添加layer移动  弹出窗口的 插件支持-->
<script src="${pageContext.request.contextPath}/static/layer_mobile/layer.js"></script>
<!--添加layer移动  弹出窗口的 插件支持-->

<link href="${pageContext.request.contextPath}/static/css/vote/base.css" rel="stylesheet"/>

<!--添加  js api-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<!--添加  js api-->
<!--添加  微信分享js 自己扩展的  -->
<script src="${pageContext.request.contextPath}/static/weixin_js/weixin_share.js"></script>
<!--添加  微信分享js 自己扩展的  -->

<title>活动评论 - ${activity.name}</title>

<style type="text/css">

.my_list{
	position: relative;
	margin-top: 0;
	margin-bottom: 0;
	padding-left: 0;
	list-style: none;
	background-color: #fff;
}
.my_list:before {
	position: absolute;
	right: 0;
	left: 0;
	height: 1px;
	content: '';
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
	background-color: #c8c7cc;
	top: -1px;
}
.my_list:after {
	position: absolute;
	right: 0;
	bottom: 0;
	left: 0;
	height: 1px;
	content: '';
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
	background-color: #c8c7cc;
}
.my_list_item{
	position: relative;
	padding: 10px 10px 10px 10px;
}

.my_list_item:after {
	position: absolute;
	right: 0;
	bottom: 0;
	left: 15px;
	height: 1px;
	content: '';
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
	background-color: #c8c7cc;
}

</style>

</head>
<script type="text/javascript" charset="utf-8">
mui.init();

var share_url;//分享连接
var share_img_url;//分享图标
var share_title= "活动评论 - ${activity.name}";//分享标题
var share_desc = "${activity.wx_share_desc}";//分享摘要

$(function() {
	var host = document.domain; 
	share_url = window.location.href;
	share_img_url = 'http://'+host+'${activity.wx_share_img}';
	weixin_share();
	listenScrollLoading();
	
	loadData();
});



function sub(){
	var nickName = $("#nickName").val();
	var content = $("#content").val();
	
	if(nickName.length<1){layer.closeAll();
		layer.open({content: '请填写昵称',skin: 'msg',time: 2});
		return;
	}
	if(content.length<3){layer.closeAll();
		layer.open({content: '请填写留言内容',skin: 'msg',time: 2});
		return;
	}
	$.post("/admin/activity/comment/add",{nickName:nickName,content:content,openid:openid},function(result){
		if(result.success){
			layer.closeAll();
			 //询问框
			  layer.open({
			    content: '提交成功,管理员审核后,即可显示'
			    ,btn: ['好', '我知道了']
			    ,yes: function(index){
			    	location.replace(location.href);
			    }
			    ,no: function(index){
			    	location.replace(location.href);
			    }
			  });
		}else{
			layer.closeAll(); 
			layer.open({ content: '提交失败' ,skin: 'msg',time: 2   });
		}
	},'json');
}

//滑动加载设置
var page = 1;
var limit = 30;
var load_url = "/admin/activity/comment/list";
var isShow = 1;
var activityId = '${activity.id}';
var booleanFound = true;//定义 是否  继续查询 
var isLoad = false;//定义  loadData 有没有线程在用

function listenScrollLoading(){
	$(window).scroll(function () {
    	//这个方法是当前滚动条滚动的距离
        var scrollTop =  $(window).scrollTop();
    	var doc_height = $(document).height();
    	//console.log("获取当前文档的高度:"+doc_height);
    	var window_height = $(window).height();
    	//console.log("获取当前窗体的高度:"+window_height);
    	// 距离屏幕的位置 加上   当前窗体的高度  >= 文档的高度-100【-100提早加载】    那么就表示  文档到底部了
    	if((window_height+scrollTop)>(doc_height-100)){
    		if(booleanFound){
    			console.log("要翻页了");
    			loadData();
    		}
    	}
    });
}

function loadData(){
	if(!isLoad){
		isLoad = true;
		$("#load").show();
		$.post(load_url, {page:page,limit:limit,isShow:isShow,activityId:activityId}, function(result) {
			if(result.data.length>0){
				page++;
			}else{
				if(page==1){
					$("#default").show();
				}
				  layer.open({
				     content: '暂无数据加载'
				     ,skin: 'msg'
				     ,time: 2 //2秒后自动关闭
				  });
				  
				  
				  $("#load").hide();
				  isLoad = false;
				  booleanFound = false;
				 return;
			}
			
			for(var j=0;j<result.data.length;j++){
				$("#comment").append(
						'<div class="my_list_item">'+
							'<div style=" display: flex;display: -webkit-flex;">'+
								'<div style="width: 45px; ">'+
									'<img alt="" width="100%" src="/static/images/base/default_head_img.jpg" />'+
								'</div>'+
								'<div style="flex:1;-webkit-flex:1; padding-left: 10px;">'+
									'<div style="color: #666;">'+result.data[j].nickName+'</div>'+
									'<div>'+result.data[j].content+'</div>'+
									'<div style="font-size: 13px; color: #B1B1B1;margin-top: 10px;">'+result.data[j].createDateTime+'</div>'+
								'</div>'+
							'</div>'+
						'</div>');
				$("#load").hide();
				isLoad = false;
				booleanFound = true;
			}
		}, 'json');
	}
}




</script>

<body>
<div class="mui-content">
	<div class="my_list" style="margin-top: 6px;">
		<div class="my_list_item">
			<div style=" display: flex;display: -webkit-flex;">
				<div style="width: 75px; line-height: 38px;">
					昵称
				</div>
				<div style="flex:1;-webkit-flex:1; padding-left: 10px;">
					<input type="text" id="nickName"  class="mui-input-clear" style="margin-bottom: 0px"  placeholder="昵称【选填】">
				</div>
			</div>
		</div>
		
		<div class="my_list_item">
			<div style=" display: flex;display: -webkit-flex;">
				<div style="width: 75px; line-height: 113px;">
					留言内容
				</div>
				<div style="flex:1;-webkit-flex:1; padding-left: 10px;">
					<textarea id="content" rows="5" placeholder="留言内容【必填】"></textarea>
				</div>
			</div>
		</div>
	</div>
	
	<div style=" margin-bottom: 30px;">
		<button type="button" onclick="sub()" style="margin-bottom: 0px; padding-bottom: 5px; padding-top: 5px;" class="mui-btn mui-btn-success mui-btn-block">提交留言</button>
	</div>
	<div style="text-align: center; color: #8f8f94; margin-bottom: 8px; ">留言展示</div>
	<div id="comment" class="my_list" style=" background-color:#EFEFF4; margin-bottom: 10px; ">
		<!-- <div class="my_list_item">
			<div style=" display: flex;display: -webkit-flex;">
				<div style="width: 45px; ">
					<img alt="" width="100%" src="/static/images/base/default_head_img.jpg" />
				</div>
				<div style="flex:1;-webkit-flex:1; padding-left: 10px;">
					<div style="color: #666;">小明</div>
					<div>你好</div>
					<div style="font-size: 13px; color: #B1B1B1;margin-top: 10px;">2018-12-12 12:545</div>
				</div>
			</div>
		</div> -->
	</div>
	
	<div id="default" style="text-align: center; display: none;">
		<span style="display: inline-block;color:#9e9e9ead; vertical-align: middle;">暂无留言数据</span>
	</div>
	
	<div id="load" style="text-align: center; display: none;">
		<img style="display: inline-block; vertical-align:middle; width: 30px;" alt="" src="/static/images/vote/load.gif"/>
		<span style="display: inline-block;color:#9e9e9ead; vertical-align: middle;">数据加载中...</span>
	</div>
	
	<div style="height: 100px;"></div>
</div>

<!-- 底部菜单 -->
<jsp:include page="/wap/vote/common/fixed_btm.jsp"/>
<jsp:include page="/wap/vote/common/check_openid.jsp"/>


</body>
</html>