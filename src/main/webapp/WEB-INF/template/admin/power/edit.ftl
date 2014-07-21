<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>修改权限 - Powered By e3dmall</title>
<meta name="author" content="e3dmall Team" />
<meta name="copyright" content="e3dmall" />
<link href="/resource/public/js/admin/common.css" rel="stylesheet" type="text/css" />
<link href="/resource/public/js/admin/themes/default/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resource/public/js/admin/jquery.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/ueditor1_2_6_2/ueditor.config.js"></script><script type="text/javascript" src="/resource/public/js/admin/ueditor1_2_6_2/ueditor.all.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/common.js"></script>
<script type="text/javascript" src="/resource/public/js/admin/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $type = $("#type");
	var $contentTr = $("#contentTr");
	var $pathTr = $("#pathTr");
	var $path = $("#path");
	var $browserButton = $("#browserButton");
	var $selectAll = $("#selectAll");
	
	// 设置已有的值是选中状态。
	[#list authorities as authoritie]
		$("input[value='${authoritie.authName}']").attr("checked",true);		
	[/#list]
	
	// 全选
	$selectAll.click( function() {
		var $this = $(this);
		var $enabledIds = $("input[name='authority']:enabled");
		if ($this.prop("checked")) {
			$enabledIds.prop("checked", true);
		} else {
			$enabledIds.prop("checked", false);
		}
	});
	
	// 初始化checkbox  为不可点击。
	$("input[id='views']").each(function(){
		if($(this).is(":checked")!=true){
			var id=$(this).val().split(":")[0];
			// 设置 checkbox 为不可点击
			$("#"+id).find("tr input").each(function(){
				$(this).attr("disabled",true);
			});
			$("input[value='"+id+"']").attr("disabled",true);
		}
	})
	// 监听查看checkbox 
	$("input[id='views']").change(function(){
		// 判断是否是选中状态 true:是 false:否
		if($(this).is(":checked")!=true){
			var id=$(this).val().split(":")[0];
			// 设置 checkbox 为不勾选。
			$("#"+id).find("input:checked").each(function(){
				$(this).prop("checked",false);
			})
			$("#"+id).find("tr input").each(function(){
				$(this).prop("disabled",true);
			})
			$("input[value='"+id+"']").attr("checked",false);
			$("input[value='"+id+"']").attr("disabled",true);
		}else{
			var id=$(this).val().split(":")[0];
			$("#"+id).find("tr input").each(function(){
				$(this).attr("disabled",false);
			})
			$("input[value='"+id+"']").attr("disabled",false);
		}
	
	})
	
	// 监听单个模块的全选
	$("input[id='selectAllOne']").change(function(){
		// 判断是否是选中状态 true:是 false:否
		if($(this).is(":checked")!=true){
			$("#"+$(this).val()).find("tr input").each(function(){
					// 设置为不选中状态
					$(this).prop("checked",false);
			})
		}else{
			$("#"+$(this).val()).find("tr input").each(function(){
					// 设置为选中状态
					$(this).prop("checked",true);
			})
		}
		
	})
	
	
	
	// "类型"修改
	$type.change(function() {
		if ($type.val() == "text") {
			$contentTr.show();
			$pathTr.hide();
			$path.prop("disabled", true)
		} else {
			$contentTr.hide();
			$pathTr.show();
			$path.prop("disabled", false)
			$browserButton.unbind().browser({
				type: $type.val()
			});
		}
	});
	
	
});
</script>
<style type="text/css">
	.liebiao table{
		border:1px solid #000000;
		height:362px;
	}
	td {
	    border-bottom: 0 !important;
	}
</style>
</head>
<body>
	<div class="path">
		<a href="/admin/common/main.jhtml">首页</a> &raquo; 编辑内容
	</div>
	<form id="inputForm" action="update.jhtml" method="post" >
	<input type="hidden" name="roleId" value="${roleId}"/>
		<table class="input">
			<tr>
				<td>
					<p>资讯中心<input type="checkbox" name="authority" id="views" value="infocenter:view"/>查看
					<input type="checkbox" id="selectAllOne" value="infocenter"/>全选
					</p>
				</td>
				<td>
					<p>工作指南 <input type="checkbox" name="authority" id="views" value="workguide:view"/>查看
					<input type="checkbox" id="selectAllOne" value="workguide"/>全选
					</p>
				</td>
				<td>
					<p>就业服务 <input type="checkbox" name="authority" id="views"  value="jobserver:view"/>查看
					<input type="checkbox" id="selectAllOne" value="jobserver"/>全选
					</p>
				</td>
				<td>
					<p>政策咨询<input type="checkbox" name="authority" id="views" value="policy:view"/>查看
					<input type="checkbox" id="selectAllOne" value="policy"/>全选
					</p>
				</td>
				<td>
					<p>数据频道	<input type="checkbox" name="authority" id="views"  value="datachannel:view"/>查看
					<input type="checkbox" id="selectAllOne" value="datachannel"/>全选
					</p>
				</td>
			</tr>
			<tr class="liebiao">
				<td>
					<table  id="infocenter">
						<tr>
							<td>
								<p>新闻动态</p>
								<p>
									<input type="checkbox" name="authority" value="newsDinamic:create">增加
									<input type="checkbox" name="authority" value="newsDinamic:modify">修改
									<input type="checkbox" name="authority" value="newsDinamic:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>工作动态</p>
								<p>
									<input type="checkbox" name="authority" value="workDinamic:create">增加
									<input type="checkbox" name="authority" value="workDinamic:modify">修改
									<input type="checkbox" name="authority" value="workDinamic:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>公示公告</p>
								<p>
									<input type="checkbox" name="authority" value="infoCenterNotice:create">增加
									<input type="checkbox" name="authority" value="infoCenterNotice:modify">修改
									<input type="checkbox" name="authority" value="infoCenterNotice:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>图片新闻</p>
								<p>
									<input type="checkbox" name="authority" value="newsImg:create">增加
									<input type="checkbox" name="authority" value="newsImg:modify">修改
									<input type="checkbox" name="authority" value="newsImg:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>视频新闻</p>
								<p>
									<input type="checkbox" name="authority" value="newsVideo:create">增加
									<input type="checkbox" name="authority" value="newsVideo:modify">修改
									<input type="checkbox" name="authority" value="newsVideo:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>专题报道</p>
								<p>
									<input type="checkbox" name="authority" value="subjectReport:create">增加
									<input type="checkbox" name="authority" value="subjectReport:modify">修改
									<input type="checkbox" name="authority" value="subjectReport:delete">删除
								</p>
							</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align:top;">
					<table id="workguide">
						<tr>
							<td>
								<p>机构简介</p>
								<p>
									<input type="checkbox" name="authority" value="introduce:create">增加
									<input type="checkbox" name="authority" value="introduce:modify">修改
									<input type="checkbox" name="authority" value="introduce:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>主要职能</p>
								<p>
									<input type="checkbox" name="authority" value="mainDuty:create">增加
									<input type="checkbox" name="authority" value="mainDuty:modify">修改
									<input type="checkbox" name="authority" value="mainDuty:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>局领导</p>
								<p>
									<input type="checkbox" name="authority" value="lead:create">增加
									<input type="checkbox" name="authority" value="lead:modify">修改
									<input type="checkbox" name="authority" value="lead:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
				<td>
					<table id="jobserver">
						<tr>
							<td>
								<p>公示公告</p>
								<p>
									<input type="checkbox" name="authority" value="jobserverNotice:create">增加
									<input type="checkbox" name="authority" value="jobserverNotice:modify">修改
									<input type="checkbox" name="authority" value="jobserverNotice:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>招聘会</p>
								<p>
									<input type="checkbox" name="authority" value="recruit:create">增加
									<input type="checkbox" name="authority" value="recruit:modify">修改
									<input type="checkbox" name="authority" value="recruit:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>求职指导</p>
								<p>
									<input type="checkbox" name="authority" value="jobGuide:create">增加
									<input type="checkbox" name="authority" value="jobGuide:modify">修改
									<input type="checkbox" name="authority" value="jobGuide:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>简历指南</p>
								<p>
									<input type="checkbox" name="authority" value="resume:create">增加
									<input type="checkbox" name="authority" value="resume:modify">修改
									<input type="checkbox" name="authority" value="resume:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>面试宝典</p>
								<p>
									<input type="checkbox" name="authority" value="interview:create">增加
									<input type="checkbox" name="authority" value="interview:modify">修改
									<input type="checkbox" name="authority" value="interview:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align:top;">
					<table id="policy">
						<tr>
							<td>
								<p>国家法律法规</p>
								<p>
									<input type="checkbox" name="authority" value="countryLaws:create">增加
									<input type="checkbox" name="authority" value="countryLaws:modify">修改
									<input type="checkbox" name="authority" value="countryLaws:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>国家政策文件</p>
								<p>
									<input type="checkbox" name="authority" value="countryPolicyFile:create">增加
									<input type="checkbox" name="authority" value="countryPolicyFile:modify">修改
									<input type="checkbox" name="authority" value="countryPolicyFile:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>地方法律法规</p>
								<p>
									<input type="checkbox" name="authority" value="localLaws:create">增加
									<input type="checkbox" name="authority" value="localLaws:modify">修改
									<input type="checkbox" name="authority" value="localLaws:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>地方政策文件</p>
								<p>
									<input type="checkbox" name="authority" value="localPolicyFile:create">增加
									<input type="checkbox" name="authority" value="localPolicyFile:modify">修改
									<input type="checkbox" name="authority" value="localPolicyFile:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align:top;">
					<table id="datachannel">
						<tr>
							<td>
								<p>供求分析报告</p>
								<p>
									<input type="checkbox" name="authority" value="requireAnalyseReport:create">增加
									<input type="checkbox" name="authority" value="requireAnalyseReport:modify">修改
									<input type="checkbox" name="authority" value="requireAnalyseReport:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>工资指导价位</p>
								<p>
									<input type="checkbox" name="authority" value="salaryGuide:create">增加
									<input type="checkbox" name="authority" value="salaryGuide:modify">修改
									<input type="checkbox" name="authority" value="salaryGuide:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>本月需求排行</p>
								<p>
									<input type="checkbox" name="authority" value="thisMonRequire:create">增加
									<input type="checkbox" name="authority" value="thisMonRequire:modify">修改
									<input type="checkbox" name="authority" value="thisMonRequire:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>本月供给排行</p>
								<p>
									<input type="checkbox" name="authority" value="thisMonApply:create">增加
									<input type="checkbox" name="authority" value="thisMonApply:modify">修改
									<input type="checkbox" name="authority" value="thisMonApply:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>下载专区</p>
								<p>
									<input type="checkbox" name="authority" value="downloadZone:create">增加
									<input type="checkbox" name="authority" value="downloadZone:modify">修改
									<input type="checkbox" name="authority" value="downloadZone:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<p>幻灯片<input type="checkbox" name="authority" id="views" value="slide:view"/>查看
					<input type="checkbox" id="selectAllOne" value="slide"/>全选
					</p>
				</td>
				<td>
					<p>服务功能<input type="checkbox" name="authority" id="views"  value="service:view"/>查看
					<input type="checkbox" id="selectAllOne" value="service"/>全选
					</p>
				</td>
				<td>
					<p>内容审核<input type="checkbox" name="authority" id="views"  value="content:view"/>查看
					<input type="checkbox" id="selectAllOne" value="content"/>全选
					</p>
				</td>
				<td>
					<p>资源审核<input type="checkbox" name="authority" id="views" value="resource:view"/>查看
					<input type="checkbox" id="selectAllOne" value="resource"/>全选
					</p>
				</td>
				<td>
					<p>系统设置<input type="checkbox" name="authority" id="views" value="systemSetting:view">查看
					<input type="checkbox" id="selectAllOne" value="systemSetting"/>全选
					</p>
				</td>
			</tr>
			
			<tr class="liebiao">
				<td>
					<table id="slide">
						<tr>
							<td style="vertical-align:top;">
								<p>幻灯片</p>
								<p>
									<input type="checkbox" name="authority" value="slide:create">增加
									<input type="checkbox" name="authority" value="slide:modify">修改
									<input type="checkbox" name="authority" value="slide:delete">删除
								</p>
							</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align:top;">
					<table id="service">
						<tr>
							<td>
								<p>业务办理</p>
								<p>
									<input type="checkbox" name="authority" value="busHandle:create">增加
									<input type="checkbox" name="authority" value="busHandle:modify">修改
									<input type="checkbox" name="authority" value="busHandle:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>局长信箱</p>
								<p>
									<input type="checkbox" name="authority" value="mailBox:create">增加
									<input type="checkbox" name="authority" value="mailBox:modify">修改
									<input type="checkbox" name="authority" value="mailBox:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>网站论坛</p>
								<p>
									<input type="checkbox" name="authority" value="forum:create">增加
									<input type="checkbox" name="authority" value="forum:modify">修改
									<input type="checkbox" name="authority" value="forum:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>友情链接</p>
								<p>
									<input type="checkbox" name="authority" value="links:create">增加
									<input type="checkbox" name="authority" value="links:modify">修改
									<input type="checkbox" name="authority" value="links:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
				<td>
					<table id="content">
						<tr>
							<td>
								<p>企业审核</p>
								<p>
									<input type="checkbox" name="authority" value="enterpriseAudit:modify">修改
									<input type="checkbox" name="authority" value="enterpriseAudit:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>招聘岗位审核</p>
								<p>
									<input type="checkbox" name="authority" value="stationAudit:modify">修改
									<input type="checkbox" name="authority" value="stationAudit:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align:top;">
					<table id="resource">
						<tr>
							<td>
								<p>企业</p>
								<p>
									<input type="checkbox" name="authority" value="enterpriseList:modify">修改
									<input type="checkbox" name="authority" value="enterpriseList:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>求职者</p>
								<p>
									<input type="checkbox" name="authority" value="jobSeekersList:modify">修改
									<input type="checkbox" name="authority" value="jobSeekersList:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>招聘岗位</p>
								<p>
									<input type="checkbox" name="authority" value="stationList:modify">修改
									<input type="checkbox" name="authority" value="stationList:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align:top;">
					<table id="systemSetting">
						<tr>
							<td>
								<p>管理员管理</p>
								<p>
									<input type="checkbox" name="authority" value="admin:create">添加
									<input type="checkbox" name="authority" value="admin:modify">修改
									<input type="checkbox" name="authority" value="admin:delete">删除
								</p>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td colspan="5">
					<input type="submit" class="button" value="提交" />
					<input type="button" id="backButton" class="button" value="返回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>