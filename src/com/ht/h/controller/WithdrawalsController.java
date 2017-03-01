package com.ht.h.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ht.h.bean.PageBean;
import com.ht.h.bean.Withdrawals;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.WithdrawalsService;
import com.ht.h.util.ResponseUtil;

import net.sf.json.JSONArray;
		
@Controller
@RequestMapping("/withdrawals")
public class WithdrawalsController {
		
	@Autowired
	private WithdrawalsService withdrawalsService;
		
	/**
	 * 跳转到提现列表
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(){
			
		return "withdrawals/withdrawalsList";
	}
		
	@RequestMapping(value="/withdrawalsList",method=RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> expenditureList(Withdrawals withdrawals,@RequestParam(value="page",required=false)String page,
			@RequestParam(value="rows",required=false)String rows,HttpServletResponse response,String username) throws Exception{ 
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows)); 
		Map<String, Object> map=new HashMap<>(); 
		map.put("username", StringUtil.formatLike(username)); 
		map.put("wnumber", StringUtil.formatLike(withdrawals.getWnumber())); 
		map.put("wbank", StringUtil.formatLike(withdrawals.getWbank())); 
		map.put("start", pageBean.getStart()); 
		map.put("size", pageBean.getPageSize()); 
		List<Withdrawals> list=withdrawalsService.selectWithdrawals(map); 
		Long total=withdrawalsService.getTotal(map); 
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(list);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null; 
	} 
	
	@RequestMapping(value="/add") 
	public String add(Withdrawals withdrawals,HttpServletRequest request){
		System.out.println("111111111");
		int wit = withdrawalsService.insert(withdrawals);
		request.setAttribute("wit", wit);
		return "views/client/funds";
	}
	
}
