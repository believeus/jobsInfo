package com.etech.controller.admin;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
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
import org.springframework.web.util.HtmlUtils;

import com.etech.entity.TdataCenter;
import com.etech.service.EtechService;
import com.etech.util.JsonOutToBrower;
import com.etech.util.Page;
import com.etech.util.Pageable;

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
					storepath="/resource/public/images/6551-A40C-4FDA-8D55-87265167B506.jpg";
					break;
				}
				count++;
				Assert.assertNotNull("upload file InputStream is null", inputStream);
				String originName=file.getOriginalFilename();
				String extention = originName.substring(originName.lastIndexOf(".") + 1);
				log.debug("upload file stuffix:"+extention);
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
		
		String title=request.getParameter("title");
		title=HtmlUtils.htmlEscape(title);
		String author=request.getParameter("author");
		author=HtmlUtils.htmlEscape(author);
		String powerLevel = request.getParameter("powerLevel");
		String powerProperty = request.getParameter("powerProperty");
		/**Begin Author:wuqiwei Data:2014-06-19 Email:1058633117@qq.com AddReason:需要事先对可能破坏 HTML 文档结构的动态数据进行转义处理*/
		String content=request.getParameter("content");
		/**End Author:wuqiwei Data:2014-06-19 Email:1058633117@qq.com AddReason:需要事先对可能破坏 HTML 文档结构的动态数据进行转义处理*/
		String top=request.getParameter("top");
		String alink=request.getParameter("alink");
		
		System.out.println("======================新闻标题："+title+"===================");
		
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
		if (powerLevel != null) {
			center.setPowerLevel(Integer.parseInt(powerLevel));
		}else {
			center.setPowerLevel(0);
		}
		if (powerProperty != null) {
			center.setPowerProperty(Integer.parseInt(powerProperty));
		}else {
			center.setPowerProperty(0);
		}
		if(!StringUtils.isEmpty(storepath)){
			center.setImgpath(storepath);
		}
		center.setCreateTime(System.currentTimeMillis());
		etechService.merge(center);
	}
	// 更新信息
	public void updataDataInfo(TdataCenter formDataCenter,HttpServletRequest request) {
		
		// 与这两个值相关的都是对视频新闻的操作。
		String suffix = request.getParameter("suffix");
		String oldUrl = request.getParameter("oldUrl");
		
		String type = request.getParameter("type");
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		BufferedImage bi;
		int width = 800;
		int height = 575;
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		int count=0;
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0){
				}else {					
					count++;
					Assert.assertNotNull("upload file InputStream is null", inputStream);
					String originName=file.getOriginalFilename();
					String extention = originName.substring(originName.lastIndexOf(".") + 1);
					log.debug("upload file stuffix:"+extention);
					if (count>1) {
						storepath += "#";
					}
					storepath += mydfsTrackerServer.upload(inputStream, extention);
					bi = ImageIO.read(file.getInputStream());
					width = bi.getWidth();
					height = bi.getHeight();
					System.out.println(width+"==="+height);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (count==1) {
			if(!StringUtils.isEmpty(suffix)){
				int i = Integer.parseInt(suffix); 
				String[] split = oldUrl.split("#");
				if (i==0) {
					storepath+="#"+split[i+1];
				}else {
					storepath=split[i-1]+"#"+storepath;					
				}
			}
		}
		log.debug("是否置顶top:"+formDataCenter.getTop());
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, formDataCenter.getId());
		if(!StringUtils.isEmpty(type)){
			// 判断是否是图片新闻
			if (type.equals("3")) {
				if(!StringUtils.isEmpty(storepath)) {
					storepath+="#"+dataCenter.getImgpath();
				}
			}
		}
		formDataCenter.setImgpath(storepath);
		if(StringUtils.isEmpty(storepath)) {
			formDataCenter.setImgpath(dataCenter.getImgpath());
		}
		String title=request.getParameter("title");
		title=HtmlUtils.htmlEscape(title);
		String author=request.getParameter("author");
		author=HtmlUtils.htmlEscape(author);
		formDataCenter.setTitle(title);
		formDataCenter.setAuthor(author);
		formDataCenter.setEditTime(System.currentTimeMillis());
		formDataCenter.setCreateTime(dataCenter.getCreateTime());
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
	
	// 分页信息列表
	public Page<?> pageDataInfo(HttpServletRequest request,int type,Pageable pageable) throws UnsupportedEncodingException {
		String hql="";
		String searchValue = request.getParameter("searchValue");
		
		if (!StringUtils.isEmpty(searchValue)) {
			searchValue=searchValue.trim();
			log.debug("根据title查询："+searchValue);
			hql="From TdataCenter center where center.type='"+type+"' ";
			if(!StringUtils.isEmpty(searchValue)){
				hql+="and title like '%"+searchValue+"%'";
			}
			hql+=" order by editTime desc";
			
		}else {
			hql="From TdataCenter center where center.type='"+type+"' order by center.top desc,center.editTime desc";			
		}
		Page<?> page = etechService.getPage(hql, pageable);
		request.setAttribute("searchValue", searchValue);
		return page;
	}
	
	// 置顶
	public boolean top(int id){
		etechService.updata(TdataCenter.class, "id", id,"top", 1);
		return true;
	}
	// 取消置顶
	public boolean unTop(int id){
		etechService.updata(TdataCenter.class,"id", id, "top", 0);
		return true;
	}
	
	// 查询置顶的新闻
	@SuppressWarnings("unchecked")
	public List<?> listDataInfoByTop(HttpServletRequest request, int type) {
		String hql="From TdataCenter center where center.type='"+type+"' and center.top = '1'";
		List<?> dataCenters = (List<TdataCenter>)etechService.findObjectList(hql, 1, 15, TdataCenter.class);
		return dataCenters;
	}
	// 保存信息 主题报道
	public void savaDataInfoforsp(HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		String storepath = "";
		String[] strings=new String[2];
		int count=0;
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0){
					storepath="resource/public/images/zt_topImg.png";
					strings[count++]=storepath;
				}else {					
					Assert.assertNotNull("upload file InputStream is null", inputStream);
					String originName=file.getOriginalFilename();
					String extention = originName.substring(originName.lastIndexOf(".") + 1);
					log.debug("upload file stuffix:"+extention);
					storepath = mydfsTrackerServer.upload(inputStream, extention);
					strings[count++]=storepath;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		TdataCenter center=new TdataCenter();
		int type=0;
		if(!StringUtils.isEmpty(request.getParameter("type"))){
			type=Integer.parseInt(request.getParameter("type"));
		}
		
		String title=request.getParameter("title");
		title=HtmlUtils.htmlEscape(title);
		String author=request.getParameter("author");
		author=HtmlUtils.htmlEscape(author);
		/**Begin Author:wuqiwei Data:2014-06-19 Email:1058633117@qq.com AddReason:需要事先对可能破坏 HTML 文档结构的动态数据进行转义处理*/
		String content=request.getParameter("content");
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
		storepath="";
		for (String string : strings) {
			if (!(StringUtils.isEmpty(string))) {
				storepath+=string+"#";				
			}
		}
		if(!StringUtils.isEmpty(storepath)){
			center.setImgpath(storepath);
		}
		center.setCreateTime(System.currentTimeMillis());
		etechService.merge(center);
	}
	// 更新信息 专题报道
	public void updataDataInfoforsp(TdataCenter formDataCenter,HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		String[] strings=formDataCenter.getImgpath().split("#");
		int count=0;
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0){
					if (StringUtils.isEmpty(strings[count])) {
						storepath="resource/public/images/zt_topImg.png";
						strings[count]=storepath;						
					}
				}else {					
					Assert.assertNotNull("upload file InputStream is null", inputStream);
					String originName=file.getOriginalFilename();
					String extention = originName.substring(originName.lastIndexOf(".") + 1);
					log.debug("upload file stuffix:"+extention);
					storepath += mydfsTrackerServer.upload(inputStream, extention);
					strings[count]=storepath;
				}
				count++;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		log.debug("是否置顶top:"+formDataCenter.getTop());
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, formDataCenter.getId());
		storepath="";
		for (String str : strings) {
			if (!(StringUtils.isEmpty(str))) {
				storepath+=str+"#";				
			}
		}
		if(StringUtils.isEmpty(storepath)) {
			formDataCenter.setImgpath(dataCenter.getImgpath());
		}else {			
			formDataCenter.setImgpath(storepath);
		}
		String title=request.getParameter("title");
		title=HtmlUtils.htmlEscape(title);
		String author=request.getParameter("author");
		author=HtmlUtils.htmlEscape(author);
		formDataCenter.setTitle(title);
		formDataCenter.setAuthor(author);
		formDataCenter.setEditTime(System.currentTimeMillis());
		formDataCenter.setCreateTime(dataCenter.getCreateTime());
		BeanUtils.copyProperties(formDataCenter, dataCenter);
		etechService.merge(dataCenter);
	}
	// 保存信息 幻灯片
	public void savaDataInfoforsd(HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		String[] strings=new String[2];
		int count=0;
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0){
					storepath="resource/public/images/6551-A40C-4FDA-8D55-87265167B506.jpg";
					strings[count++]=storepath;
				}else {
					Assert.assertNotNull("upload file InputStream is null", inputStream);
					String originName=file.getOriginalFilename();
					String extention = originName.substring(originName.lastIndexOf(".") + 1);
					log.debug("upload file stuffix:"+extention);
					storepath = mydfsTrackerServer.upload(inputStream, extention);
					strings[count++]=storepath;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		int type=Integer.parseInt(request.getParameter("type"));
		String title1=request.getParameter("title1");
		title1=HtmlUtils.htmlEscape(title1);
		String alink1=request.getParameter("alink1");
		String title2=request.getParameter("title2");
		title2=HtmlUtils.htmlEscape(title2);
		String alink2=request.getParameter("alink2");
		TdataCenter center=new TdataCenter();
		center.setType(type);
		center.setTitle(title1+"#"+title2);
		center.setAlink(alink1+"#"+alink2);
		center.setAuthor("");
		center.setContent("");
		center.setTop(0);
		center.setImgpath(strings[0]+"#"+strings[1]);
		center.setCreateTime(System.currentTimeMillis());
		center.setEditTime(System.currentTimeMillis());		
	
		etechService.merge(center);
	}
	// 更新信息 幻灯片
	public void updataDataInfoforsd(TdataCenter formDataCenter,HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		String[] strings=formDataCenter.getImgpath().split("#");
		int count=0;
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0){
					if (StringUtils.isEmpty(strings[count])) {
						storepath="resource/public/images/6551-A40C-4FDA-8D55-87265167B506.jpg";
						strings[count]=storepath;						
					}
				}else {					
					Assert.assertNotNull("upload file InputStream is null", inputStream);
					String originName=file.getOriginalFilename();
					String extention = originName.substring(originName.lastIndexOf(".") + 1);
					log.debug("upload file stuffix:"+extention);
					storepath += mydfsTrackerServer.upload(inputStream, extention);
					strings[count]=storepath;
				}
				count++;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, formDataCenter.getId());
		String title1=request.getParameter("title1");
		title1=HtmlUtils.htmlEscape(title1);
		String alink1=request.getParameter("alink1");
		String title2=request.getParameter("title2");
		title2=HtmlUtils.htmlEscape(title2);
		String alink2=request.getParameter("alink2");
		dataCenter.setTitle(title1+"#"+title2);
		dataCenter.setAlink(alink1+"#"+alink2);
		dataCenter.setImgpath(strings[0]+"#"+strings[1]);
		dataCenter.setEditTime(System.currentTimeMillis());
		
		etechService.merge(dataCenter);
	}
	// 保存信息 文件下载
	public void savaDataInfofordl(HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0){
					storepath="/resource/public/images/6551-A40C-4FDA-8D55-87265167B506.jpg";
					break;
				}
				Assert.assertNotNull("upload file InputStream is null", inputStream);
				String originName=file.getOriginalFilename();
				String extention = originName.substring(originName.lastIndexOf(".") + 1);
				log.debug("upload file stuffix:"+extention);
				storepath=originName+"#";
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
		
		String title=request.getParameter("title");
		title=HtmlUtils.htmlEscape(title);
		String author=request.getParameter("author");
		author=HtmlUtils.htmlEscape(author);
		/**Begin Author:wuqiwei Data:2014-06-19 Email:1058633117@qq.com AddReason:需要事先对可能破坏 HTML 文档结构的动态数据进行转义处理*/
		String content=request.getParameter("content");
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
	// 更新信息 文件下载
	public void updataDataInfofordl(TdataCenter formDataCenter,HttpServletRequest request) {
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0){
				}else {					
					Assert.assertNotNull("upload file InputStream is null", inputStream);
					String originName=file.getOriginalFilename();
					String extention = originName.substring(originName.lastIndexOf(".") + 1);
					log.debug("upload file stuffix:"+extention);
					storepath = originName+"#";
					storepath += mydfsTrackerServer.upload(inputStream, extention);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		TdataCenter dataCenter=(TdataCenter)etechService.findObjectById(TdataCenter.class, formDataCenter.getId());
		formDataCenter.setImgpath(storepath);
		if(StringUtils.isEmpty(storepath)) {
			formDataCenter.setImgpath(dataCenter.getImgpath());
		}
		String title=request.getParameter("title");
		title=HtmlUtils.htmlEscape(title);
		String author=request.getParameter("author");
		author=HtmlUtils.htmlEscape(author);
		formDataCenter.setTitle(title);
		formDataCenter.setAuthor(author);
		formDataCenter.setEditTime(System.currentTimeMillis());
		formDataCenter.setCreateTime(dataCenter.getCreateTime());
		BeanUtils.copyProperties(formDataCenter, dataCenter);
		etechService.merge(dataCenter);
	}
}
