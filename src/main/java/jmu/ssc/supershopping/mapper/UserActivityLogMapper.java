package jmu.ssc.supershopping.mapper;

import jmu.ssc.supershopping.pojo.Product;
import jmu.ssc.supershopping.pojo.User;
import jmu.ssc.supershopping.pojo.UserActivityLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserActivityLogMapper {
    @Insert(" insert into user_activity_logs (user_name, activity_type, category, ip_address, activity_time) values(#{user_name},#{activity_type},#{category},#{ip_address},NOW())")
    public void insertUserActivityLog1(UserActivityLog log);

    @Insert("insert into user_activity_logs (user_name, activity_type, category, ip_address, activity_time) values(#{user_name},#{activity_type},#{category},#{ip_address},NOW())")
   public void insertUserActivityLog2(UserActivityLog log);

    @Insert("insert into user_activity_logs (user_name, activity_type, category, ip_address, activity_time, product_id) values(#{user_name},#{activity_type},#{category},#{ip_address},NOW(),#{product_id})")
    public void insertUserActivityLog3(UserActivityLog log);

    @Select("select * from user_activity_logs")
    public List<UserActivityLog> selectLOGByPage();

    @Insert("insert into user_activity_logs (user_name, activity_type, category, ip_address, activity_time , price, quantity, product_id) values(#{user_name},#{activity_type},#{category},#{ip_address},NOW(),#{price},#{quantity},#{product_id})")
    public void insertUserActivityLog4(UserActivityLog log);

    @Insert("insert into user_activity_logs (user_name, activity_type, category, ip_address, activity_time , price, quantity, product_id) values(#{user_name},#{activity_type},#{category},#{ip_address},NOW(),#{price},#{quantity},#{product_id})")
    public void insertUserActivityLog5(UserActivityLog log);

    @Insert("insert into user_activity_logs (user_name, activity_type, category, ip_address, activity_time) values(#{user_name},#{activity_type},#{category},#{ip_address},NOW())")
    public void insertUserActivityLog6(UserActivityLog log);


}
