package com.ht.h.service.interfaces;

import java.util.List;

import com.ht.h.bean.Sysfunction;
import com.ht.h.bean.sysuser;

public interface SysfunctionService {

	
	/** 
	 * @param existsysuser 登录的用户
	 * @return
	 */
	List<Sysfunction> initfunction(sysuser existsysuser);
	

}
