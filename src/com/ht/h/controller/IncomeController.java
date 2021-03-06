package com.ht.h.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.ht.h.bean.Income;
import com.ht.h.bean.PageBean;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.IncomeService;

@Controller
@RequestMapping("/income")
public class IncomeController {
	
	@Resource
	private IncomeService incomeService;
	
	/**
	 * 跳转到收入列表
	 * @return
	 */
	@RequestMapping(value="/toIncList")
	public String toIncomeList(){
		return "income/incList";
	}
	
	/**
	 * 收入列表
	 * @param income
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value="/incomeList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> incomeList(Income income,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,String username){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<>();
		map.put("username", StringUtil.formatLike(username));
		map.put("itype", StringUtil.formatLike(income.getItype()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Income> incList=incomeService.queryAll(map);
		Long total=incomeService.getTotal(map);
		map.put("rows", incList);
		map.put("total", total);
		return map;
	}

	/**
	 * 收入报表统计
	 */
	@RequestMapping(value="/statementAll")
	public String statementAll(HttpServletRequest request){
		List<Income> incomes=incomeService.statementAll();
		request.setAttribute("statementAll", incomes);
		return "statement/income";	
	}
}
