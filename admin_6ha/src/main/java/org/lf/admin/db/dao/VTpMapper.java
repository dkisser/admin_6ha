package org.lf.admin.db.dao;

import java.util.List;
import java.util.Map;

import org.lf.admin.db.pojo.VTp;

public interface VTpMapper extends BaseMapper<VTp>{
    int insert(VTp record);

    int insertSelective(VTp record);
    
    List<VTp> getDttpList(Map<String,?> param);
}