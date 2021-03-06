package com.ht.h.service.interfaces;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Capital;

public interface CapitalService {
	int deleteByPrimaryKey(Integer cid);

    int insert(Capital record);

    int insertSelective(Capital record);

    Capital selectByPrimaryKey(Integer cid);
    
    Capital selectByFund(Integer cid);

    int updateByPrimaryKeySelective(Capital record);

    int updateByPrimaryKey(Capital record);
    
    int updateRecharge(Capital capital);
    
    List<Capital> selectAll(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);
    
    String selectByid(Integer uid);
    
    Capital selectByPrimaryKey2(Integer cid);
    
    List<Capital> queryByUid(int uid);
    
}
