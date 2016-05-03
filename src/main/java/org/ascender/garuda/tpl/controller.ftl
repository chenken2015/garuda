package com.fpx.product.controller;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fpx.product.controller.base.BaseController;

@Controller
@RequestMapping("/${entityName}")
public class ${entityName}Controller extends BaseController{
	@Resource
	private I${entityName}Service ${entityName?uncap_first}Service;
	
	@RequestMapping(value = "/${entityName}Manage")
	public ModelAndView ${entityName}Manage(){
		ModelAndView view = new ModelAndView("${entityName?uncap_first}/${entityName}Manage");
    	return view;
	}
}