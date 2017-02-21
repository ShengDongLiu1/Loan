package com.ht.h.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Capital;
import com.ht.h.dao.CapitalMapper;
import com.ht.h.service.interfaces.CapitalService;

@Service
public class CapitalServiceImpl implements CapitalService{

	@Resource
	private CapitalMapper capitalDao;
	
	@Override
	public int deleteByPrimaryKey(Integer cid) {
		return capitalDao.deleteByPrimaryKey(cid);
	}

	@Override
	public int insert(Capital record) {
		return capitalDao.insert(record);
	}

	@Override
	public int insertSelective(Capital record) {
		return capitalDao.insertSelective(record);
	}

	@Override
	public Capital selectByPrimaryKey(Integer cid) {
		return capitalDao.selectByPrimaryKey(cid);
	}

	@Override
	public int updateByPrimaryKeySelective(Capital record) {
		return capitalDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Capital record) {
		return capitalDao.updateByPrimaryKey(record);
	}

	@Override
	public List<Capital> selectAll(Map<String, Object> map) {
		return capitalDao.selectAll(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return capitalDao.getTotal(map);
	}

}
