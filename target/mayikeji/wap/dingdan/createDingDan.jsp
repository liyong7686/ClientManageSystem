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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- JSTL -->


<!-- 加入移动布局 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<!-- 加入移动布局 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--添加  本地 mui  支持-->
<script src="${pageContext.request.contextPath}/static/mui/js/mui.min.js"></script>
<link href="${pageContext.request.contextPath}/static/mui/css/mui.css" rel="stylesheet"/>
<!--添加  本地  mui  支持-->


<!--添加  js api-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<!--添加  js api-->



<!--添加layer移动  弹出窗口的 插件支持-->
<script src="${pageContext.request.contextPath}/static/layer_mobile/layer.js"></script>
<!--添加layer移动  弹出窗口的 插件支持-->

<!--添加  vue.js 支持加载-->
<script src="${pageContext.request.contextPath}/static/vue/vue.min.js"></script>
<!--添加  vue.js 支持加载-->

<!--mui head 变成绿色 -->
<link href="${pageContext.request.contextPath}/static/common/base/alert_mui_bar.css" rel="stylesheet"/>

<!--添加  本页 js css  -->
<script src="${pageContext.request.contextPath}/static/common/dingdan/create.js"></script>
<link href="${pageContext.request.contextPath}/static/common/dingdan/create.css" rel="stylesheet"/>
<!--添加  本页 js css  -->



<!--添加  微信分享js 自己扩展的  -->
<script src="${pageContext.request.contextPath}/static/weixin_js/weixin_share.js"></script>
<!--添加  微信分享js 自己扩展的  -->


<title>提交订单</title>
<style type="text/css">
</style>
</head>
<script type="text/javascript" charset="utf-8">

var share_url;//分享连接
var share_img_url;//分享图标
var share_title= "创建订单";//分享标题
var share_desc = "创建订单";//分享摘要



mui.init();
$(function() {
	//$("#home").addClass("active");
	//初始化一次计算
	calculation();
	
	//分享连接
	var host = document.domain; 
	share_url = window.location.href;
	share_img_url = 'http://'+host+'${config.wx_share_img}';
	weixin_share();
	//分享连接
});

//启动定时器
timer = setInterval(calculation,1000);


</script>

<body id="app">
<header id="header" class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left "><span style="font-size: 16px; line-height: 20px; height: 20px;">返回</span></a>
	<h1 class="mui-title">提交订单</h1>
</header>

<div class="mui-content">
	
	
	<!-- 基本信息 -->
	<div style="padding:10px 0px 2px 0px ; margin-bottom:10px;   ">
		<p style="margin-bottom: 1px; padding-left: 10px;   font-size: 12px;">基本信息</p>
		<div style="background-color: white; border-top: 1px solid #CACACA; padding: 0px 10px 0px 10px; ">
			<div class="input_row">
				<div>姓名</div>
				<div><input placeholder="请输入姓名" v-model="name" value="${client.name }" style="border: 0px;  outline: 0; height: 30px; margin: 0px;" type="text" /></div>
			</div>
			<div class="input_row">
				<div>电话</div>
				<div><input  placeholder="请输入电话" v-model="phone" value="${client.phone }" style="border: 0px;  outline: 0; height: 30px; margin: 0px;" type="text" /></div>
			</div>
			<div class="input_row">
				<div>地址</div>
				<div><input placeholder="请输入地址" v-model="address" value="${client.address }" style="border: 0px;  outline: 0; height: 30px; margin: 0px;" type="text" /></div>
			</div>
		</div>
	</div>
	<!-- 基本信息 -->
	
	
	<!-- 商品信息 -->
	<div style="padding:2px 0px 2px 0px;  ">
		<p style="margin-bottom: 1px; padding-left: 10px;   font-size: 12px;">商品信息</p>
		
		<div style="background-color: white; border-top: 1px solid #CACACA; padding: 0px  0px 0px  0px; ">
			
			
			<c:forEach var="goods" items="${goodsList}" varStatus="status"  >
				<div class="goods_item" style="position: relative;" >
					<input type="hidden" value="${goods.id}" id="goodsId" />
					<div style="display: flex;display: -webkit-flex;position: relative; padding:10px 3px 3px 10px;">
						<div style="flex:1;	-webkit-flex:1; display: flex;display: -webkit-flex; " >
							<span style="vertical-align:top; width: 50px; height: 50px; "><img style="width: 50px;" src="${goods.showImg }" /></span>
							<span style="vertical-align:top;padding-left: 3px;color: #333;font-size: 13px; flex:1;-webkit-flex:1;max-height: 50px; overflow:hidden; line-height: 16px;">${goods.title }</span>
						</div>
						
						
						<div style="width:73px;padding-left: 6px;" >
							<div style="color: #777;font-size: 13px;color: red; font-weight: bold;">¥ <span id="price">${goods.price}</span></div>
							<div style="color: #777;font-size: 13px;">x <span id="num">1</span></div>
						</div>
					</div>
					
					<div style="position: relative; padding:3px 35px 10px 10px; text-align: right;">
						<span style="display:inline-block; text-align: right; font-size: 13px; line-height: 25px; color:#007113; ">购买数量</span>
						<span style="display:inline-block;  text-align: left;">
							<span class="sub" onclick="num_sub(${status.index})">一</span>
							<span style="display: inline-block;  margin-right: -4px;">
								<input id="input_num" type="text" value="1" style=" text-align:center;  width: 50px; font-size:14px; padding:0px;  margin:0px; height: 21px;" >
							</span>
							<span class="add" onclick="num_add(${status.index})">十</span>
						</span>
					</div>
					
					
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- 商品信息 -->
	
	<!-- 合计信息 -->
	<div style="border-top: 1px solid #CACACA; margin-bottom:10px; border-bottom:1px solid #CACACA; background-color:white;position: relative; padding: 10px;">
			<div style=" text-align:right; color: #333;font-size: 13px;"  >
				<span>共<span style="color: red; font-weight: bold;" id="global_num"></span>件商品</span>
				<span>合计:</span>
				<span style="color: red; font-weight: bold;">¥ <span id="global_jine"></span></span>
			</div>
	</div>
	
	<!-- 合计信息 -->
	
	<!-- 卖家留言   -->
	<div style="padding:2px 0px 0px 0px; margin-bottom:50px;  ">
		<p style="margin-bottom: 1px;padding-left: 10px;    font-size: 12px;">选填-买家留言</p>
		<div style="border-top: 1px solid #CACACA; border-bottom:1px solid #CACACA; ">
			<input placeholder="选填-买家留言" v-model="remark" style="border: 0px;  outline: 0; height: 30px; margin: 0px;" type="text" />
		</div>
	</div>
	<!-- 卖家留言 -->
	
	<!-- 确认订单  点击确认  开始创建订单  验证用户信息 -->
	<div style="text-align: center; margin-bottom: 90px;">
		<div class="pay_btn" onclick="create()">提交订单</div>
	</div>
	<!-- 确认订单 -->
	
	
</div>

<!-- 底部菜单 -->
<jsp:include page="/wap/common/fixed_btm.jsp"/>

<script>
var app = new Vue({
	el : '#app',
	data : {
		name : '',
		phone:'',
		address : '',
		remark:""
	}
});
</script>

</body>
</html>