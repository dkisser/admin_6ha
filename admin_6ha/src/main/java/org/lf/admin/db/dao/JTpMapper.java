package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.JTp;

public interface JTpMapper extends BaseMapper<JTp>{
    int deleteByPrimaryKey(Integer id);

    int insert(JTp record);

    int insertSelective(JTp record);

    JTp selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JTp record);

    int updateByPrimaryKey(JTp record);
}