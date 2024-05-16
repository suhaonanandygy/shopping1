package jmu.ssc.supershopping.service.impl;

import jmu.ssc.supershopping.mapper.BusinessUserMapper;
import jmu.ssc.supershopping.pojo.BusinessUser;
import jmu.ssc.supershopping.service.BusinessUserService;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("/businessUserService")
@Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class BusinessUserServiceImpl implements BusinessUserService {


        @Resource
        private BusinessUserMapper businessUserMapper;

        public List<BusinessUser> BusinessLogin(String business_account, String business_password) {
            try {
                Map<String,Object> map = new HashMap<>();
                map.put("business_account",business_account);
                map.put("business_password",business_password);
                List<BusinessUser> businessUserList = businessUserMapper.selectBusinessByAccountAndPassword(map);
                System.out.println(businessUserList);
                return businessUserList;
            }catch (EmptyResultDataAccessException e){
                return null;
            }
        }
    public List<BusinessUser> getAllUsers(){
            return businessUserMapper.selectBusinessUser();
    }

}
