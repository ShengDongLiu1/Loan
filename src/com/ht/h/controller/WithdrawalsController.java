package com.ht.h.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ht.h.bean.Bank;
import com.ht.h.bean.Capital;
import com.ht.h.bean.Customer;
import com.ht.h.bean.PageBean;
import com.ht.h.bean.Withdrawals;
import com.ht.h.dto.Pager;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.BankService;
import com.ht.h.service.interfaces.CapitalService;
import com.ht.h.service.interfaces.WithdrawalsService;
import com.ht.h.util.ResponseUtil;
import com.mchange.util.IntChecklist;

import net.sf.json.JSONArray;

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
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("username", cus.getUsername());
		long c = withdrawalsService.getTotal(map);
		int count= (int) c ;
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
	
	/**
	 * 跳转到提现审核
	 * @return
	 */
	@RequestMapping(value="/elist",method=RequestMethod.GET)
	public String elist(){
			
		return "withdrawals/withdrawalsExamine";
	}
	
	/**
	 * 提现审核列表信息
	 * @return
	 */
	@RequestMapping(value="/withdrawalsExamine",method=RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> expenditureExamine(Withdrawals withdrawals,@RequestParam(value="page",required=false)String page,
			@RequestParam(value="rows",required=false)String rows,HttpServletResponse response,String username) throws Exception{ 
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows)); 
		Map<String, Object> map=new HashMap<>(); 
		map.put("username", StringUtil.formatLike(username)); 
		map.put("wnumber", StringUtil.formatLike(withdrawals.getWnumber())); 
		map.put("wbank", StringUtil.formatLike(withdrawals.getWbank())); 
		map.put("wstate", StringUtil.formatLike("3")); 
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
	
	/**
	 * 提现审核
	 * @param withdrawals
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/examine")
	public String examine(Withdrawals withdrawals,HttpServletResponse res) throws Exception{
		int resultTotal = 0;
		resultTotal = withdrawalsService.updateState(withdrawals);
		System.out.println("state:"+resultTotal);
		JSONObject jsonObject = new JSONObject();
        if(resultTotal > 0){   //说明修改或添加成功
            jsonObject.put("success", true);
        }else{
            jsonObject.put("success", false);
        }
        ResponseUtil.write(res, jsonObject);
		return null;
	}
	
	/**
	 * 跳转到提现列表
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(){
			
		return "withdrawals/withdrawalsList";
	}
	
	/**
	 * 提现列表信息
	 * @return
	 */
	@RequestMapping(value="/withdrawalsList2",method=RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> expenditureList(Withdrawals withdrawals,@RequestParam(value="page",required=false)String page,
			@RequestParam(value="rows",required=false)String rows,HttpServletResponse response,String username) throws Exception{ 
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows)); 
		Map<String, Object> map=new HashMap<>(); 
		map.put("username", StringUtil.formatLike(username)); 
		map.put("wnumber", StringUtil.formatLike(withdrawals.getWnumber())); 
		map.put("wbank", StringUtil.formatLike(withdrawals.getWbank())); 
		map.put("wstate", StringUtil.formatLike(withdrawals.getWstate())); 
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
}
