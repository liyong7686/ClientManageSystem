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

<title>${activity.name}</title>
<style type="text/css">
.show_item_btn{
	background-color: ${activity.color_};
}
</style>

</head>
<script type="text/javascript" charset="utf-8">
	mui.init();
	
	var share_url;//分享连接
	var share_img_url;//分享图标
	var share_title= "${activity.wx_share_title}";//分享标题
	var share_desc = "${activity.wx_share_desc}";//分享摘要
	
	$(function() {
		var host = document.domain; 
		share_url = window.location.href;
		share_img_url = 'http://'+host+'${activity.wx_share_img}';
		weixin_share();
	});
	
	function search(){
		var q = $("#q").val();
		var activityId = '${activity.id}';
		
		//发送金额和商品id到后台  验证一下
		layer.open({
		    type: 2
		    ,content: '正在搜索'
		    ,shadeClose:false
		});
		
		$.post("/admin/activity/work/list",{q:q,activityId:activityId,page:1,limit:100,isUse:1},function(result){
			layer.closeAll();
			
			if(result.data.length==0){
				  //提示
				  layer.open({
				    content: '没有搜索到内容'
				    ,skin: 'msg'
				    ,time: 2 //2秒后自动关闭
				  });
			}else{
				//清空展示 
				clear_show(result.data);
			}
		},'json');
	}
	
	//清空展示 
	function clear_show(data){
		$("#activityWorkList").empty();
		for(var i=0;i<data.length;i++){
			$("#activityWorkList").append(
					'<div class="show_item">'+
					'<a href="/wap/activity/work/'+data[i].id+'">'+
						'<div class="show_item_body">'+
							'<div>'+
								'<img style="width: 100%;" src="'+data[i].imgUrl+'" />'+
							'</div>'+
							'<div class="show_item_title">'+
								'<p>'+data[i].name+'</p>'+
							'</div>'+
							'<div style="padding: 0px 15px 0px 15px;">'+
								'<div class="show_item_btn">'+
									'<img style="display: inline-block; width: 15px;" src="/static/images/vote/hand.png"/>'+
									'<span style="display: inline-block;">投票</span>'+
								'</div>'+
							'</div>'+
						'</div>'+
					'</a>'+
				'</div>'		
			);
		}
		
		//添加清除浮动
		$("#activityWorkList").append('<div style="clear:both;"></div>');
		
	}
	
	
	
</script>

<body>
<div class="mui-content">
		<div id="slider" class="mui-slider">
			<div class="mui-slider-group mui-slider-loop">
				<!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
				<div class="mui-slider-item mui-slider-item-duplicate">
					<a href="${activityLunboList[activityLunboList.size()-1].url}">
						<img src="${activityLunboList[activityLunboList.size()-1].imgUrl}">
					</a>
				</div>
				
				<c:forEach var="activityLunbo" items="${activityLunboList}" >
					<div class="mui-slider-item">
						<a href="${activityLunbo.url}">
						<img src="${activityLunbo.imgUrl}">
						</a>
					</div>
				</c:forEach>
				
				<!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
				<div class="mui-slider-item mui-slider-item-duplicate">
					<a href="${activityLunboList[0].url}">
					<img src="${activityLunboList[0].imgUrl}">
					</a>
				</div>
			</div>
			
			
			<div class="mui-slider-indicator">
				<c:forEach var="activityLunbo" items="${activityLunboList}" varStatus="status">
					<c:if test="${status.index==0}">
						<div class="mui-indicator mui-active"></div>
					</c:if>
					<c:if test="${status.index!=0}">
						<div class="mui-indicator"></div>
					</c:if>
				</c:forEach>
			</div>
			
		</div>
		<!-- 轮播结束 -->
		
		<div style="margin-top: 20px; margin-bottom: 10px;">
			<p style="text-align: center; color: #2b425b; font-size: 15px;">${activity.name}</p>
		</div>
		
		<!-- 顶部信息  人数  票数 -->
		<div style="padding: 10px; margin-bottom: 15px;">
			<div style="background-color: ${activity.color_}; display: flex;display: -webkit-flex; padding: 10px 0px 10px 0px;">
				<div class="top_item">
					<div class="top_item_num">${activityWorkList.size()}</div>
					<div class="top_item_tip">参与人员</div>
				</div>
				<div class="top_item">
					<div class="top_item_num">${total}</div>
					<div class="top_item_tip">累计票数</div>
				</div>
				<div class="top_item">
					<div class="top_item_num">${activity.click_}</div>
					<div class="top_item_tip">访问次数</div>
				</div>
			</div>
		</div>
		<!-- 顶部信息  人数  票数 -->
		
		<!-- 投票时间  以及摘要 -->
		<div style="padding: 10px;">
			<div style="background-color:white;padding: 10px 10px 10px 10px; box-shadow: 0 1px 1px rgba(128, 128, 128, 0.96);">
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
					<div class="desc_item_right" >
						${activity.rule_ }
					</div>
				</div>
				
				<div class="desc_item">
					<div class="desc_item_left">
						<img class="desc_item_img" src="/static/images/vote/详情.png">活动详情：
					</div>
					<div class="desc_item_right" >
						${activity.desc_ }
					</div>
				</div>
				
			</div>
		</div>
		<!-- 投票时间  以及摘要 -->
		<c:if test="${activity.guanzhu==0}">
			<div style="padding: 10px;">
				<div style="background-color:white;padding: 3px 10px 3px 10px;">
					<p style="margin-bottom: 0px; text-align: center;">请关注公众号后,投票</p>
					<img style="width: 100%;" src="${activity.erweima}" />
				</div>
			</div>
		</c:if>
		
		<!-- 搜索 -->
		<div style="padding: 10px; margin-bottom: 15px;">
			<div style="display: flex;display: -webkit-flex;">
				<input id="q" placeholder="搜索编号、方阵" class="search_input" type="text" />
				<div onclick="search()" style="background-color: ${activity.color_}" class="search_btn">搜索</div>
			</div>
		</div>
		<!-- 搜索 -->
		
		<!-- 展示 -->
		<div id="activityWorkList" style="padding: 0px 5px 0px 5px;">
			<c:forEach var="activityWork" items="${activityWorkList}" >
				<div class="show_item">
					<a href="/wap/activity/work/${activityWork.id}">
						<div class="show_item_body">
							<div>
								<img style="width: 100%;" src="${activityWork.imgUrl }" />
							</div>
							<div class="show_item_title">
								<p>${activityWork.name}</p>
							</div>
							<div style="padding: 0px 15px 0px 15px;">
								<div class="show_item_btn">
									<img style="display: inline-block; width: 15px;" src="/static/images/vote/hand.png"/>
									<span style="display: inline-block;">投票</span>
								</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
			<div style="clear:both;"></div>
		</div>
		<!-- 展示 -->
		
<div style="height: 100px;"></div>
</div>

<!-- 底部菜单 -->
<jsp:include page="/wap/vote/common/fixed_btm.jsp"/>
<jsp:include page="/wap/vote/common/check_openid.jsp"/>



</body>
</html>