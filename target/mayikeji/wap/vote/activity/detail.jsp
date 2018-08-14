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

<title>活动详情 - ${activity.name}</title>

<style type="text/css">
</style>

</head>
<script type="text/javascript" charset="utf-8">
mui.init();

var share_url;//分享连接
var share_img_url;//分享图标
var share_title= "活动详情 - ${activity.name}";//分享标题
var share_desc = "${activity.wx_share_desc}";//分享摘要

$(function() {
	var host = document.domain; 
	share_url = window.location.href;
	share_img_url = 'http://'+host+'${activity.wx_share_img}';
	weixin_share();
});
</script>


<body>
<div class="mui-content">
		<div style="margin-top: 20px; margin-bottom: 10px;">
			<p style="text-align: center; color: #2b425b; font-size: 15px;">${activity.name}</p>
		</div>
		
		<!-- 投票时间  以及摘要 -->
		<div style="padding: 10px;">
			<div style="background-color:white;padding: 10px 10px 10px 10px;box-shadow: 0 1px 1px rgba(128, 128, 128, 0.96);">
				<div class="desc_item">
					<div class="desc_item_left">
						<img class="desc_item_img" src="/static/images/vote/time.png">投票开始：
					</div>
					<div class="desc_item_right" >
						<fmt:formatDate value="${activity.startDateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</div>
				</div>
				<div class="desc_item">
					<div class="desc_item_left">
						<img class="desc_item_img" src="/static/images/vote/time.png">投票截止：
					</div>
					<div class="desc_item_right" >
						<fmt:formatDate value="${activity.endDateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</div>
				</div>
				<div class="desc_item">
					<div class="desc_item_left">
						<img class="desc_item_img" src="/static/images/vote/规则.png">投票规则：
					</div>
					<div class="desc_item_right" >${activity.rule_ }</div>
				</div>
				<div class="desc_item">
					<div class="desc_item_left">
						<img class="desc_item_img" src="/static/images/vote/详情.png">活动详情：
					</div>
					<div class="desc_item_right" >${activity.desc_ }</div>
				</div>
			</div>
		</div>
		<!-- 投票时间  以及摘要 -->
		
		<div style="padding: 10px;">
			<div class="activity_content" style="background-color: white; padding: 10px;">
				${activity.content}
			</div>
		</div>
		
		<div style="height: 100px;"></div>
		
</div>

<!-- 底部菜单 -->
<jsp:include page="/wap/vote/common/fixed_btm.jsp"/>
<jsp:include page="/wap/vote/common/check_openid.jsp"/>

		
</body>
</html>