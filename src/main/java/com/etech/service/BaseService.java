package com.etech.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etech.dao.EtechComDao;

@Service
public class BaseService {
	@Resource
	private EtechComDao etechComDao;

	/** 以对象方式保存 */
	public void saveOrUpdate(Object object) {
		etechComDao.saveOrUpdateByObject(object);
	}

	/** 根据id获取对象 */
	public void findObjectById(Class<?> clazz, Integer id) {
		etechComDao.getObjecById(clazz, id);
	}

	/** 根据id删除对象 */
	public void deleteObjectById(Class<?> clazz, Integer id) {
		etechComDao.deleteObjectById(clazz, id);
	}
}
