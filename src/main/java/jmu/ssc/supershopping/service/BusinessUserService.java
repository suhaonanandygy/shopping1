package jmu.ssc.supershopping.service;

import jmu.ssc.supershopping.pojo.AdminUser;
import jmu.ssc.supershopping.pojo.BusinessUser;
import jmu.ssc.supershopping.pojo.User;

import java.util.List;

public interface BusinessUserService {
    public  List<BusinessUser> BusinessLogin(String account, String password);
    public List<BusinessUser> getAllUsers();
}
