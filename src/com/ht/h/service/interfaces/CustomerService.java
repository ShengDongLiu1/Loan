package com.ht.h.service.interfaces;

import java.util.Map;

import com.ht.h.bean.Customer;

public interface CustomerService {
	int deleteByPrimaryKey(Integer uid);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
    Customer cusLogin(Map<String, Object> map);
}
