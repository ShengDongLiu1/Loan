package com.ht.h.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Test;
import com.ht.h.dao.TestMapper;
import com.ht.h.service.interfaces.TestService;

@Service
public class TestServiceImpl implements TestService{

	@Resource
	private TestMapper testDao;
	
	@Override
	public int deleteByPrimaryKey(Integer tid) {
		return testDao.deleteByPrimaryKey(tid);
	}

	@Override
	public int insert(Test record) {
		return testDao.insert(record);
	}

	@Override
	public int insertSelective(Test record) {
		return testDao.insertSelective(record);
	}

	@Override
	public Test selectByPrimaryKey(Integer tid) {
		return testDao.selectByPrimaryKey(tid);
	}

	@Override
	public int updateByPrimaryKeySelective(Test record) {
		return testDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Test record) {
		return testDao.updateByPrimaryKey(record);
	}

}
