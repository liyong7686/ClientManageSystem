<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 强制  高速模式 渲染网页    -->
<meta name=”renderer” content=”webkit”>
<meta http-equiv=”X-UA-Compatible” content=”IE=Edge,chrome=1″ >
<!-- 强制  高速模式 渲染网页    -->

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

<!--添加  js api-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<!--添加  js api-->

<!--添加  修改 顶部bar成为绿色的样式  -->
<link href="${pageContext.request.contextPath}/static/common/base/alert_mui_bar.css" rel="stylesheet"/>
<!--添加  修改 顶部bar成为绿色的样式  -->

<title>${link.title} - ${config.domain_title}</title>


<style type="text/css">
.link_content img{
	 width: 100%;
}
.link_content p{
	margin-bottom:0px;
}
</style>


</head>
<script type="text/javascript" charset="utf-8">

mui.init();

</script>
<body>

<header id="header" class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left "><span style="font-size: 16px; line-height: 20px; height: 20px;">返回</span></a>
	<h1 class="mui-title">${link.title}</h1>
</header>

<div class="mui-content">
	<div style="padding: 10px;">
		<div class="link_title">
			<div style="font-weight: bold; font-size: 20px; text-align: center; margin-bottom: 10px;">
				${link.title}
			</div>
			<div style="color: #666; text-align: center; font-size: 13px;margin-bottom: 10px;">
				<fmt:formatDate value="${link.createDateTime}" pattern="yyyy-MM-dd HH:mm"/>
			</div>
		</div>
		<div class="link_content">
			${link.content}
		</div>
	</div>
</div>


</body>
</html>