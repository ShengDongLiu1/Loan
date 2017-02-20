package com.ht.h.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ht.h.bean.Capital;
import com.ht.h.service.interfaces.CapitalService;

@Controller
@RequestMapping("capital")
public class CapitalController {
	
	@Autowired
	private CapitalService capitalService;
	
	@RequestMapping("capitalPage")
	public String index(Model model){
		List<Capital> list = null;
		return "capital/capitalPage";
	}
	
	

}
