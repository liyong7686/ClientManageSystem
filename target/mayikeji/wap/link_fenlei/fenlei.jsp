<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL -->

<!--添加  jq  支持加载-->
<script	src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<!--添加  jq  支持加载-->

<!-- 强制  高速模式 渲染网页    -->
<meta name=”renderer” content=”webkit”>
<meta http-equiv=”X-UA-Compatible” content=”IE=Edge,chrome=1″ >
<!-- 强制  高速模式 渲染网页    -->

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

<title>${linkFenLei.name}</title>

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
	padding: 10px 10px;
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

.my_list_item_title{
	font-weight: bold;
	max-height: 42px;
	overflow: hidden;
}

.my_list_item_desc{
	font-size: 12px;
    color: #696464;
    max-height: 42px;
    overflow: hidden;
}

</style>

</head>
<script type="text/javascript" charset="utf-8">

mui.init();

</script>
<body>

<header id="header" class="mui-bar mui-bar-nav">
	<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left "><span style="font-size: 16px; line-height: 20px; height: 20px;">返回</span></a>
	<h1 class="mui-title">${linkFenLei.name}</h1>
</header>


<div class="mui-content">
	
	<div class="my_list" style="margin-top: 6px;">
		<c:forEach var="link" items="${linkList}" >
			<div class="my_list_item">
				<div onclick="window.location.href='/wap/link/${link.id}'" style=" display: flex;display: -webkit-flex;">
					<div style="width: 100px;">
						<img style="width: 100px; height: 80px;" src="${link.img_url }" />
					</div>
					<div style="flex:1;-webkit-flex:1; padding-left: 10px;">
						<div class="my_list_item_title">${link.title }</div>
						<div class="my_list_item_desc">${link.desc_ }</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
</div>


</body>
</html>