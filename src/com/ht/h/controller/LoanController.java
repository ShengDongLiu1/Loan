package com.ht.h.controller;

import java.util.Date;
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

import com.ht.h.bean.Customer;
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
	 * 借款审批
	 * @param request
	 * @return
	 */
	@RequestMapping("/toLoanList4")
	public String toLoanList4(HttpServletRequest request){
		request.setAttribute("lstate", "1");
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
		map.put("lclass", loan.getLclass());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Loan> loanList=loanService.queryAll(map);
		Long total=loanService.getTotal(map);
		map.put("rows", loanList);
		map.put("total", total);
		return map;
	}
	
	/**
	 * 客户申请借款
	 * @param loan
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/addLoan",method=RequestMethod.POST)
	public String addLoan(Loan loan,HttpServletRequest request,HttpSession session){
		Customer customer=(Customer) session.getAttribute("customer");
		if(customer == null){
			return "redirect:/client/login";
		}
		loan.setUid(customer.getUid());
		loan.setLstate("1");
		loan.setLtime(new Date());
		System.out.println("抵押类型："+loan.getLclass());
		int result=loanService.insertSelective(loan);
		if(result > 0){
			request.setAttribute("result", "申请已提交！");
		}else{
			request.setAttribute("result", "申请提交失败！");
		}
		return "redirect:/client/borrow";
	}
	
	/**
	 * 查询用户自己的借款
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/selCusLoan",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selCusLoan(Loan loan,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpSession session){
		PageBean pageBean=null;
		if(page == null || rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String, Object> map=new HashMap<>();
		Customer customer=(Customer) session.getAttribute("customer");
		if(customer == null){
			map.put("error", "请先登录！");
			return map;
		}
		map.put("uid", customer.getUid());
		map.put("ltitle", StringUtil.formatLike(loan.getLtitle()));
		map.put("ltype", loan.getLtype());
		map.put("lterm", loan.getLterm());
		map.put("lstate", loan.getLstate());
		map.put("lclass", loan.getLclass());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Loan> loanList=loanService.queryAll(map);
		Long total=loanService.getTotal(map);
		pageBean.setTotal(Integer.valueOf(total.toString()));
		map.put("loanList", loanList);
		map.put("total", total);		//记录总条数
		map.put("count",pageBean.getCount());//共几页
		map.put("page", pageBean.getPage());//当前页
		map.put("pageSize", pageBean.getPageSize());//一页显示的个数
		return map;
	}
	
	/**
	 * 修改借款状态
	 * @param loan
	 * @return
	 */
	@RequestMapping(value="/succLoan",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> upState(Loan loan){
		Map<String, Object> map=new HashMap<>();
		int resultCount=loanService.updateByPrimaryKeySelective(loan);
		if(resultCount > 0){
			map.put("result", "success");
		}else{
			map.put("result", "faild");
		}
		return map;
		
	}
}
