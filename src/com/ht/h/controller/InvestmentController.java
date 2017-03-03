package com.ht.h.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ht.h.service.interfaces.InvestmentService;

@Controller
@RequestMapping(value="investment")
public class InvestmentController {

	@Autowired
	private InvestmentService investmentService;
	
	@RequestMapping("toubiao")
	@ResponseBody
	public Map<String, Object> toubiao(){
		Map<String, Object> map = new HashMap<>();		
		
		return null;
		
	}
}
