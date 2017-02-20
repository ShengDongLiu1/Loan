package com.ht.h.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ht.h.bean.Sysfunction;
import com.ht.h.bean.sysuser;
import com.ht.h.dao.SysfunctionMapper;
import com.ht.h.service.interfaces.SysfunctionService;

@Service
public class SysfunctionServiceImpl implements SysfunctionService {
	
	@Autowired
	private SysfunctionMapper sysfunctionMapper;

	@Override
	public List<Sysfunction> initfunction(sysuser existsysuser) {
		
		return sysfunctionMapper.initfunction(existsysuser);
	}

}
