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

import com.etech.entity.TcomUser;
import com.etech.entity.Trecruit;

@Service
public class EnterpriseUserService {
	private static final Log log=LogFactory.getLog(EnterpriseUserService.class);
	@Resource
	private EtechService etechService;
	// 企业人才推荐
	@SuppressWarnings("unchecked")
	public List<TcomUser> talentRecommend(List<Trecruit> recruitList){
		List<String> workTypeIds=new ArrayList<String>();
		for (Iterator<Trecruit> iterator = recruitList.iterator(); iterator.hasNext();) {
			Trecruit recruit = (Trecruit) iterator.next();
			if(!StringUtils.isEmpty(recruit.getWorkType())){
				log.debug("workType.id:"+recruit.getWorkType().getId());
				workTypeIds.add(String.valueOf(recruit.getWorkType().getId()));
			}
		}
		if(!workTypeIds.isEmpty()){
			String ids=workTypeIds.toString().replace("[", "(").replaceAll("]", ")");
			String hql="from TcomUser user inner join fetch user.comInfo userInfo  where  userInfo.workType.id in "+ids+"";
			log.debug(hql);
			List<TcomUser> comUserList=(List<TcomUser>)etechService.findListByHQL(hql, 15);
			if(!comUserList.isEmpty()){
				Collections.shuffle(comUserList);
				//如果个数大于三则截取三个
				if (comUserList.size()>3) {
					comUserList.subList(0, 3);
				}
			}
			return comUserList;
		}
		return null;
	}
}
