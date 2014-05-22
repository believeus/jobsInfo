package com.etech.template.directive;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import com.etech.util.UtilsFreemarker;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;

/**
 * 模板指令 - 基类
 * 
 * @author e3dmall Team
 * @version 1.0
 */
public abstract class DirectiveBase implements TemplateDirectiveModel {

	/** "ID"参数名称 */
	private static final String ID_PARAMETER_NAME = "id";
	/** "数量"参数名称 */
	private static final String COUNT_PARAMETER_NAME = "count";


	/**
	 * 获取ID
	 * 
	 * @param params
	 *            参数
	 * @return ID
	 */
	protected Long getId(Map<String, TemplateModel> params) throws TemplateModelException {
		return UtilsFreemarker.getParameter(ID_PARAMETER_NAME, Long.class, params);
	}

	/**
	 * 获取数量
	 * 
	 * @param params
	 *            参数
	 * @return 数量
	 */
	protected Integer getCount(Map<String, TemplateModel> params) throws TemplateModelException {
		return UtilsFreemarker.getParameter(COUNT_PARAMETER_NAME, Integer.class, params);
	}


	/**
	 * 设置局部变量
	 * 
	 * @param variables
	 *            变量
	 * @param env
	 *            Environment
	 * @param body
	 *            TemplateDirectiveBody
	 */
	protected void setLocalVariables(Map<String, Object> variables, Environment env, TemplateDirectiveBody body) throws TemplateException, IOException {
		Map<String, Object> sourceVariables = new HashMap<String, Object>();
		for (String name : variables.keySet()) {
			TemplateModel sourceVariable = UtilsFreemarker.getVariable(name, env);
			sourceVariables.put(name, sourceVariable);
		}
		UtilsFreemarker.setVariables(variables, env);
		body.render(env.getOut());
		UtilsFreemarker.setVariables(sourceVariables, env);
	}
	
}