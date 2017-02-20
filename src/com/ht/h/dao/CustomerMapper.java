package com.ht.h.dao;

import java.util.Map;

import com.ht.h.bean.Customer;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
    Customer cusLogin(Map<String, Object> map);
}