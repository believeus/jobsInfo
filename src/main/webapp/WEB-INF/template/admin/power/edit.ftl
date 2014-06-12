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
<script type="text/javascript" src="/resource/public/js/admin/kindeditor.js"></script>
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
	
	
	
	// 全选
	$selectAll.click( function() {
		var $this = $(this);
		var $enabledIds = $("input[name='ids']:enabled");
		if ($this.prop("checked")) {
			$enabledIds.prop("checked", true);
		} else {
			$enabledIds.prop("checked", false);
		}
	});
	
	
	
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
	
	// 表单验证
	$inputForm.validate({
		rules: {
			title: "required",
			adPositionId: "required",
			path: "required",
			order: "digits"
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
					<p>资讯中心</p>
					<p>
						<input type="checkbox" name="ids" value="infocenter:create"/>增加
						<input type="checkbox" name="ids" value="infocenter:modify"/>修改
						<input type="checkbox" name="ids" value="infocenter:delete"/>删除
					</p>
				</td>
				<td>
					<p>工作指南</p>
					<p>
					   <input type="checkbox" name="ids" value="workguide:create"/>增加
					   <input type="checkbox" name="ids" value="workguide:modify"/>修改
					   <input type="checkbox" name="ids" value="workguide:delete"/>删除
					 </p>
				</td>
				<td>
					<p>就业服务</p>
					<p>
					  <input type="checkbox" name="ids" value="jobserver:create"/>增加
					  <input type="checkbox" name="ids" value="jobserver:modify"/>修改
					  <input type="checkbox" name="ids" value="jobserver:delete"/>删除
					 </p>
				</td>
				<td>
					<p>政策咨询</p>
					<p>
						<input type="checkbox" name="ids" value="policy:create"/>增加
						<input type="checkbox" name="ids" value="policy:modify"/>修改
						<input type="checkbox" name="ids" value="policy:delete"/>删除
					</p>
				</td>
				<td>
					<p>数据频道</p>
					<p>
						<input type="checkbox" name="ids" value="datachannel:create"/>增加
						<input type="checkbox" name="ids" value="datachannel:modify"/>修改
						<input type="checkbox" name="ids" value="datachannel:delete"/>删除
					</p>
				</td>
			</tr>
			<tr class="liebiao">
				<td>
					<table>
						<tr>
							<td>
								<p>新闻动态</p>
								<p>
									<input type="checkbox" name="ids" value="newsDinamic:create">增加
									<input type="checkbox" name="ids" value="newsDinamic:modify">修改
									<input type="checkbox" name="ids" value="newsDinamic:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>工作动态</p>
								<p>
									<input type="checkbox" name="ids" value="workDinamic:create">增加
									<input type="checkbox" name="ids" value="workDinamic:modify">修改
									<input type="checkbox" name="ids" value="workDinamic:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>公示公告</p>
								<p>
									<input type="checkbox" name="ids" value="infoCenterNotice:create">增加
									<input type="checkbox" name="ids" value="infoCenterNotice:modify">修改
									<input type="checkbox" name="ids" value="infoCenterNotice:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>图片新闻</p>
								<p>
									<input type="checkbox" name="ids" value="newsImg:create">增加
									<input type="checkbox" name="ids" value="newsImg:modify">修改
									<input type="checkbox" name="ids" value="newsImg:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>视频新闻</p>
								<p>
									<input type="checkbox" name="ids" value="newsVideo:create">增加
									<input type="checkbox" name="ids" value="newsVideo:modify">修改
									<input type="checkbox" name="ids" value="newsVideo:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>专题报道</p>
								<p>
									<input type="checkbox" name="ids" value="subjectReport:create">增加
									<input type="checkbox" name="ids" value="subjectReport:modify">修改
									<input type="checkbox" name="ids" value="subjectReport:delete">删除
								</p>
							</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align:top;">
					<table>
						<tr>
							<td>
								<p>机构简介</p>
								<p>
									<input type="checkbox" name="ids" value="introduce:create">增加
									<input type="checkbox" name="ids" value="introduce:modify">修改
									<input type="checkbox" name="ids" value="introduce:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>主要职能</p>
								<p>
									<input type="checkbox" name="ids" value="mainDuty:create">增加
									<input type="checkbox" name="ids" value="mainDuty:modify">修改
									<input type="checkbox" name="ids" value="mainDuty:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>局领导</p>
								<p>
									<input type="checkbox" name="ids" value="lead:create">增加
									<input type="checkbox" name="ids" value="lead:modify">修改
									<input type="checkbox" name="ids" value="lead:delete">删除
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
					<table>
						<tr>
							<td>
								<p>公示公告</p>
								<p>
									<input type="checkbox" name="ids" value="jobserverNotice:create">增加
									<input type="checkbox" name="ids" value="jobserverNotice:modify">修改
									<input type="checkbox" name="ids" value="jobserverNotice:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>招聘会</p>
								<p>
									<input type="checkbox" name="ids" value="recruit:create">增加
									<input type="checkbox" name="ids" value="recruit:modify">修改
									<input type="checkbox" name="ids" value="recruit:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>求职指导</p>
								<p>
									<input type="checkbox" name="ids" value="jobGuide:create">增加
									<input type="checkbox" name="ids" value="jobGuide:modify">修改
									<input type="checkbox" name="ids" value="jobGuide:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>简历指南</p>
								<p>
									<input type="checkbox" name="ids" value="resume:create">增加
									<input type="checkbox" name="ids" value="resume:modify">修改
									<input type="checkbox" name="ids" value="resume:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>面试宝典</p>
								<p>
									<input type="checkbox" name="ids" value="interview:create">增加
									<input type="checkbox" name="ids" value="interview:modify">修改
									<input type="checkbox" name="ids" value="interview:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>高校专题</p>
								<p>
									<input type="checkbox" name="ids" value="collegeSubject:create">增加
									<input type="checkbox" name="ids" value="collegeSubject:modify">修改
									<input type="checkbox" name="ids" value="collegeSubject:delete">删除
								</p>
							</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align:top;">
					<table>
						<tr>
							<td>
								<p>国家法律法规</p>
								<p>
									<input type="checkbox" name="ids" value="countryLaws:create">增加
									<input type="checkbox" name="ids" value="countryLaws:modify">修改
									<input type="checkbox" name="ids" value="countryLaws:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>国家政策文件</p>
								<p>
									<input type="checkbox" name="ids" value="countryPolicyFile:create">增加
									<input type="checkbox" name="ids" value="countryPolicyFile:modify">修改
									<input type="checkbox" name="ids" value="countryPolicyFile:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>地方法律法规</p>
								<p>
									<input type="checkbox" name="ids" value="localLaws:create">增加
									<input type="checkbox" name="ids" value="localLaws:modify">修改
									<input type="checkbox" name="ids" value="localLaws:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>地方政策文件</p>
								<p>
									<input type="checkbox" name="ids" value="localPolicyFile:create">增加
									<input type="checkbox" name="ids" value="localPolicyFile:modify">修改
									<input type="checkbox" name="ids" value="localPolicyFile:delete">删除
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
					<table>
						<tr>
							<td>
								<p>供求分析报告</p>
								<p>
									<input type="checkbox" name="ids" value="requireAnalyseReport:create">增加
									<input type="checkbox" name="ids" value="requireAnalyseReport:modify">修改
									<input type="checkbox" name="ids" value="requireAnalyseReport:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>工资指导价位</p>
								<p>
									<input type="checkbox" name="ids" value="salaryGuide:create">增加
									<input type="checkbox" name="ids" value="salaryGuide:modify">修改
									<input type="checkbox" name="ids" value="salaryGuide:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>本月需求排行</p>
								<p>
									<input type="checkbox" name="ids" value="thisMonRequire:create">增加
									<input type="checkbox" name="ids" value="thisMonRequire:modify">修改
									<input type="checkbox" name="ids" value="thisMonRequire:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>本月供给排行</p>
								<p>
									<input type="checkbox" name="ids" value="thisMonApply:create">增加
									<input type="checkbox" name="ids" value="thisMonApply:modify">修改
									<input type="checkbox" name="ids" value="thisMonApply:delete">删除
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>下载专区</p>
								<p>
									<input type="checkbox" name="ids" value="downloadZone:create">增加
									<input type="checkbox" name="ids" value="downloadZone:modify">修改
									<input type="checkbox" name="ids" value="downloadZone:delete">删除
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
				<td colspan="5">系统管理设置</td>
			</tr>
			<tr>
				<td colspan="5">
					<input type="checkbox" name="ids" value="adminList:view">管理员列表
					<input type="checkbox" name="ids" value="adminList:group">管理员分组
					<input type="checkbox" name="ids" value="admin:create">添加管理员
					<input type="checkbox" name="ids" value="admin:modify">修改管理员
					<input type="checkbox" name="ids" value="admin:delete">删除管理员
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<input type="checkbox" name="ids">上传文件管理
					<input type="checkbox" id="selectAll">全选
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