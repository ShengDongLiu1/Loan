package com.ht.h.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ht.h.bean.Capital;
import com.ht.h.bean.Customer;
import com.ht.h.bean.Repayment;
import com.ht.h.bean.PageBean;
import com.ht.h.bean.Recharge;
import com.ht.h.dto.Pager;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.CapitalService;
import com.ht.h.service.interfaces.CustomerService;
import com.ht.h.service.interfaces.RechargeService;
import com.ht.h.service.interfaces.RepaymentService;
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
	private RechargeService rechargetService;
	
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
	public String selectAngodiv1(String state,@RequestParam(value="time1",required=false)String time1,@RequestParam(value="time",required=false)String time,@RequestParam(value="page",required=false)int page,Recharge recharge,HttpServletResponse response, HttpServletRequest request)throws Exception{
		
		//获取页面传过来的一个状态，根据这个状态来查询不同的表
		if(state == "1" && state.equals("1")){//查询充值表
			Pager<Recharge> pager = new Pager<Recharge>();
			pager.setPageSize(10);
			int count = rechargetService.rechargetCount();
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
			map.put("rtime", time);
			map.put("rtime1", time1);
			map.put("start", pager.getBeginIndex());
			map.put("size", pager.getPageSize());
			List<Recharge> userList=rechargetService.rechargetQueryAll(map);
			pager.setRows(userList);
			request.setAttribute("beslist", pager);
			return "bespoke";
		}else if(state=="2" && state.equals("2")){
			
			
			return null;
		}
		return time;
	}
}
