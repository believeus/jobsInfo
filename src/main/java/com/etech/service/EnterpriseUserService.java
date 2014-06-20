package com.etech.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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
	public List<TcomUser> talentRecommend(List<Trecruit> recruitList){
		List<TcomUser> userList=new ArrayList<TcomUser>();
		List<TcomUser> users=new ArrayList<TcomUser>();
		String hql="";
		for (Iterator<Trecruit> iterator = recruitList.iterator(); iterator.hasNext();) {
			Trecruit recruit = (Trecruit) iterator.next();
			log.debug("workspace:"+recruit.getWorkspace()+" workType:"+recruit.getWorkType());
			//匹配度最高的符合工作地区,又符合工作类型
			if(!StringUtils.isEmpty(recruit.getWorkspace())&&!StringUtils.isEmpty(recruit.getWorkType())){
				hql="from TcomUser user inner join fetch user.comInfo userInfo  where  userInfo.workType.id='"+recruit.getWorkType().getId()+"' "
						+ "and userInfo.workspace='"+recruit.getWorkspace()+"'";
				log.debug(hql);
				users = (List<TcomUser>)etechService.findListByHQL(hql, 3);
				if(!users.isEmpty()){
					userList.addAll(users);
				}
				// 查找到匹配度最高的就不往下查找了
				if(userList.size()>=3){
					Collections.shuffle(userList);
					continue;
				}
			}
			//只匹配工作类型
			if(userList.size()<3&&!StringUtils.isEmpty(recruit.getWorkType())){
				userList.addAll(users);
				hql="from TcomUser user inner join fetch user.comInfo userInfo  where  userInfo.workType.id='"+recruit.getWorkType().getId()+"'";
				log.debug(hql);
				userList.addAll((List<TcomUser>)etechService.findListByHQL(hql, (3-userList.size())));
				//去重复
				 Set h = new HashSet(userList);
				 userList.clear();
				 userList.addAll(h);
				 Collections.shuffle(userList);
				 if(userList.size()<3){
					 return userList;
				 }
				 // 随机取三个
				 userList.subList(0, 3);
			}
		}
		return userList;
	}
}
