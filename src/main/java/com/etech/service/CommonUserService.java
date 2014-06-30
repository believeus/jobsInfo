package com.etech.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import com.etech.entity.TcomInfo;
import com.etech.entity.Trecruit;

@Service
public class CommonUserService {
	private static final Log log=LogFactory.getLog(CommonUserService.class);
	@Resource
	private EtechService etechService;
	/*Begin Author:wuqiwei Data:2014-06-18 AddReason:根据填写的志愿信息获取推荐企业*/
	@SuppressWarnings("unchecked")
	public List<Trecruit> enterpriseRecommend(List<TcomInfo> comInfoList){
		List<String> workTypeIds=new ArrayList<String>();
		// 遍历该用户获取用户填写的志愿信息
		for (Iterator<TcomInfo> iterator = comInfoList.iterator(); iterator.hasNext();) {
			TcomInfo tcomInfo = (TcomInfo) iterator.next();
			if(!StringUtils.isEmpty(tcomInfo.getWorkType())){
				workTypeIds.add(String.valueOf(tcomInfo.getWorkType().getId()));
			}
		}
		// 查询志愿信息获取招聘信息
		if(!workTypeIds.isEmpty()){
			String ids=workTypeIds.toString().replace("[", "(").replaceAll("]", ")");
			String hql="From Trecruit recruit left join fetch recruit.entUser  where recruit.workType.id in "+ids+"";
			log.debug(hql);
			List<Trecruit> recruits = (List<Trecruit>)etechService.findListByHQL(hql, 15);
			// 随机获取三个招聘职位
			if(!recruits.isEmpty()){
				// 随机
				Collections.shuffle(recruits);
				if (recruits.size()>3) {
					recruits.subList(0, 3);
				}
			}
			return recruits;
		}
		return null;
	}
}
