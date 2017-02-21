package com.ht.h.service.interfaces;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Recharge;

public interface RechargeService {
	int deleteByPrimaryKey(Integer rid);

    int insert(Recharge record);

    int insertSelective(Recharge record);

    Recharge selectByPrimaryKey(Integer rid);

    int updateByPrimaryKeySelective(Recharge record);

    int updateByPrimaryKey(Recharge record);
    
    List<Recharge> queryAll(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);
}
