package com.ht.h.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Loan;
import com.ht.h.dao.LoanMapper;
import com.ht.h.service.interfaces.LoanService;

@Service
public class LoanServiceImpl implements LoanService{

	@Resource
	private LoanMapper loanDao;

	@Override
	public int deleteByPrimaryKey(Integer lid) {
		return loanDao.deleteByPrimaryKey(lid);
	}

	@Override
	public int insert(Loan record) {
		return loanDao.insert(record);
	}

	@Override
	public int insertSelective(Loan record) {
		return loanDao.insertSelective(record);
	}

	@Override
	public Loan selectByPrimaryKey(Integer lid) {
		return loanDao.selectByPrimaryKey(lid);
	}

	@Override
	public int updateByPrimaryKeySelective(Loan record) {
		return loanDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Loan record) {
		return loanDao.updateByPrimaryKey(record);
	}
}
