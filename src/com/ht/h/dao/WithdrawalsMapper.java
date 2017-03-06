package com.ht.h.dao;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Withdrawals;

public interface WithdrawalsMapper {
    int deleteByPrimaryKey(Integer wid);

    int insert(Withdrawals record);

    int insertSelective(Withdrawals record);

    Withdrawals selectByPrimaryKey(Integer wid);

    int updateByPrimaryKeySelective(Withdrawals record);

    int updateByPrimaryKey(Withdrawals record);
    
    List<Withdrawals> selectWithdrawals(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);

	int withdrawalsCount();

	List<Withdrawals> withdrawalsQueryAll(Map<String, Object> map);
}