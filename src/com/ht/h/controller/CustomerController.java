package com.ht.h.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ht.h.bean.Customer;
import com.ht.h.bean.PageBean;
import com.ht.h.dto.StringUtil;
import com.ht.h.service.interfaces.CustomerService;
import com.ht.h.util.AES;
import com.ht.h.util.EmailCode;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit"; 

	@Resource
	private CustomerService customerService;
	
	
	/**
	 * 跳转到正常客户列表
	 * @return
	 */
	@RequestMapping(value="/toList1")
	public String toList1(HttpServletRequest request){
		request.setAttribute("ustate", 1);
		return "customer/cusList";
	}
	
	/**
	 * 跳转到冻结客户列表
	 * @return
	 */
	@RequestMapping(value="/toList2")
	public String toList2(HttpServletRequest request){
		request.setAttribute("ustate", 2);
		return "customer/cusList";
	}
	
	/**
	 * 客户登录
	 * @param customer
	 * @param session
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/cusLogin",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cusLogin(Customer customer,HttpSession session,HttpServletRequest req) throws Exception{
		Map<String, Object> map=new HashMap<>();
		map.put("phone", customer.getUsername());
		map.put("username", customer.getUsername());
		map.put("userpwd", customer.getUserpwd());
		map.put("userpwd", (AES.getInstance().encrypt(customer.getUserpwd())));
		customer=customerService.cusLogin(map);
		if(customer!=null){
			String name=null,idex=null,end = null,phoneindex=null;
			if(!"".equals(customer.getIdnumber())&&!"".equals(customer.getRealname())&&customer.getIdnumber()!=null&&customer.getRealname()!=null){
				idex = customer.getIdnumber().substring(0, 3);
				end = customer.getIdnumber().substring(14, 18);
				name = customer.getRealname().substring(1, customer.getRealname().length());
				customer.setRealname("*"+name);
				customer.setIdnumber(idex+"**************"+end);
			/*	phoneindex = customer.getPhone().substring(0,3);*/
				//phoneend = customer.getPhone().substring(8, 11);
				/*customer.setCodephone(phoneindex+"*******"+phoneend);*/
				customer.setUserpwd(AES.getInstance().decrypt(customer.getUserpwd()));
				session.setAttribute("customer", customer);
				HttpSession s = req.getSession();
				s.setAttribute("errorcode", "ok");
				map.put("result", "success");
			}
				
		}else{
			map.put("result", "用户名或密码错误");
		}
		return map;
	}
	
	/**
	 * 客户退出登录
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logOut")
	public String logOut(HttpSession session){
		session.removeAttribute("customer");
		return "client/index";
	}
	
	/**
	 * 客户列表
	 * @param customer
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value="/cusList")
	@ResponseBody
	public Map<String, Object> allCustomer(Customer customer,@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map=new HashMap<>();
		map.put("username", StringUtil.formatLike(customer.getUsername()));
		map.put("realname", StringUtil.formatLike(customer.getRealname()));
		map.put("idnumber", StringUtil.formatLike(customer.getIdnumber()));
		map.put("ustate", customer.getUstate());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Customer> cusList=customerService.queryAll(map);
		Long total=customerService.getTotal(map);
		map.put("rows", cusList);
		map.put("total", total);
		return map;
	}
	
	@RequestMapping(value="/upState")
	@ResponseBody
	public Map<String, Object> upState(Customer customer){
		Map<String, Object> map=new HashMap<>();
		int resultCount=customerService.updateByPrimaryKeySelective(customer);
		if(resultCount > 0){
			if("2".equals(customer.getUstate())){
				map.put("result", "冻结成功");
			}else if("1".equals(customer.getUstate())){
				map.put("result", "解冻成功");
			}
		}else{
			if("2".equals(customer.getUstate())){
				map.put("result", "冻结失败");
			}else if("1".equals(customer.getUstate())){
				map.put("result", "解冻失败");
			}
		}
		return map;
	}
	
	/**
	 * 修改客户登录密码
	 * @param uid
	 * @param newPassword
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/UpdatePassword")
	public String UpdatePassword(@RequestParam("uid") String uid,@RequestParam("newPassword") String newPassword) throws Exception{
		Customer customer=new Customer();
		customer.setUid(Integer.valueOf(uid));
		customer.setUserpwd(AES.getInstance().encrypt(newPassword));
		int ret=customerService.updateByPrimaryKeySelective(customer);
		return "client/login";
		
	}
	
	/**
	 * 用户添加认证身份证号码
	 * 
	 */
	@RequestMapping(value="/addIdcard")
	public String addIdcard(HttpSession session,@RequestParam("uid") String uid,@RequestParam("realname") String realname,@RequestParam("idnumber") String idnumber) throws Exception{
		Customer customer=new Customer();
		customer.setUid(Integer.valueOf(uid));
		customer.setRealname(realname);
		customer.setIdnumber(idnumber);
		int ret=customerService.updateByPrimaryKeySelective(customer);
		Customer c=new Customer();
		c = customerService.selectByPrimaryKey(Integer.valueOf(uid));
		String idex = c.getIdnumber().substring(0, 3);
		String end = c.getIdnumber().substring(14, 18);
		String name = c.getRealname().substring(1, c.getRealname().length());
		String phoneindex = c.getPhone().substring(0,3);
		String phoneend = c.getPhone().substring(8, 11);
		c.setCodephone(phoneindex+"*******"+phoneend);
		c.setRealname("*"+name);
		c.setIdnumber(idex+"**************"+end);
		session.setAttribute("customer", c);
		return "client/security";
	}
	
	
	
	 
	@RequestMapping(value="verification") 
	@ResponseBody 
	public String VerificationCode(HttpServletRequest request,String phone){ 
	    HttpClient client = new HttpClient();  
	    PostMethod method = new PostMethod(Url); 
	 
	    client.getParams().setContentCharset("GBK"); 
	    method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK"); 
	 
	    int mobile_code = (int)((Math.random()*9+1)*100000); 
	    HttpSession session = request.getSession(); 
	    session.setAttribute("yanzhengma", mobile_code); 
	    System.out.println(mobile_code+"-----dddd----");
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
	      e.printStackTrace(); 
	    } catch (IOException e) { 
	      e.printStackTrace(); 
	    } catch (DocumentException e) { 
	      e.printStackTrace(); 
	    }   
	    return null; 
     
  } 
	
	@RequestMapping(value="/UpdatePhoneNumber")
	public String phoneupdate(HttpServletRequest req, HttpSession session,@RequestParam("oldMobliePhoneCode") String code,@RequestParam("uid") String uid,@RequestParam("newMobliePhone") String phone) throws Exception{
		String yzm = session.getAttribute("yanzhengma").toString();
		Customer customer=new Customer();
		customer.setUid(Integer.valueOf(uid));
		customer.setPhone(phone);
		HttpSession s = req.getSession();
		if(code.equals(yzm)){
			int ret=customerService.updateByPrimaryKeySelective(customer);
			Customer c=new Customer();
			c = customerService.selectByPrimaryKey(Integer.valueOf(uid));
			if(!"".equals(c.getIdnumber()) && c.getIdnumber() != null){
				String idex = c.getIdnumber().substring(0, 3);
				String end = c.getIdnumber().substring(14, 18);
				c.setIdnumber(idex+"**************"+end);
			}
			if(!"".equals(c.getRealname()) && c.getRealname() != null){
				String name = c.getRealname().substring(1, c.getRealname().length());
				c.setRealname("*"+name);
			}
			String phoneindex = c.getPhone().substring(0,3);
			String phoneend = c.getPhone().substring(8, 11);
			c.setCodephone(phoneindex+"*******"+phoneend);
			session.setAttribute("customer", c);
			s.setAttribute("errorcode", "ok");
		}else{
			s.setAttribute("errorcode", "验证码错误");
		}
		return "client/security";
	}
	
	
	@RequestMapping(value="/editemail")
	public String email(HttpServletRequest req, HttpSession session,@RequestParam("addEmail") String email,@RequestParam("uid") String uid) throws Exception{
		Customer customer=new Customer();
		customer.setUid(Integer.valueOf(uid));
		customer.setEmail(email);
		int ret=customerService.updateByPrimaryKeySelective(customer);
		Customer c=new Customer();
		c = customerService.selectByPrimaryKey(Integer.valueOf(uid));
		String phoneindex = c.getPhone().substring(0,3);
		String phoneend = c.getPhone().substring(8, 11);
		if(!c.getIdnumber().equals("") && !c.getRealname().equals("") && c.getIdnumber() != null && c.getRealname() != null){
			String idex = c.getIdnumber().substring(0, 3);
			String end = c.getIdnumber().substring(14, 18);
			String name = c.getRealname().substring(1, c.getRealname().length());
			c.setRealname("*"+name);
			c.setIdnumber(idex+"**************"+end);
		}
		c.setCodephone(phoneindex+"*******"+phoneend);
		session.setAttribute("customer", c);
		return "client/security";
	}
	
	
	@RequestMapping("/send")
	public String email(String email)throws MessagingException {
		// 配置发送邮件的环境属性
        final Properties props = new Properties();
        /*
         * 可用的属性： mail.store.protocol / mail.transport.protocol / mail.host /
         * mail.user / mail.from
         */
        // 表示SMTP发送邮件，需要进行身份验证
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.163.com");
        // 发件人的账号
        props.put("mail.user","15779753872@163.com");
        // 访问SMTP服务时需要提供的密码
        props.put("mail.password", "lsd991435358");

        // 构建授权信息，用于进行SMTP进行身份验证
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
        // 使用环境属性和授权信息，创建邮件会话
        Session mailSession = Session.getInstance(props, authenticator);
        // 创建邮件消息
        MimeMessage message = new MimeMessage(mailSession);
        // 设置发件人
        InternetAddress form = new InternetAddress(
                props.getProperty("mail.user"));
        message.setFrom(form);

        // 设置收件人
        InternetAddress to = new InternetAddress(email);
        message.setRecipient(RecipientType.TO, to);

        /*// 设置抄送
        InternetAddress cc = new InternetAddress("599646324@qq.com");
        message.setRecipient(RecipientType.CC, cc);*/

        /*// 设置密送，其他的收件人不能看到密送的邮件地址
        if(user.getEmailMi() != null){
	        InternetAddress bcc = new InternetAddress(user.getEmailMi());
	        message.setRecipient(RecipientType.CC, bcc);
        }*/

        // 设置邮件标题
        message.setSubject("鸿金金融");
        
        String code = EmailCode.getCode();
        // 设置邮件的内容体GB2312
        message.setContent("感谢您选择了我们！:"+code, "text/html;charset=UTF-8");

        // 发送邮件
        Transport.send(message);
        return "client/security";
	}
}
