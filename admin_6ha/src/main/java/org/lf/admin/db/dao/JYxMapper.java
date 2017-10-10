package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.JYx;

public interface JYxMapper extends BaseMapper<JYx>{
    int deleteByPrimaryKey(Integer id);

    int insert(JYx record);

    int insertSelective(JYx record);

    JYx selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JYx record);

    int updateByPrimaryKey(JYx record);
}