<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.member.view")} - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>

<style type="text/css">
	td{
		text-align : right;
	}
</style>

</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a>[#if member?exists]${member.username}[#else]${upMember.username}[/#if]的业绩
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="${upMember.username}" onclick="reloadRUL(${upMember.id})"/>
		</li>
    	[#if level = 2]
    		<input type="button" value="${member.username}" tabselected=true/>                		
    	[/#if]
    	[#if level = 3]                		
            [@member_find_by_wwmallid wwmallid = member.pid_a]
            	<input type="button" value="${e3dMember.username}" onclick="reloadRUL2(${e3dMember.id})"/>
            [/@member_find_by_wwmallid]
            <input type="button" value="${member.username}" tabselected=true/>
    	[/#if]
	</ul>
	
	<table class="input">
		<tr>
			<th>
				分销商姓名
			</th>
			<th>
				分销商推广号
			</th>
			<th>
				下级分销商数量
			</th>
			<th>
				分销商佣金
			</th>
			<th>
				为${upMember.username}提供的佣金
			</th>
		</tr>
		[#list page.content as member]
		<tr>
			<td>
				[#if level!=3 && member.distributorCount_a > 0]
					<a href="/admin/member/performance2.jhtml?id=${member.id}">${member.username}</a>
				[#else]
					${member.username}						
				[/#if]
			</td>
			<td>
				[#if level!=3 && member.distributorCount_a > 0]
					<a href="/admin/member/performance2.jhtml?id=${member.id}">${member.wwmallid}</a>
				[#else]
					${member.wwmallid}						
				[/#if]
			</td>
			<td>
				${member.distributorCount_a}
			</td>		
			<td>
				${member.totalBrokerage}
			</td>		
			<td>
				${member.commission_total_A}
			</td>				
		</tr>
		[/#list]
	</table>
</body>

<script type="text/javascript">
	/**
	*	zx
	*/

	$(function(){
		var initialIndex = 0;
		var tab = $("#tab");
		tab.find("input").each(function(index,obj){
			if($(obj).attr("tabselected")){
				initialIndex = index;
			}
		});
		tab.tabs("table.tabContent, div.tabContent", {
			tabs: "input",
			initialIndex:initialIndex,
			event:""
		});
	});	
	
	function reloadRUL(id){
		var zhang = window.parent.parent;
		var zhang1 = zhang[2];
		zhang1.location.href  = "/admin/member/performance.jhtml?id=" + id;
	}
	function reloadRUL2(id){
		var zhang = window.parent.parent;
		var zhang1 = zhang[2];
		zhang1.location.href  = "/admin/member/performance2.jhtml?id=" + id;
	}
	 
</script>

</html>