package com.ht.h.service.interfaces;

import com.ht.h.bean.Roleright;

public interface RolerightService {
	int deleteByPrimaryKey(Integer rrid);

    int insert(Roleright record);

    int insertSelective(Roleright record);

    Roleright selectByPrimaryKey(Integer rrid);

    int updateByPrimaryKeySelective(Roleright record);

    int updateByPrimaryKey(Roleright record);
}
