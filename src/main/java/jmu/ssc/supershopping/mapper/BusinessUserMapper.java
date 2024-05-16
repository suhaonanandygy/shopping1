package jmu.ssc.supershopping.mapper;

import jmu.ssc.supershopping.pojo.BusinessUser;
import jmu.ssc.supershopping.pojo.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface BusinessUserMapper {
    @Select("select * from business where business_account = #{business_account} and business_password = #{business_password}")
    public List<BusinessUser> selectBusinessByAccountAndPassword(Map<String,Object> map);

    @Select("select * from business")
    public List<BusinessUser> selectBusinessUser();

}
