package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.JPic;

public interface JPicMapper extends BaseMapper<JPic>{
    int deleteByPrimaryKey(Integer id);

    int insert(JPic record);

    int insertSelective(JPic record);

    JPic selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JPic record);

    int updateByPrimaryKey(JPic record);
}