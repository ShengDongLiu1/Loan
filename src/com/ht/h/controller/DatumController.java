package com.ht.h.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.ht.h.bean.Datum;
import com.ht.h.dto.UpFile;
import com.ht.h.service.interfaces.DatumService;

@Controller
@RequestMapping("/datum")
public class DatumController {
	
	@Resource
	private DatumService datumService;
	
	@RequestMapping(value="/addDatum",method=RequestMethod.POST)
	public String addDatum(Datum datum,Integer lid,HttpServletRequest request,RedirectAttributesModelMap modelMap) throws IOException{
		if(lid != null){
			Datum datum2=datumService.selectByDlid(lid);
			datum.setDlid(lid);
			datum.setDcard(UpFile.UpLoanFile(request,"file1"));
			datum.setHousehold(UpFile.UpLoanFile(request,"file2"));
			datum.setDcensus(UpFile.UpLoanFile(request,"file3"));
			datum.setDcredit(UpFile.UpLoanFile(request,"file4"));
			datum.setDapply(UpFile.UpLoanFile(request,"file5"));
			datum.setDother1(UpFile.UpLoanFile(request,"file6"));
			datum.setDother2(UpFile.UpLoanFile(request,"file7"));
			datum.setDother3(UpFile.UpLoanFile(request,"file8"));
			
			if(datum2 == null){
				int resultCount=datumService.insert(datum);
				if(resultCount > 0){
					modelMap.addFlashAttribute("result", "上传成功!"); 
				}else{
					modelMap.addFlashAttribute("result", "上传失败!"); 
				}
			}else{
				datum.setDid(datum2.getDid());
				int resultCount=datumService.updateByPrimaryKeySelective(datum);
				if(resultCount > 0){
					modelMap.addFlashAttribute("result", "修改成功!"); 
				}else{
					modelMap.addFlashAttribute("result", "修改失败!"); 
				}
			}
		}else{
			return "redirect:/client/login";
		}
		return "redirect:/client/borrow";
	}
	
	/**
	 * 查询借款申请资料
	 * @param lid
	 * @return
	 */
	@RequestMapping(value="/selDatum")
	@ResponseBody
	public Map<String, Object> selDatum(Integer lid){
		Map<String, Object> map=new HashMap<>();
		Datum datum=datumService.selectByDlid(lid);
		map.put("datum", datum);
		return map;
	}
}
