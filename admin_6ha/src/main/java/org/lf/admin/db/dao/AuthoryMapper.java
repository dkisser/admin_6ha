package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.Authory;

public interface AuthoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Authory record);

    int insertSelective(Authory record);

    Authory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Authory record);

    int updateByPrimaryKey(Authory record);
}