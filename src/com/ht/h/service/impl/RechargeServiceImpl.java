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
		return rechargDao.getTotal(map);
	}

	@Override
	public int queryByRserial(String Rserial) {
		return rechargDao.queryByRserial(Rserial);
	}

	@Override
	public int rechargetCount() {
		return rechargDao.rechargetCount();
	}

	@Override
	public List<Recharge> rechargetQueryAll(Map<String, Object> map) {
		return rechargDao.rechargetQueryAll(map);
	}
	public List<Recharge> queryBy1() {
		return rechargDao.queryBy1();
	}

	@Override
	public Long getTotal1() {
		return rechargDao.getTotal1();
	}

	@Override
	public List<Recharge> queryBy(Map<String, Object> map) {
		return rechargDao.queryBy(map);
	}

	@Override
	public Long getTotalBy(Map<String, Object> map) {
		return rechargDao.getTotalBy(map);
	}

}
