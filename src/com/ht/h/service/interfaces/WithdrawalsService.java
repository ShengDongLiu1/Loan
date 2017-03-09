package com.ht.h.service.interfaces;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Withdrawals;

public interface WithdrawalsService {
	int deleteByPrimaryKey(Integer wid);

    int insert(Withdrawals record);

    int insertSelective(Withdrawals record);

    Withdrawals selectByPrimaryKey(Integer wid);

    int updateByPrimaryKeySelective(Withdrawals record);

    int updateByPrimaryKey(Withdrawals record);
    
    List<Withdrawals> selectWithdrawals(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);

	int withdrawalsCount(Map<String, Object> map);

	List<Withdrawals> withdrawalsQueryAll(Map<String, Object> map);
	
	int withdrawalsCountInt();

    int updateState(Withdrawals record);
	
}
