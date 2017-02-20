package com.ht.h.controller; 
 
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpSession; 
 
import org.apache.commons.httpclient.HttpClient; 
import org.apache.commons.httpclient.HttpException; 
import org.apache.commons.httpclient.NameValuePair; 
import org.apache.commons.httpclient.methods.PostMethod; 
import org.dom4j.Document; 
import org.dom4j.DocumentException; 
import org.dom4j.DocumentHelper; 
import org.dom4j.Element; 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ht.h.bean.Customer;
import com.ht.h.service.interfaces.CustomerService;
import com.sun.org.apache.xpath.internal.operations.And; 
 
/* 
 * 注册 
 */ 
@Controller 
@RequestMapping(value="register") 
public class RegisterController { 
   
	@Resource
	private CustomerService customerService;
		
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit"; 
	 
	@RequestMapping(value="verification") 
	@ResponseBody 
	public String VerificationCode(HttpServletRequest request,String phone){ 
     
	    System.out.println("phone==========="+phone); 
	    HttpClient client = new HttpClient();  
	    PostMethod method = new PostMethod(Url); 
	 
	    client.getParams().setContentCharset("GBK"); 
	    method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK"); 
	 
	    int mobile_code = (int)((Math.random()*9+1)*100000); 
	    HttpSession session = request.getSession(); 
	    session.setAttribute("yanzheng", mobile_code); 
	    System.out.println(mobile_code+"-----dddd----");
	    System.out.println(session.getAttribute("yanzheng")+"===================");
	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。"); 
	       
	    NameValuePair[] data = {//提交短信   
	          new NameValuePair("account", "C11463038"),  
	          new NameValuePair("password", "8c042ee074ada26121b3fdd3495bae18"), //查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY 
	          //new NameValuePair("password", util.StringUtil.MD5Encode("密码")), 
	          new NameValuePair("mobile", phone),  
	          new NameValuePair("content", content), 
	    }; 
	    method.setRequestBody(data); 
	 
	    try { 
	      client.executeMethod(method); 
	       
	      String SubmitResult =method.getResponseBodyAsString(); 
	 
	      //System.out.println(SubmitResult); 
	 
	      Document doc = DocumentHelper.parseText(SubmitResult); 
	      Element root = doc.getRootElement(); 
	 
	      String code = root.elementText("code"); 
	      String msg = root.elementText("msg"); 
	      String smsid = root.elementText("smsid"); 
	 
	      System.out.println(code); 
	      System.out.println(msg); 
	      System.out.println(smsid); 
	 
	       if("2".equals(code)){ 
	        System.out.println("短信提交成功"); 
	      } 
	 
	    } catch (HttpException e) { 
	      // TODO Auto-generated catch block 
	      e.printStackTrace(); 
	    } catch (IOException e) { 
	      // TODO Auto-generated catch block 
	      e.printStackTrace(); 
	    } catch (DocumentException e) { 
	      // TODO Auto-generated catch block 
	      e.printStackTrace(); 
	    }   
	    return null; 
     
  } 
  
	@RequestMapping(value="/userregister",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> userRegister(Customer customer,String yanzheng,HttpSession session){
		Map<String, Object> map=new HashMap<>();
		map.put("phone", customer.getUsername());
		map.put("username", customer.getUsername());
		map.put("userpwd", customer.getUserpwd());
		map.put("yanzheng", yanzheng);
		int insert1 = 0;
		System.out.println(yanzheng+"yanzheng============");
		System.out.println(session.getAttribute("yanzheng")+"*******************8");
		if(yanzheng.equals(session.getAttribute("yanzheng"))  ){
			 insert1 =customerService.insert(customer);
		}else{
			map.put("result", "验证码错误");
		}
		if(insert1 < 0 ){
			map.put("result", "success");
		}else{
			map.put("result", "注册失败");
		}
		return map;
	}
} 
