package com.ht.h.controller;


<<<<<<< HEAD
import java.util.HashMap;
import java.util.Map;
=======

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
>>>>>>> master

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

<<<<<<< HEAD
import com.ht.h.service.interfaces.InvestmentService;
=======
import com.alibaba.fastjson.JSONObject;
import com.ht.h.bean.Capital;
import com.ht.h.bean.Investment;
import com.ht.h.service.interfaces.CapitalService;
import com.ht.h.service.interfaces.InvestmentService;
import com.ht.h.util.ResponseUtil;	
>>>>>>> master

@Controller
@RequestMapping(value="investment")
public class InvestmentController {

	@Autowired
	private InvestmentService investmentService;
	
<<<<<<< HEAD
	@RequestMapping("toubiao")
	@ResponseBody
	public Map<String, Object> toubiao(){
		Map<String, Object> map = new HashMap<>();		
		
=======
	@Autowired
	private CapitalService capitalService;
	
	
	@RequestMapping("toubiao")
	@ResponseBody
	public String toubiao(Investment investment,HttpServletResponse response) throws Exception{
		JSONObject result = new JSONObject();
		String iuid = investmentService.repeatUser(investment.getIuid());
		if(iuid==null){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			Date time=null;
			time= sdf.parse(sdf.format(new Date()));
			investment.setItime(time);
			int resultTotal = investmentService.insertSelective(investment);
			if(resultTotal>0){
				Capital capital = new Capital();	
				String cid = capitalService.selectByid(investment.getIuid());
				capital.setCid(Integer.valueOf(cid));
				capital.setAvailable(investment.getIavailable()-investment.getImoney());
				capitalService.updateByPrimaryKeySelective(capital);
				result.put("success", true);
			}else{
				result.put("success", false);
			}
		}else{
			result.put("result", "err");
		}
		ResponseUtil.write(response, result);
>>>>>>> master
		return null;
		
	}
}
