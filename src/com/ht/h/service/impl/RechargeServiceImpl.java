package com.ht.h.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Recharge;
import com.ht.h.dao.RechargeMapper;
import com.ht.h.service.interfaces.RechargeService;

@Service
public class RechargeServiceImpl implements RechargeService{

	@Resource
	private RechargeMapper rechargDao;
	
	@Override
	public int deleteByPrimaryKey(Integer rid) {
		return rechargDao.deleteByPrimaryKey(rid);
	}

	@Override
	public int insert(Recharge record) {
		return rechargDao.insert(record);
	}

	@Override
	public int insertSelective(Recharge record) {
		return rechargDao.insertSelective(record);
	}

	@Override
	public Recharge selectByPrimaryKey(Integer rid) {
		return rechargDao.selectByPrimaryKey(rid);
	}

	@Override
	public int updateByPrimaryKeySelective(Recharge record) {
		return rechargDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Recharge record) {
		return rechargDao.updateByPrimaryKey(record);
	}

}