package com.ht.h.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Frozen;
import com.ht.h.dao.FrozenMapper;
import com.ht.h.service.interfaces.FrozenService;

@Service
public class FrozenServiceImpl implements FrozenService{

	@Resource
	private FrozenMapper frozenDao;
	
	@Override
	public int deleteByPrimaryKey(Integer fid) {
		return frozenDao.deleteByPrimaryKey(fid);
	}

	@Override
	public int insert(Frozen record) {
		return frozenDao.insert(record);
	}

	@Override
	public int insertSelective(Frozen record) {
		return frozenDao.insertSelective(record);
	}

	@Override
	public Frozen selectByPrimaryKey(Integer fid) {
		return frozenDao.selectByPrimaryKey(fid);
	}

	@Override
	public int updateByPrimaryKeySelective(Frozen record) {
		return frozenDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Frozen record) {
		return frozenDao.updateByPrimaryKey(record);
	}

}
