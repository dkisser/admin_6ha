package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.CXwlx;

public interface CXwlxMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CXwlx record);

    int insertSelective(CXwlx record);

    CXwlx selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CXwlx record);

    int updateByPrimaryKey(CXwlx record);
}