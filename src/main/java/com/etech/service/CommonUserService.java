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

import com.etech.dao.EtechComDao;
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
		List<Trecruit> recruitList=new ArrayList<Trecruit>();
		for (Iterator<TcomInfo> iterator = comInfoList.iterator(); iterator.hasNext();) {
			TcomInfo tcomInfo = (TcomInfo) iterator.next();
			if(!StringUtils.isEmpty(tcomInfo.getWorkType())){
				String hql="From Trecruit recruit where recruit.workType.id='"+tcomInfo.getWorkType().getId()+"'";
				List<Trecruit> recruits = (List<Trecruit>)etechService.findListByHQL(hql, 15);
				recruitList.addAll(recruits);
			}
		}
		if(!recruitList.isEmpty()){
			Collections.shuffle(recruitList);
			if (recruitList.size()>3) {
				recruitList.subList(0, 3);
			}
		}
		// 随机
		return recruitList;
	} 
}
