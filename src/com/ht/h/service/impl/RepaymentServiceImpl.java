package com.ht.h.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Repayment;
import com.ht.h.dao.RepaymentMapper;
import com.ht.h.service.interfaces.RepaymentService;

@Service
public class RepaymentServiceImpl implements RepaymentService{

	@Resource
	private RepaymentMapper repaymentDao;
	
	@Override
	public int deleteByPrimaryKey(Integer rid) {
		return repaymentDao.deleteByPrimaryKey(rid);
	}

	@Override
	public int insert(Repayment record) {
		return repaymentDao.insert(record);
	}

	@Override
	public int insertSelective(Repayment record) {
		return repaymentDao.insertSelective(record);
	}

	@Override
	public Repayment selectByPrimaryKey(Integer rid) {
		return repaymentDao.selectByPrimaryKey(rid);
	}

	@Override
	public int updateByPrimaryKeySelective(Repayment record) {
		return repaymentDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Repayment record) {
		return repaymentDao.updateByPrimaryKey(record);
	}

}
