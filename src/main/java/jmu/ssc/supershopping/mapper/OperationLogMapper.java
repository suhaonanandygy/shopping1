package jmu.ssc.supershopping.mapper;

import jmu.ssc.supershopping.pojo.OperationLog;
import org.apache.ibatis.annotations.Insert;

public interface OperationLogMapper {
    @Insert(" insert into operation_logs values(null,#{user_id},#{operation_description},#{operation_time},#{ip_address})")
    public void insertOperationLog(OperationLog log);
}
