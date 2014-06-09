[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.order.list")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $listForm = $("#listForm");
	var $filterSelect = $("#filterSelect");
	var $filterOption = $("#filterOption a");
	var $print = $("select[name='print']");

	[@flash_message /]
	
	// 订单筛选
	$filterSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	// 筛选选项
	$filterOption.click(function() {
		var $this = $(this);
		var $dest = $("#" + $this.attr("name"));
		if ($this.hasClass("checked")) {
			$dest.val("");
		} else {
			$dest.val($this.attr("val"));
		}
		$listForm.submit();
		return false;
	});
	
	// 打印选择
	$print.change(function() {
		var $this = $(this);
		if ($this.val() != "") {
			window.open($this.val());
		}
	});
	
	$("#year").find("option[value='${year}']").attr("selected",true);
	$("#month").find("option[value='${month}']").attr("selected",true);

});

	function setYear(obj){
		$("input[name=year]").val(obj.value);
		filterSubmit();
	}

	function setMonth(obj){
		$("input[name=month]").val(obj.value);
		filterSubmit();
	}

	function filterSubmit(){
		var year = $("input[name=year]").val();
		var month = $("input[name=month]").val();
		if(!("" == year || "-" == year) && !("" == month || "-" == month)){
			$("#filterForm").submit();
		}
	}
	
</script>
<style type="text/css">
	.tableinfo{

	}
	.tableinfo tr th{
		text-align:right;
		padding-left:30px;
	}
	.tableinfo tr td{
		padding-left:5px;
	}
	.tableinfo tr strong {
    	color: #CC0000;
    	font-weight: bold;
	}
</style>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.order.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="filterForm"  method="get">
		<input type="hidden" name="year" value="${year}">
		<input type="hidden" name="month" value="${month}">
	</form>
	<form id="listForm" action="list.jhtml" method="get">
		<input type="hidden" id="orderStatus" name="orderStatus" value="${orderStatus}" />
		<input type="hidden" id="paymentStatus" name="paymentStatus" value="${paymentStatus}" />
		<input type="hidden" id="shippingStatus" name="shippingStatus" value="${shippingStatus}" />
		<input type="hidden" id="hasExpired" name="hasExpired" value="[#if hasExpired??]${hasExpired?string("true", "false")}[/#if]" />
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						${message("admin.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if page.pageSize == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 20] class="current"[/#if] val="20">20</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 50] class="current"[/#if] val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 100] class="current"[/#if] val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${page.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if page.searchProperty == "sn"] class="current"[/#if] val="sn">${message("Order.sn")}</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table class="tableinfo">
					<tr>
						<td>
								
								<select id="year" onchange="setYear(this)">
									<option>
									-
									</option>
									<option value="2014">
										2014		
									</option>
									<option value="2015">
										2015		
									</option>
									<option value="2016">
										2016		
									</option>
									<option value="2017">
										2017		
									</option>
									<option value="2018">
										2018		
									</option>
									<option value="2019">
										2019		
									</option>
									<option value="2020">
										2020		
									</option>
									<option value="2021">
										2021		
									</option>
								</select>
							年
						</td>
						<td>
								<select id="month" onchange="setMonth(this)">
										<option>
										-
										</option>
										<option value="0">
											1
										</option>
										<option value="1">
											2
										</option>
										<option value="2">
											3
										</option>
										<option value="3">
											4
										</option>
										<option value="4">
											5
										</option>
										<option value="5">
											6
										</option>
										<option value="6">
											7
										</option>
										<option value="7">
											8
										</option>
										<option value="8">
											9
										</option>
										<option value="9">
											10
										</option>
										<option value="10">
											11
										</option>
										<option value="11">
											12
										</option>
								</select>
							月
						</td>
						<td>
							<strong><span style="font-size:14px">统计：</span></strong>
							奖金池：<strong>￥<span>${bonusPonds}</span></strong>，
							网站推广奖金：<strong>￥<span>${commissionCompanys}</span></strong>，
							总和：<strong>￥<span>${total}</span></strong>
						</td>
					</tr>
				</table>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="sn">${message("Order.sn")}</a>
				</th>
				<th>
					<span>${message("Order.amount")}</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="member">${message("Order.member")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="member">奖金池</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="member">佣金</a>
				</th>
				<th>
					汇款方式
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">${message("admin.common.createDate")}</a>
				</th>
				[@shiro.hasPermission name = "admin:print"]
					<th>
						<span>${message("admin.order.print")}</span>
					</th>
				[/@shiro.hasPermission]
			</tr>
			[#list page.content as brokerage]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${brokerage.order.id}" />
					</td>
					<td>
						${brokerage.order.sn}
					</td>
					<td>
						${currency(brokerage.order.amount, true)}
					</td>
					<td>
						[#if brokerage.order.member?exists]
							${brokerage.order.member.username}
						[#else]
							${brokerage.order.email}					
						[/#if]
					</td>
					<td>
						${currency(brokerage.bonusPond, true)}
					</td>
					<td>
						${currency(brokerage.commission_company, true)}
					</td>
					<td>
						${brokerage.order.paymentMethodName}
					</td>
					<td>
						<span title="${brokerage.order.createDate?string("yyyy-MM-dd HH:mm:ss")}">${brokerage.order.createDate}</span>
					</td>
					[@shiro.hasPermission name = "admin:print"]
						<td>
							<select name="print">
								<option value="">${message("admin.common.choose")}</option>
								<option value="../print/order.jhtml?id=${brokerage.order.id}">${message("admin.order.orderPrint")}</option>
								<option value="../print/product.jhtml?id=${brokerage.order.id}">${message("admin.order.productPrint")}</option>
								<option value="../print/shipping.jhtml?id=${brokerage.order.id}">${message("admin.order.shippingPrint")}</option>
								<option value="../print/delivery.jhtml?orderId=${brokerage.order.id}">${message("admin.order.deliveryPrint")}</option>
							</select>
						</td>
					[/@shiro.hasPermission]
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>