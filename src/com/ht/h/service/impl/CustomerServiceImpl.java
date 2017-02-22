package com.ht.h.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ht.h.bean.Customer;
import com.ht.h.dao.CustomerMapper;
import com.ht.h.service.interfaces.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Resource
	private CustomerMapper userDao;
	
	@Override
	public int deleteByPrimaryKey(Integer uid) {
		return userDao.deleteByPrimaryKey(uid);
	}

	@Override
	public int insert(Customer record) {
		return userDao.insert(record);
	}

	@Override
	public int insertSelective(Customer record) {
		return userDao.insertSelective(record);
	}

	@Override
	public Customer selectByPrimaryKey(Integer uid) {
		return userDao.selectByPrimaryKey(uid);
	}

	@Override
	public int updateByPrimaryKeySelective(Customer record) {
		return userDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Customer record) {
		return userDao.updateByPrimaryKey(record);
	}

	@Override
	public Customer cusLogin(Map<String, Object> map) {
		return userDao.cusLogin(map);
	}

	@Override
	public List<Customer> queryAll(Map<String, Object> map) {
		return userDao.queryAll(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return userDao.getTotal(map);
	}
	
	
	@Override
	public Customer repeatUsername(String username) {
		return userDao.repeatUsername(username);
	}

	@Override
	public Customer repeatPhone(String phone) {
		return userDao.repeatPhone(phone);
	}

}
