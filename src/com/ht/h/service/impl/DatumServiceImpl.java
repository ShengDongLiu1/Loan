package com.ht.h.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Datum;
import com.ht.h.dao.DatumMapper;
import com.ht.h.service.interfaces.DatumService;

@Service
public class DatumServiceImpl implements DatumService{

	@Resource
	private DatumMapper datum;
	
	@Override
	public int deleteByPrimaryKey(Integer did) {
		return datum.deleteByPrimaryKey(did);
	}

	@Override
	public int insert(Datum record) {
		return datum.insert(record);
	}

	@Override
	public int insertSelective(Datum record) {
		return datum.insertSelective(record);
	}

	@Override
	public Datum selectByPrimaryKey(Integer did) {
		return datum.selectByPrimaryKey(did);
	}

	@Override
	public int updateByPrimaryKeySelective(Datum record) {
		return datum.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Datum record) {
		return datum.updateByPrimaryKey(record);
	}

	@Override
	public Datum selectByDlid(Integer dlid) {
		return datum.selectByDlid(dlid);
	}

}
