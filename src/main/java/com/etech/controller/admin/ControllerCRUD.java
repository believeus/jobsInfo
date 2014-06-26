package com.etech.controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mydfs.storage.server.MydfsTrackerServer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Assert;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;

@Component
public class ControllerCRUD {
	private static final Log log=LogFactory.getLog(ControllerCRUD.class);
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	@Resource
	private EtechService etechService;
	// 保存信息
	public void savaDataInfo(HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		int count=0;
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0){
					storepath="/group/M00/01/21/6551-A40C-4FDA-8D55-87265167B506.jpg";
					break;
				}
				count++;
				Assert.assertNotNull("upload file InputStream is null", inputStream);
				String fileName = file.getName();
				String extention = fileName.substring(fileName.lastIndexOf(".") + 1);
				log.debug("upload file stuffix"+extention);
				if (count>1) {
					storepath += "#";
				}
				storepath += mydfsTrackerServer.upload(inputStream, extention);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		TdataCenter center=new TdataCenter();
		int type=0;
		if(!StringUtils.isEmpty(request.getParameter("type"))){
			type=Integer.parseInt(request.getParameter("type"));
		}
		if (count==1) {
			if(!StringUtils.isEmpty(request.getParameter("suffix"))){
				int suffix=Integer.parseInt(request.getParameter("suffix"));
				String string = request.getParameter("oldUrl");
				String[] split = string.split("#");
				if (suffix==0) {
					storepath+=split[suffix+1];
				}else {
					storepath=split[suffix]+storepath;					
				}
			}
		}
		System.out.println(storepath);
		System.out.println(center.getImgpath());
		String title=request.getParameter("title");
		String author=request.getParameter("author");
		/**Begin Author:wuqiwei Data:2014-06-19 Email:1058633117@qq.com AddReason:需要事先对可能破坏 HTML 文档结构的动态数据进行转义处理*/
		String content=request.getParameter("content");
		System.out.println("**************************************************");
		System.out.println(content);
		if (content.contains("div")) {
			System.out.println("nimei");
		}
		System.out.println("**************************************************");
		/**End Author:wuqiwei Data:2014-06-19 Email:1058633117@qq.com AddReason:需要事先对可能破坏 HTML 文档结构的动态数据进行转义处理*/
		String top=request.getParameter("top");
		String alink=request.getParameter("alink");
		if (top == null) {
			top = "0";
		}
		center.setType(type);
		center.setTitle(title);
		center.setAuthor(author);
		center.setContent(content);
		center.setEditTime(System.currentTimeMillis());
		center.setTop(Integer.valueOf(top));
		center.setAlink(alink);
		if(!StringUtils.isEmpty(storepath)){
			center.setImgpath(storepath);
		}
		center.setCreateTime(System.currentTimeMillis());
		etechService.merge(center);
	}
	// 更新信息
	public void updataDataInfo(TdataCenter formDataCenter,HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0)break;
				Assert.assertNotNull("upload file InputStream is null", inputStream);
				String fileName = file.getName();
				String extention = fileName.substring(fileName.lastIndexOf(".") + 1);
				log.debug("upload file stuffix"+extention);
				storepath = mydfsTrackerServer.upload(inputStream, extention);
				formDataCenter.setImgpath(storepath);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		log.debug("是否置顶top:"+formDataCenter.getTop());
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, formDataCenter.getId());
		formDataCenter.setEditTime(System.currentTimeMillis());
		BeanUtils.copyProperties(formDataCenter, dataCenter);
		etechService.merge(dataCenter);
	}
	//删除信息
	public void deleteDataInfo(HttpServletRequest request,HttpServletResponse response) {
		String[] ids = request.getParameterValues("ids");
		if(!StringUtils.isEmpty(ids)){
			List<String> idList=new ArrayList<String>();
			for(String id : ids){
				idList.add(id);
			}
			String values=idList.toString().replace("[","(").replace("]", ")");
			String hql="delete from TdataCenter where id in "+values;
			etechService.delete(hql);
		}
		//删除后页面刷新
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("type", "success");
		JsonOutToBrower.out(map, response);
	}
	// 信息列表
	public List<?> listDataInfo(HttpServletRequest request,int type) {
		// 查询新闻动态
		String hql="From TdataCenter center where center.type='"+type+"' order by editTime desc";
		@SuppressWarnings("unchecked")
		List<?> dataCenters = (List<TdataCenter>)etechService.findObjectList(hql, 1, 15, TdataCenter.class);
		return dataCenters;
	}
	// 置顶
	public boolean top(int id){
		etechService.updata(TdataCenter.class, "top", 1, "id", id);
		return true;
	}
	// 取消置顶
	public boolean unTop(int id){
		etechService.updata(TdataCenter.class, "top", 0, "id", id);
		return true;
	}
	
	// 查询置顶的新闻
	@SuppressWarnings("unchecked")
	public List<?> listDataInfoByTop(HttpServletRequest request, int type) {
		String hql="From TdataCenter center where center.type='"+type+"' and center.top = '1'";
		List<?> dataCenters = (List<TdataCenter>)etechService.findObjectList(hql, 1, 15, TdataCenter.class);
		return dataCenters;
	}
}
