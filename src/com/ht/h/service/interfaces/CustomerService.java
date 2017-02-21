package com.ht.h.service.interfaces;

import java.util.List;
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
    
    List<Customer> queryAll(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);
    
    Customer repeatUsername(String username);
    
    Customer repeatPhone(String phone);
}
