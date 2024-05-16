package jmu.ssc.supershopping.service.impl;

import jmu.ssc.supershopping.mapper.UserActivityLogMapper;
import jmu.ssc.supershopping.pojo.UserActivityLog;
import jmu.ssc.supershopping.service.UserActivityLogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service("userActivityLogService")
@Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class UserActivityLogServiceImpl implements UserActivityLogService {
    @Resource
    private UserActivityLogMapper userActivityLogMapper;
    public List<UserActivityLog> getallLog(){
        return userActivityLogMapper.selectLOGByPage();
    }


}
