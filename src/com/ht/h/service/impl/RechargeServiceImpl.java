package com.ht.h.service.impl;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Recharge> queryAll(Map<String, Object> map) {
		return rechargDao.queryAll(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rechargDao.getTotal(map);
	}

}
