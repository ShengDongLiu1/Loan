package com.ht.h.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ht.h.bean.Expenditure;
import com.ht.h.bean.PageBean;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.ExpenditureService;

@Controller
@RequestMapping("/expenditure")
public class ExpenditureController {
	@Resource
	private ExpenditureService expenditureService;
	
	/**
	 * 跳转到支出列表
	 * @return
	 */
	@RequestMapping(value="/toExpendList")
	public String toExpendList(){
		return "expenditure/expendList";
	}
	
	/**
	 * 支出列表
	 * @param income
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value="/expenditureList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> expenditureList(Expenditure expenditure,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,String username){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<>();
		map.put("username", StringUtil.formatLike(username));
		map.put("itype", StringUtil.formatLike(expenditure.getEtype()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Expenditure> incList=expenditureService.queryAll(map);
		Long total=expenditureService.getTotal(map);
		map.put("rows", incList);
		map.put("total", total);
		return map;
	}
}
