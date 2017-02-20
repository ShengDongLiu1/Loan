package com.ht.h.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Expenditure;
import com.ht.h.dao.ExpenditureMapper;
import com.ht.h.service.interfaces.ExpenditureService;

@Service
public class ExpenditureServiceImpl implements ExpenditureService{

	@Resource
	private ExpenditureMapper expenditureDao;
	
	@Override
	public int deleteByPrimaryKey(Integer eid) {
		return expenditureDao.deleteByPrimaryKey(eid);
	}

	@Override
	public int insert(Expenditure record) {
		return expenditureDao.insert(record);
	}

	@Override
	public int insertSelective(Expenditure record) {
		return expenditureDao.insertSelective(record);
	}

	@Override
	public Expenditure selectByPrimaryKey(Integer eid) {
		return expenditureDao.selectByPrimaryKey(eid);
	}

	@Override
	public int updateByPrimaryKeySelective(Expenditure record) {
		return expenditureDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Expenditure record) {
		return expenditureDao.updateByPrimaryKey(record);
	}

}
