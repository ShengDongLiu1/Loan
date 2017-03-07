package com.ht.h.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ht.h.bean.Capital;
import com.ht.h.bean.Customer;
import com.ht.h.bean.Frozen;
import com.ht.h.bean.Repayment;
import com.ht.h.bean.Withdrawals;
import com.ht.h.bean.PageBean;
import com.ht.h.bean.Recharge;
import com.ht.h.bean.Withdrawals;
import com.ht.h.dto.Pager;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.CapitalService;
import com.ht.h.service.interfaces.CustomerService;
import com.ht.h.service.interfaces.FrozenService;
import com.ht.h.service.interfaces.RechargeService;
import com.ht.h.service.interfaces.RepaymentService;
import com.ht.h.service.interfaces.WithdrawalsService;
import com.ht.h.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("capital")
public class CapitalController {

	@Autowired
	private CapitalService capitalService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private RepaymentService repaymentService;
	
	@Autowired
	private WithdrawalsService withdrawalsService;
	
	@Autowired
	private FrozenService frozenService;
	@RequestMapping("capitalPage")
	public String page() {
		return "capital/capitalPage";
	}

	@RequestMapping("capitalPageList")
	public String listPage(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, String username, HttpServletResponse res) throws Exception {
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", StringUtil.formatLike(username));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Capital> list = capitalService.selectAll(map);
		List<Capital> ulist = new ArrayList<>();
		for(Capital c : list){
			Customer user =  customerService.selectByPrimaryKey(c.getUid());
			c.setUsername(user.getUsername());
			ulist.add(c);
		}
		Long total = capitalService.getTotal(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(ulist);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(res, result);
		return null;
	}
	
	
	@RequestMapping("selectAngodiv1")
	public String selectAngodiv1(@RequestParam(value="state",required=false)String state,@RequestParam(value="time1",required=false)String time1,@RequestParam(value="time",required=false)String time,@RequestParam(value="page",required=false)int page,Recharge recharge,HttpServletResponse response,HttpServletRequest request,HttpSession session)throws Exception{
		//获取页面传过来的一个状态，根据这个状态来查询不同的表
		if(state == "2" || state.equals("2")){//查询提现表
			Pager<Withdrawals> pager = new Pager<Withdrawals>();
			pager.setPageSize(10);
			Customer customer = (Customer) session.getAttribute("customer");
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("wtime", time);
			map.put("wtime1", time1);
			map.put("uid", customer.getUid());
			int count = withdrawalsService.withdrawalsCount(map);
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
			List<Withdrawals> userList=withdrawalsService.withdrawalsQueryAll(map);
			pager.setRows(userList);
			request.setAttribute("witlist", pager);
			request.setAttribute("count",count);
			return "client/MoneyRecord2";
		}else if(state=="3" || state.equals("3")){
			Pager<Repayment> pager = new Pager<Repayment>();
			pager.setPageSize(10);
			Customer customer = (Customer) session.getAttribute("customer");
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("rtime", time);
			map.put("rtime1", time1);
			map.put("uid", customer.getUid());
			int count = repaymentService.RepaymentCount(map);
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
			List<Repayment> userList=repaymentService.repaymentQueryAll(map);
			pager.setRows(userList);
			request.setAttribute("replist", pager);
			request.setAttribute("count",count);
			return "client/MoneyRecord3";
		}else if(state=="4" || state.equals("4")){
			Pager<Frozen> pager = new Pager<Frozen>();
			pager.setPageSize(10);
			Customer customer = (Customer) session.getAttribute("customer");
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("ftime", time);
			map.put("ftime1", time1);
			map.put("uid", customer.getUid());
			int count = frozenService.frozenCount(map);
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
			List<Frozen> userList=frozenService.frozenQueryAll(map);
			pager.setRows(userList);
			request.setAttribute("frolist", pager);
			request.setAttribute("count",count);
			return "client/MoneyRecord4";
		}
		return null;
	}
	@RequestMapping(value="selectById")
	public Capital selectById(String id, Capital capital){
		if(id!=null){
			capital = capitalService.selectByPrimaryKey(Integer.valueOf(id));
		}
		return capital;
	}
}
