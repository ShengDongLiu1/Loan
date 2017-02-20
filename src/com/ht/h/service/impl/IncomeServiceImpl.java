package com.ht.h.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Income;
import com.ht.h.dao.IncomeMapper;
import com.ht.h.service.interfaces.IncomeService;

@Service
public class IncomeServiceImpl implements IncomeService{

	@Resource
	private IncomeMapper incomeDao;
	
	@Override
	public int deleteByPrimaryKey(Integer iid) {
		return incomeDao.deleteByPrimaryKey(iid);
	}

	@Override
	public int insert(Income record) {
		return incomeDao.insert(record);
	}

	@Override
	public int insertSelective(Income record) {
		return incomeDao.insertSelective(record);
	}

	@Override
	public Income selectByPrimaryKey(Integer iid) {
		return incomeDao.selectByPrimaryKey(iid);
	}

	@Override
	public int updateByPrimaryKeySelective(Income record) {
		return incomeDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Income record) {
		return incomeDao.updateByPrimaryKey(record);
	}

}
