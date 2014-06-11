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
	<form id="inputForm" action="update.jhtml" method="post" enctype="multipart/form-data">
		<table class="input">
			<tr>
				<td>
					<p>资讯中心</p>
					<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
				</td>
				<td>
					<p>工作指南</p>
					<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
				</td>
				<td>
					<p>就业服务</p>
					<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
				</td>
				<td>
					<p>政策咨询</p>
					<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
				</td>
				<td>
					<p>数据频道</p>
					<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
				</td>
			</tr>
			<tr class="liebiao">
				<td>
					<table>
						<tr>
							<td>
								<p>新闻动态</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>工作动态</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>公示公告</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>图片新闻</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>视频新闻</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>专题报道</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align:top;">
					<table>
						<tr>
							<td>
								<p>机构简介</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>主要职能</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>局领导</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
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
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>招聘会</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>求职指导</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>简历指南</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>面试宝典</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>高校专题</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align:top;">
					<table>
						<tr>
							<td>
								<p>国家法律法规</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>国家政策文件</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>地方法律法规</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>地方政策文件</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
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
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>工资指导价位</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>本月需求排行</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>本月供给排行</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>下载专区</p>
								<p><input type="checkbox" name="ids">增加<input type="checkbox" name="ids">修改<input type="checkbox" name="ids">删除</p>
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
					<input type="checkbox" name="ids">系统管理
					<input type="checkbox" name="ids">管理员列表
					<input type="checkbox" name="ids">管理员分组
					<input type="checkbox" name="ids">添加管理员
					<input type="checkbox" name="ids">修改管理员
					<input type="checkbox" name="ids">删除管理员
					<input type="checkbox" name="ids">系统信息配置
					<input type="checkbox" name="ids">数据备份
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<input type="checkbox" name="ids">后台登录记录
					<input type="checkbox" name="ids">上传文件管理
					<input type="checkbox" name="ids">静态化管理
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