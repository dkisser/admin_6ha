package org.lf.admin.db.dao;

import org.lf.admin.db.pojo.VUser;

public interface VUserMapper extends BaseMapper<VUser>{
    int insert(VUser record);

    int insertSelective(VUser record);
    
    int countSelect (VUser vuser);
    
}