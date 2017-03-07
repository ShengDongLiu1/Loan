package com.ht.h.service.interfaces;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Repayment;

public interface RepaymentService {
	int deleteByPrimaryKey(Integer rid);

    int insert(Repayment record);

    int insertSelective(Repayment record);

    Repayment selectByPrimaryKey(Integer rid);

    int updateByPrimaryKeySelective(Repayment record);

    int updateByPrimaryKey(Repayment record);
    
    List<Repayment> queryAll(Map<String, Object> map);
    
    Long getTotal(Map<String, Object> map);

	int RepaymentCount(Map<String, Object> map);

	List<Repayment> repaymentQueryAll(Map<String, Object> map);
}
