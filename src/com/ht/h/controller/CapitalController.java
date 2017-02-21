package com.ht.h.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ht.h.bean.Capital;
import com.ht.h.bean.Customer;
import com.ht.h.bean.PageBean;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.CapitalService;
import com.ht.h.service.interfaces.CustomerService;
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

}
