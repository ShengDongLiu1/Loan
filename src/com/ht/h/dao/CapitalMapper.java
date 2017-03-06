package com.ht.h.dao;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Capital;

public interface CapitalMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Capital record);

    int insertSelective(Capital record);

    Capital selectByPrimaryKey(Integer cid);
    
    Capital selectByPrimaryKey2(Integer cid);

    Capital selectByFund(Integer cid);
    
    int updateByPrimaryKeySelective(Capital record);

    int updateByPrimaryKey(Capital record);
    
    List<Capital> selectAll(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);
    
    String selectByid(Integer uid);
    
    
}