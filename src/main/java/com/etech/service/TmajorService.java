package com.etech.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;
import com.etech.entity.TmajorType;

@Service
public class TmajorService {
	@Resource
	private EtechComDao etechComDao;
	//查询专业的父级别
	public List<TmajorType> getParentMajorList(){
		String hql="from TmajorType major where major.codeId  REGEXP '[0-9]{1,2}0000'";
		@SuppressWarnings("unchecked")
		List<TmajorType> majors = (List<TmajorType>) etechComDao.getObjecListByHQL(hql);
		return majors;
	}
	// 查询专业的子级
	public List<TmajorType> getChileMajorList(int parentCodeId){
		String hql="from TmajorType major where major.codeId >"+parentCodeId +"and major.codeId <="+(parentCodeId+9999);
		@SuppressWarnings("unchecked")
		List<TmajorType> majors = (List<TmajorType>) etechComDao.getObjecListByHQL(hql);
		return majors;
	}
	//查询工种的父级
	public List<TmajorType> getParentWorkTypeList(){
		String hql="from TmajorType major where major.codeId  REGEXP '[0-9]{2}00000'";
		@SuppressWarnings("unchecked")
		List<TmajorType> majors = (List<TmajorType>) etechComDao.getObjecListByHQL(hql);
		return majors;
	}
	//查询工种的父级
		public List<TmajorType> getChileWorkTypeList(int parentCodeId){
			String hql="from TmajorType major where major.codeId >"+parentCodeId +"and major.codeId <="+(parentCodeId+99999);
			@SuppressWarnings("unchecked")
			List<TmajorType> majors = (List<TmajorType>) etechComDao.getObjecListByHQL(hql);
			return majors;
		}
}
