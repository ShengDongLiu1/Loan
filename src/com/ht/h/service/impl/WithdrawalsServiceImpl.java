package com.ht.h.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Withdrawals;
import com.ht.h.dao.WithdrawalsMapper;
import com.ht.h.service.interfaces.WithdrawalsService;

@Service
public class WithdrawalsServiceImpl implements WithdrawalsService{

	@Resource
	private  WithdrawalsMapper withdrawalsDao;

	@Override
	public int deleteByPrimaryKey(Integer wid) {
		return withdrawalsDao.deleteByPrimaryKey(wid);
	}

	@Override
	public int insert(Withdrawals record) {
		return withdrawalsDao.insert(record);
	}

	@Override
	public int insertSelective(Withdrawals record) {
		return withdrawalsDao.insertSelective(record);
	}

	@Override
	public Withdrawals selectByPrimaryKey(Integer wid) {
		return withdrawalsDao.selectByPrimaryKey(wid);
	}

	@Override
	public int updateByPrimaryKeySelective(Withdrawals record) {
		return withdrawalsDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Withdrawals record) {
		return withdrawalsDao.updateByPrimaryKey(record);
	}
}
