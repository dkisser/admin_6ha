package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.LNews;

public interface LNewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LNews record);

    int insertSelective(LNews record);

    LNews selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LNews record);

    int updateByPrimaryKey(LNews record);
}