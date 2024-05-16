package jmu.ssc.supershopping.service.impl;

import jmu.ssc.supershopping.mapper.OperationLogMapper;
import jmu.ssc.supershopping.mapper.UserActivityLogMapper;
import jmu.ssc.supershopping.mapper.UserMapper;
import jmu.ssc.supershopping.pojo.User;
import jmu.ssc.supershopping.pojo.UserActivityLog;
import jmu.ssc.supershopping.service.UserService;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
@Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {
    @Resource
    private UserActivityLogMapper activityLogMapper;
    @Resource
    private OperationLogMapper operationLogMapper;
    @Resource
    private UserMapper userMapper;

    //插入一条用户信息
    public boolean registerUser(User user){
        int res =  userMapper.insertUser(user);
        if(res>=1)
            return  true;
        else
            return  false;
    }

    //判断用户是否存在
    public User isUserAccountExist(String account) {
        try{
            return userMapper.selectUserByAccount(account);
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }

    //根据账户名和密码返回用户信息
    public User isUserAccountPasswordExist(String name, String password){
        try{
            Map<String,Object> map = new HashMap<>();
            map.put("user_name",name);
            map.put("user_password",password);
            User user = userMapper.selectUserByAccountAndPassword(map);
            System.out.println(user);
            return user;
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }

    public void recordLogin(String username, String ip) {
        UserActivityLog log = new UserActivityLog();
        log.setUserName(username);
        log.setActivityType("LOGIN");
        log.setCategory("用户行为");
        log.setIpAddress(ip);
        activityLogMapper.insertUserActivityLog1(log);
    }

    public void recordLogout(String  username, String ip) {
        UserActivityLog log = new UserActivityLog();
        log.setUserName(username);
        log.setActivityType("LOGOUT");
        log.setCategory("用户行为");
        log.setIpAddress(ip);
        activityLogMapper.insertUserActivityLog2(log);
    }

    public void recordVisit(String username, int product_id, String ip) {
        UserActivityLog log = new UserActivityLog();
        log.setUserName(username);
        log.setActivityType("VISIT");
        log.setIpAddress(ip);
        log.setCategory("用户行为");
        log.setProduct_id(product_id);
        activityLogMapper.insertUserActivityLog3(log);
    }

    public void recordShoppingcar(String username, String ip, int amount,double price,int product_id){
        UserActivityLog log = new UserActivityLog();
        log.setUserName(username);
        log.setActivityType("shoppingcar");
        log.setIpAddress(ip);
        log.setCategory("用户行为");
        log.setProduct_id(product_id);
        log.setPrice(price);
        log.setQuantity(amount);
        activityLogMapper.insertUserActivityLog4(log);



    }

    public void recordShopping(String username, String ip,int amount,double price,int product_id){
        UserActivityLog log = new UserActivityLog();
        log.setUserName(username);
        log.setActivityType("shopping");
        log.setIpAddress(ip);
        log.setCategory("用户行为");
        log.setProduct_id(product_id);
        log.setPrice(price);
        log.setQuantity(amount);
        activityLogMapper.insertUserActivityLog5(log);
    }

    public void recordSearch(String username, String ip,String condition){
        UserActivityLog log = new UserActivityLog();
        log.setUserName(username);
        log.setActivityType("Search:"+condition);
        log.setIpAddress(ip);
        log.setCategory("用户行为");
        activityLogMapper.insertUserActivityLog6(log);

    }



/* -----------------------------------Admin--------------------------------------*/
public List<User> getAllUsers(){
    return userMapper.selectUser();
}


}
