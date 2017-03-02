package com.ht.h.service.interfaces;

import java.util.List;
import java.util.Map;

import com.ht.h.bean.Bank;

public interface BankService {
	int deleteByPrimaryKey(Integer bid);

    int insert(Bank record);

    int insertSelective(Bank record);

    Bank selectByPrimaryKey(Integer bid);

    int updateByPrimaryKeySelective(Bank record);

    int updateByPrimaryKey(Bank record);

	List<Bank> select(Map<String, Object> map);

	Long queryAllCount(Map<String, Object> map);
<<<<<<< Updated upstream
=======

	List<Bank> selectCard(Integer uid);
>>>>>>> Stashed changes
	
	List<Bank> queryByUid(int uid);
}
