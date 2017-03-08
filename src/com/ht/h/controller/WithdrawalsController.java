package com.ht.h.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ht.h.bean.Bank;
import com.ht.h.bean.Capital;
import com.ht.h.bean.Customer;
import com.ht.h.bean.Withdrawals;
import com.ht.h.dto.Pager;
import com.ht.h.service.interfaces.BankService;
import com.ht.h.service.interfaces.CapitalService;
import com.ht.h.service.interfaces.WithdrawalsService;

@Controller
@RequestMapping("/withdrawals")
public class WithdrawalsController {
		
	@Autowired
	private WithdrawalsService withdrawalsService;
	
	@Autowired
	private BankService bankService;
	
	@Autowired
	private CapitalService capitalService;
	
	private final SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@RequestMapping(value="/withdrawalsList") 
	public String queryAll(Withdrawals withdrawals,HttpServletRequest request,@RequestParam(value="state",required=false)String state,@RequestParam(value="page",required=false)int page){ 
		HttpSession session = request.getSession();
		Customer cus=(Customer)session.getAttribute("customer");
		Pager<Withdrawals> pager = new Pager<Withdrawals>();
		pager.setPageSize(10);
		int count = withdrawalsService.withdrawalsCountInt();
		int total = count % pager.getPageSize() == 0 ? count / pager.getPageSize() : count / pager.getPageSize() +1;
		pager.setTotal(total);
		if(page >= 1 && page <= pager.getTotal()){
			pager.setPageNo(page);
		} else if (page < 1) {
			pager.setPageNo(1);
		} else if(pager.getTotal() == 0){
			pager.setPageNo(1);
		}else{
			pager.setPageNo(pager.getTotal());
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pager.getBeginIndex());
		map.put("size", pager.getPageSize());
		List<Withdrawals> list=withdrawalsService.selectWithdrawals(map); 
		pager.setRows(list);
		request.setAttribute("witList", pager);
		request.setAttribute("count", count);
		return "/client/fundsAll";
	} 
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String save(Withdrawals withdrawals,HttpServletRequest request) throws ParseException{
		withdrawals.setWbank(request.getParameter("wbank"));
		HttpSession session = request.getSession();
		Customer cus=(Customer)session.getAttribute("customer");
		withdrawals.setUid(cus.getUid());
		withdrawals.setWstate("3");
		withdrawals.setWtime(SDF.parse(SDF.format(new Date())));
		String[] Bank = withdrawals.getWbank().split("-");
	    for (int i = 0; i < Bank.length; i++) {
	    	if(i==0){
	    		withdrawals.setWnumber(Bank[i]);
	    	}else if(i==1){
	    		withdrawals.setWbank(Bank[i]);
	    	}
		}
		withdrawalsService.insertSelective(withdrawals);
		queryAll(withdrawals, request, null, 0);
		return "/client/fundsAll";
	}
	
	@RequestMapping("/queryBank")
	@ResponseBody
	public List<Bank> queryBank(HttpServletRequest request){
		HttpSession session = request.getSession();
		Customer cus=(Customer)session.getAttribute("customer");
		List<Bank> bank=bankService.queryByUid(cus.getUid());
		request.setAttribute("bank", bank);
	    return bank;
	}
	
	@RequestMapping("/queryCapital")
	@ResponseBody
	public List<Capital> queryCapital (HttpServletRequest request){
		HttpSession session = request.getSession();
		Customer cus=(Customer)session.getAttribute("customer");
		List<Capital> capital = capitalService.queryByUid(cus.getUid());
		request.setAttribute("capital", capital);
	    return capital;
	}
	
}
