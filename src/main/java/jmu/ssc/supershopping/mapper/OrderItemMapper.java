package jmu.ssc.supershopping.mapper;

import jmu.ssc.supershopping.pojo.OrderItem;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

public interface OrderItemMapper {

    //插入新的订单详单
    @Insert("INSERT INTO orderitem(orderitem_id,orderitem_count,orderitem_pid,orderitem_oid) VALUES(null,#{oi_count},#{oi_pid},#{oi_oid})")
    public int insertOrderItem(Map<String,Object> map);

    @Select("select * from orderitem where orderitem_oid = #{o_oid}")
   public OrderItem selectorderByOID(String o_oid);


}
