package com.ht.h.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Roleright;
import com.ht.h.dao.RolerightMapper;
import com.ht.h.service.interfaces.RolerightService;

@Service
public class RolerightServiceImpl implements RolerightService{

	@Resource
	private RolerightMapper rolerightDao;
	
	@Override
	public int deleteByPrimaryKey(Integer rrid) {
		return rolerightDao.deleteByPrimaryKey(rrid);
	}

	@Override
	public int insert(Roleright record) {
		return rolerightDao.insert(record);
	}

	@Override
	public int insertSelective(Roleright record) {
		return rolerightDao.insertSelective(record);
	}

	@Override
	public Roleright selectByPrimaryKey(Integer rrid) {
		return rolerightDao.selectByPrimaryKey(rrid);
	}

	@Override
	public int updateByPrimaryKeySelective(Roleright record) {
		return rolerightDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Roleright record) {
		return rolerightDao.updateByPrimaryKey(record);
	}

}
