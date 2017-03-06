package com.ht.h.service.impl;

import java.util.List;
import java.util.Map;

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

	@Override
	public int frozenCount(Map<String, Object> map) {
		// TODO 自动生成的方法存根
		return frozenDao.frozenCount(map);
	}

	@Override
	public List<Frozen> frozenQueryAll(Map<String, Object> map) {
		// TODO 自动生成的方法存根
		return frozenDao.frozenQueryAll(map);
	}

}
