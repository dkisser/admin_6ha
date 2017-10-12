package org.lf.admin.db.dao;

import java.util.List;
import java.util.Map;

import org.lf.admin.db.pojo.JTp;

public interface JTpMapper extends BaseMapper<JTp>{
    int deleteByPrimaryKey(Integer id);

    int insert(JTp record);

    int insertSelective(JTp record);

    JTp selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JTp record);

    int updateByPrimaryKeyWithBLOBs(JTp record);

    int updateByPrimaryKey(JTp record);
    
    List<JTp> getTpByZTAndLx (Map<String,?> param);
}