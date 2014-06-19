package com.etech.template.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.etech.entity.TmajorType;
import com.etech.service.TmajorService;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 模板指令 - 下级商品分类列表
 * 
 * @author wuhuanrong
 * @version 1.0
 */
@Component("directiveWorkParentList")
public class DirectiveWorkParentList extends DirectiveBase {

	@Resource
	private TmajorService majorService;

	@SuppressWarnings("rawtypes")
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		List<TmajorType> WorkParentList = majorService.getParentWorkTypeList();
		setLocalVariable("WorkParentList", WorkParentList, env, body);
	}

}