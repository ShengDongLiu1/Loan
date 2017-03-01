package com.ht.h.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ht.h.bean.Loan;
import com.ht.h.bean.PageBean;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.LoanService;

@Controller
@RequestMapping("/loan")
public class LoanController {
	
	@Resource
	private LoanService loanService;
	
	/**
	 * 跳转到所有借款
	 * @return
	 */
	@RequestMapping("/toLoanList1")
	public String toLoanList1(HttpServletRequest request){
		request.setAttribute("lstate", "");
		return "loan/loanList";
	}
	
	/**
	 * 跳转到招标中的借款
	 * @param request
	 * @return
	 */
	@RequestMapping("/toLoanList2")
	public String toLoanList2(HttpServletRequest request){
		request.setAttribute("lstate", "2");
		return "loan/loanList";
	}
	
	/**
	 * 满标借款
	 * @param request
	 * @return
	 */
	@RequestMapping("/toLoanList3")
	public String toLoanList3(HttpServletRequest request){
		request.setAttribute("lstate", "3");
		return "loan/loanList";
	}
	
	/**
	 * 借款列表
	 * @param loan
	 * @param page
	 * @param rows
	 * @param username
	 * @return
	 */
	@RequestMapping(value="/loanList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> loanList(Loan loan,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,String username){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<>();
		map.put("username", StringUtil.formatLike(username));
		map.put("ltitle", StringUtil.formatLike(loan.getLtitle()));
		map.put("ltype", loan.getLtype());
		map.put("lterm", loan.getLterm());
		map.put("lstate", loan.getLstate());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Loan> loanList=loanService.queryAll(map);
		Long total=loanService.getTotal(map);
		map.put("rows", loanList);
		map.put("total", total);
		return map;
	}
}
