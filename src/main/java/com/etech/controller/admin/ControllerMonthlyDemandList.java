package com.etech.controller.admin;

import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.etech.service.EtechService;
import com.etech.util.Page;
import com.etech.util.Pageable;

/**
 * 月需求排行
 * */
@Controller
@RequestMapping("/admin/monthlyDemandList")
public class ControllerMonthlyDemandList extends ControllerCRUD{

	@Resource
	private EtechService etechService;
	/**
	 * 每月需求排行列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String newsListView(HttpServletRequest request) {
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		
		// 每页多少行数据
		String hql = "from Trecruit recruit left join fetch recruit.workType "
				    + "where recruit.status=1 and recruit.entUser.status=1 and recruit.entUser.disable=0 "
				    + "group by FROM_UNIXTIME(recruit.editTime/1000, '%Y-%m') order by FROM_UNIXTIME(recruit.editTime/1000, '%Y-%m') desc";
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("monthlyDemandList", page);
		return "admin/rankList/list";
	}
	
	/**
	 * 查看某月需求排行
	 * @return
	 */
	@RequestMapping(value = "/monthyDemandList")
	public String list(HttpServletRequest request,String year,String month){
		 //当前页
        String pageNumber = request.getParameter("pageNumber");
        // 如果为空，则设置为1
        if (StringUtils.isEmpty(pageNumber)) {
                pageNumber="1";
        }
        Pattern regex = Pattern.compile("0[1-9]");
        Matcher matcher = regex.matcher(month);
        if(matcher.find()){
                month = matcher.group().replace("0", "");
        }
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR,Integer.valueOf(year));
        cal.set(Calendar.MONTH, (Integer.valueOf(month)-1));
        
        cal.set(Calendar.DAY_OF_MONTH, 1);
        long beginTime = cal.getTimeInMillis();
        
        cal.add(Calendar.MONTH, 1);  
        cal.set(Calendar.DAY_OF_MONTH, 0);
        long endTime=cal.getTimeInMillis();
   		String hql = "from Trecruit recruit "
   			   + "where recruit.editTime >='"+beginTime+"' and recruit.editTime <='"+endTime+"' "
   			   + "and recruit.status=1 and recruit.entUser.status=1 and recruit.entUser.disable=0 "
   			   + "group by recruit.jobPost order by count(recruit.jobPost) desc";
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),null);
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("demand", page);
		return "admin/rankList/monthyList";
	}
	/**
	 * 删除
	 * @param request response
	 * @return
	 */
	@RequiresPermissions("thisMonRequire:delete")
	@RequestMapping("/delete")
	public String removeNews(HttpServletRequest request,HttpServletResponse response){
		super.deleteDataInfo(request,response);
		return "redirect:/admin/monthlyDemandList/list.jhtml";
	}
	
	
}
