package com.etech.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.etech.dao.EtechComDao;

@Service
public class EtechService {
	@Resource
	private EtechComDao etechComDao;

	/** 以对象方式保存 */
	public void saveOrUpdate(Object object) {
		etechComDao.saveOrUpdateByObject(object);
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
	public Object findObjectByHql(String hql){
		return etechComDao.getObjectByHQL(hql);
	}
}
