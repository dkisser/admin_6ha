package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.Eva;

public interface EvaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Eva record);

    int insertSelective(Eva record);

    Eva selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Eva record);

    int updateByPrimaryKey(Eva record);
}