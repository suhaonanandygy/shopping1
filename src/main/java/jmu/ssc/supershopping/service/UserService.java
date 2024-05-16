package jmu.ssc.supershopping.service;

import jmu.ssc.supershopping.mapper.OperationLogMapper;
import jmu.ssc.supershopping.mapper.UserActivityLogMapper;
import jmu.ssc.supershopping.mapper.UserMapper;
import jmu.ssc.supershopping.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface UserService {


    public boolean registerUser(User user);

    public User isUserAccountExist(String account);

    public User isUserAccountPasswordExist(String name, String password);

    public void recordVisit(String username, int product_id, String ip);
    public void recordLogin(String username, String ip);
    public void recordLogout(String username, String ip);

    public void recordShoppingcar(String username, String ip,int amount,double price,int product_id);

    public void recordShopping(String username, String ip,int amount,double price,int product_id);
    public void recordSearch(String username, String ip,String condition);




    /* -----------------------------------Admin--------------------------------------*/

    public List<User> getAllUsers();



}
