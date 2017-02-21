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

import com.ht.h.bean.PageBean;
import com.ht.h.bean.Repayment;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.RepaymentService;

@Controller
@RequestMapping("/repayment")
public class RepaymentController {
	@Resource
	private RepaymentService repaymentService;
	
	@RequestMapping("/toRepayList")
	public String toRepayList(){
		return "repayment/repayList";
	}
	
	/**
	 * 借款列表
	 * @param loan
	 * @param page
	 * @param rows
	 * @param username
	 * @return
	 */
	@RequestMapping(value="/repayList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> repayList(Repayment repayment,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,String username,String ltitle){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<>();
		map.put("username", StringUtil.formatLike(username));
		map.put("ltitle", StringUtil.formatLike(ltitle));
		map.put("rstate", repayment.getRstate());
		map.put("reperiods", repayment.getReperiods());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Repayment> repayList=repaymentService.queryAll(map);
		Long total=repaymentService.getTotal(map);
		map.put("rows", repayList);
		map.put("total", total);
		return map;
	}
}
