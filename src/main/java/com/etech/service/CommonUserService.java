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
	private EtechComDao etechComDao;

	public EtechComDao getEtechComDao() {
		return etechComDao;
	}

	public void setEtechComDao(EtechComDao etechComDao) {
		this.etechComDao = etechComDao;
	}
	/*Begin Author:wuqiwei Data:2014-06-18 AddReason:根据填写的志愿信息获取推荐企业*/
	@SuppressWarnings("unchecked")
	public List<Trecruit> enterpriseRecommend(List<TcomInfo> comInfoList){
		List<Trecruit> recruitList=new ArrayList<Trecruit>();
		String hql=null;
		List<Trecruit> recruits=new ArrayList<Trecruit>();
		for (Iterator<TcomInfo> iterator = comInfoList.iterator(); iterator.hasNext();) {
			TcomInfo tcomInfo = (TcomInfo) iterator.next();
			if(!StringUtils.isEmpty(tcomInfo.getWorkspace())){
				hql="From Trecruit recruit "
				    + "where recruit.workType.id="+tcomInfo.getWorkType().getId()+" "
				    + "and recruit.workspace='"+tcomInfo.getWorkspace()+"'";
				log.debug(hql);
				// 查询三个
				recruits=(List<Trecruit>) etechComDao.getPageDateList(hql, 3);
				if(!StringUtils.isEmpty(recruits)){
					recruitList.addAll(recruits);
				}
			}
			// 不够三个再查,直到填满三个为止
			if(recruits.isEmpty() || recruits.size()<3){
				hql="From Trecruit recruit where recruit.workType.id='"+tcomInfo.getWorkType().getId()+"'";
				log.debug(hql);
				recruitList.addAll((List<Trecruit>) etechComDao.getPageDateList(hql, 3-(recruits.size())));
			}
		}
		if(!StringUtils.isEmpty(recruitList)){
			//去重复
			 Set<Trecruit> h = new HashSet<Trecruit>(recruitList);
			 recruitList.clear();
			 recruitList.addAll(h);
			 // 随机取三个
			 Collections.shuffle(recruitList);
			 // 元素个数大于3
			 if(recruitList.size()>3){
				 recruitList.subList(0, 3);
			// 元素个数小于3
			 }else {
				return recruitList;
			}
		}
		return recruitList;
	} 
}
