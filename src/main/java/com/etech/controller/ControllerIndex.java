package com.etech.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControllerIndex {
 private static Log log=LogFactory.getLog(ControllerIndex.class);
 @RequestMapping(value="/",method=RequestMethod.GET)
   public String index(){
	   log.debug("current controller is ControllerIndex !");
	   return "index";
   }
}
