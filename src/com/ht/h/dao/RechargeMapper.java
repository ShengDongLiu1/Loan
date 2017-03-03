package com.ht.h.dao;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Recharge;

public interface RechargeMapper {
    int deleteByPrimaryKey(Integer rid);

    int insert(Recharge record);

    int insertSelective(Recharge record);

    Recharge selectByPrimaryKey(Integer rid);

    int updateByPrimaryKeySelective(Recharge record);

    int updateByPrimaryKey(Recharge record);
    
    List<Recharge> queryAll(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);
    
    int queryByRserial(String Rserial);

	int rechargetCount();

	List<Recharge> rechargetQueryAll(Map<String, Object> map);
    
    List<Recharge> queryBy1();
    
    Long getTotal1();
    
    List<Recharge> queryBy(Map<String, Object> map);
    
    Long getTotalBy(Map<String, Object> map);
}