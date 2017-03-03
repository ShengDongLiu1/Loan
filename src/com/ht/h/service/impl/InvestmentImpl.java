package com.ht.h.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ht.h.bean.Investment;
import com.ht.h.dao.InvestmentMapper;
import com.ht.h.service.interfaces.InvestmentService;

@Service
public class InvestmentImpl implements InvestmentService{

	@Autowired
	private InvestmentMapper investmentMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer iid) {
		return investmentMapper.deleteByPrimaryKey(iid);
	}

	@Override
	public int insert(Investment record) {
		return investmentMapper.insert(record);
	}

	@Override
	public int insertSelective(Investment record) {
		return investmentMapper.insertSelective(record);
	}

	@Override
	public Investment selectByPrimaryKey(Integer iid) {
		return investmentMapper.selectByPrimaryKey(iid);
	}

	@Override
	public int updateByPrimaryKeySelective(Investment record) {
		return investmentMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Investment record) {
		return investmentMapper.updateByPrimaryKey(record);
	}
	
}
