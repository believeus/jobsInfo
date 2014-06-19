package com.etech.template.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.etech.entity.TmajorType;
import com.etech.service.TmajorService;
import com.etech.util.UtilsFreemarker;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 模板指令 - 上级商品分类列表
 * 
 * @author wuhuanrong
 * @version 1.0
 */
@Component("directiveWorkChildrenList")
public class DirectiveWorkChildrenList extends DirectiveBase {

	@Resource
	private TmajorService majorService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		int parentCodeId = UtilsFreemarker.getParameter("parentCodeId", Integer.class, params);
		List<TmajorType> WorkChildrenList = majorService.getChileWorkTypeList(parentCodeId); 
		setLocalVariable("WorkChildrenList",WorkChildrenList, env, body);
	}

}