package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.UserEva;

public interface UserEvaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserEva record);

    int insertSelective(UserEva record);

    UserEva selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserEva record);

    int updateByPrimaryKey(UserEva record);
}