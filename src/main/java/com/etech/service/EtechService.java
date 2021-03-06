package com.etech.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etech.dao.EtechComDao;
import com.etech.util.Page;
import com.etech.util.Pageable;

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
	public Object findObjectByProperty(Class<?> clazz, Object property, Object value) {
		return etechComDao.getObjectByProperty(clazz, property, value);
	}
	public List<?> getListByProperty(Class<?> clazz, Object property,Object value){
		return etechComDao.getListByProperty(clazz, property, value);
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
	
	public List<?> findListByHQL(String hql){
		return (List<?>)etechComDao.getObjecListByHQL(hql);
	}
	public List<?> findListByHQL(String hql,Integer num){
		return etechComDao.getPageDateList(hql, num);
	}
	public void saveOrUpdata(Object object){
		etechComDao.saveOrUpdata(object);
	}
	public void delete(String hql){
		etechComDao.delete(hql);
	}
	@SuppressWarnings("rawtypes")
	public Page search(Class<?> clazz,String key,String[] fields,Pageable pageable){
		return etechComDao.getListByHSearchPage(clazz, key, fields,pageable);
	}
	public void updata(Class<?> clazz,String property,Object value,String updateProperty,Object updateValue){
		etechComDao.update(clazz, property, value, updateProperty, updateValue);
	}
	public void deleteBySQL(String sql){
		etechComDao.deleteBySQL(sql);
	}
	public List<?> getListByProperty(Class<?> clazz,String property, Object value, int num) {
		return (List<?>) etechComDao.getListByProperty(clazz, property, value,num);
	}
	public List<?> getListByClass(Class<?> clazz,Integer num){
		return etechComDao.getListByClass(clazz,num);
	}

	public void update(String hql) {
		etechComDao.update(hql);
		
	}

	public Object findObjectByHql(String hql) {
		return etechComDao.getObjectByHQL(hql);
	}
	@SuppressWarnings("rawtypes")
	public Page getPage(String hql, Pageable pageable){
		return etechComDao.getPage(hql, pageable);
	}
}
