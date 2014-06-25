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
		List<TcomUser> userList=new ArrayList<TcomUser>();
		for (Iterator<Trecruit> iterator = recruitList.iterator(); iterator.hasNext();) {
			Trecruit recruit = (Trecruit) iterator.next();
			if(!StringUtils.isEmpty(recruit.getWorkType())){
				int workType=recruit.getWorkType().getId();
				String hql="from TcomUser user inner join fetch user.comInfo userInfo  where  userInfo.workType.id='"+workType+"'";
				userList.addAll((List<TcomUser>)etechService.findListByHQL(hql, 15));
			}
		}
		if(!userList.isEmpty()){
			Collections.shuffle(userList);
			//如果个数大于三则截取三个
			if (userList.size()>3) {
				userList.subList(0, 3);
			}
		}
		return userList;
	}
}
