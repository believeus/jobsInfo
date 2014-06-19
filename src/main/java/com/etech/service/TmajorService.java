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
		String hql="from TmajorType major where (major.codeId%10000)=0 and major.codeId>=10000 and major.codeId<=999999";
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
		String hql="from TmajorType major where (major.codeId%100000)=0 and major.codeId >=1000000 and major.codeId<=9999999";
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
		public static void main(String[] args) {
			int q=10000;
			int a=20100;
			System.out.println(a%q);
		}
}
