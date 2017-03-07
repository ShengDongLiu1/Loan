package com.ht.h.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Repayment;
import com.ht.h.dao.RepaymentMapper;
import com.ht.h.service.interfaces.RepaymentService;

@Service
public class RepaymentServiceImpl implements RepaymentService{

	@Resource
	private RepaymentMapper repaymentDao;
	
	@Override
	public int deleteByPrimaryKey(Integer rid) {
		return repaymentDao.deleteByPrimaryKey(rid);
	}

	@Override
	public int insert(Repayment record) {
		return repaymentDao.insert(record);
	}

	@Override
	public int insertSelective(Repayment record) {
		return repaymentDao.insertSelective(record);
	}

	@Override
	public Repayment selectByPrimaryKey(Integer rid) {
		return repaymentDao.selectByPrimaryKey(rid);
	}

	@Override
	public int updateByPrimaryKeySelective(Repayment record) {
		return repaymentDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Repayment record) {
		return repaymentDao.updateByPrimaryKey(record);
	}

	@Override
	public List<Repayment> queryAll(Map<String, Object> map) {
		return repaymentDao.queryAll(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return repaymentDao.getTotal(map);
	}

	@Override
	public int RepaymentCount(Map<String, Object> map) {
		// TODO 自动生成的方法存根
		return repaymentDao.RepaymentCount(map);
	}

	@Override
	public List<Repayment> repaymentQueryAll(Map<String, Object> map) {
		// TODO 自动生成的方法存根
		return repaymentDao.repaymentQueryAll(map);
	}

}
