package com.ht.h.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Bank;
import com.ht.h.dao.BankMapper;
import com.ht.h.service.interfaces.BankService;

@Service
public class BankServiceImpl implements BankService{

	@Resource
	private BankMapper bankDao;
	
	@Override
	public int deleteByPrimaryKey(Integer bid) {
		return bankDao.deleteByPrimaryKey(bid);
	}

	@Override
	public int insert(Bank record) {
		return bankDao.insert(record);
	}

	@Override
	public int insertSelective(Bank record) {
		return bankDao.insertSelective(record);
	}

	@Override
	public Bank selectByPrimaryKey(Integer bid) {
		return bankDao.selectByPrimaryKey(bid);
	}

	@Override
	public int updateByPrimaryKeySelective(Bank record) {
		return bankDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Bank record) {
		return bankDao.updateByPrimaryKey(record);
	}

	@Override
	public List<Bank> select(Map<String, Object> map) {
		return bankDao.select(map);
	}

	@Override
	public Long queryAllCount(Map<String, Object> map) {
		return bankDao.queryAllCount(map);
	}

	@Override
<<<<<<< Updated upstream
	public List<Bank> queryByUid(int uid) {
		return bankDao.queryByUid(uid);
	}

=======
	public List<Bank> selectCard(Integer uid) {
		return bankDao.selectCard(uid);
	}
	@Override
	public List<Bank> queryByUid(int uid) {
		return bankDao.queryByUid(uid);
	}
>>>>>>> Stashed changes
}
