package com.etech.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etech.dao.EtechComDao;

@Service
public class EtechService {
	@Resource
	private EtechComDao etechComDao;

	/** 以对象方式保存 */
	public void merge(Object object) {
		etechComDao.merge(object);
	}

	/** 根据id获取对象 */
	public Object findObjectById(Class<?> clazz, Integer id) {
		return etechComDao.getObjecById(clazz, id);
	}
	/** 根据属性获取对象 */
	public Object findObjectByProperty(Class<?> clazz, Object witchProperty, Object propertyValue) {
		return etechComDao.getObjectByProperty(clazz, witchProperty, propertyValue);
	}

	/** 根据id删除对象 */
	public void deleteObjectById(Class<?> clazz, Integer id) {
		etechComDao.delete(clazz, id);
	}
	public void delete(Class<?> clazz,String property,final Object value){
		etechComDao.delete(clazz, property, value);
	}
	public List<?> findObjectList(String hql,int currentPage,int perPageCount,Class<?> clazz){
		return (List<?>) etechComDao.getPageDateList(hql, currentPage, perPageCount, clazz);
	}
	
	public List<?> findObjectByList(String hql){
		return (List<?>)etechComDao.getObjecListByHQL(hql);
	}
	public void saveOrUpdata(Object object){
		etechComDao.saveOrUpdata(object);
	}
	public void delete(String hql){
		etechComDao.delete(hql);
	}
}
