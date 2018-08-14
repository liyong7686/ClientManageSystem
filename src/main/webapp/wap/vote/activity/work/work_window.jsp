<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL -->

<div id="mask" style="display: none;">
	<div style="overflow: hidden; flex:1;-webkit-flex:1;">
	</div>
	<div style="border-radius: 9px; width: 75%; margin: 0 auto; background-color: white; padding:10px 0px 0px 0px; ">
		<p style="margin-bottom: 0px; text-align: center; color: black; ">长按二维码-关注公众号</p>
		<p style="margin-bottom: 0px; text-align: center; color: black; ">按提示操作投票</p>
		<img id="ewm" style="width: 100%;" src="${activity.erweima}"  />
		<img style="width: 100%;"  src="${activity.guanzhu_tip}"  />
		<div onclick="close_mask()" style="width: 100%; margin: 0 auto; background-color: #D4D4D4; text-align: center; line-height: 40px;color: #397543; font-weight: bold; border-bottom-right-radius: 9px; border-bottom-left-radius: 9px; ">
			关闭
		</div>
	</div>
	<div style="overflow: hidden; flex:1;-webkit-flex:1;">
	</div>
</div>

<div id="gift_window" style="display: none;" >
	<div style="overflow: hidden; flex:1;-webkit-flex:1;">
	</div>
	<div style="width: 100%;background-color: #ccc; ">
		<div id="list" style="padding: 5px 5px 5px 5px; overflow: hidden;">
			<c:forEach var="activityGift" items="${activityGiftList}" >
				<div class="gift_item" id="${activityGift.id}">
					<div  class="gift_item_wrap">
						<img src="${activityGift.imgUrl}" />
						<div class="gift_item_price">¥${activityGift.price }元</div>
						<div class="gift_item_name">${activityGift.name }</div>
						<div class="gift_item_detail">票数+${activityGift.num }</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="padding: 5px 5px 5px 5px;">
			<div onclick="pay_gift()" class="pay_btn">付款</div>
		</div>
		<div style="padding: 5px 5px 5px 5px;">
			<div onclick="close_gift_window()" class="pay_close_btn">关闭</div>
		</div>
	</div>
	<div style="overflow: hidden; flex:1;-webkit-flex:1;">
	</div>
</div>
