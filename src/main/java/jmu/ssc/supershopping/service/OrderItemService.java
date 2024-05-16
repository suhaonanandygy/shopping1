package jmu.ssc.supershopping.service;

import jmu.ssc.supershopping.pojo.OrderItem;

public interface OrderItemService {

    //插入新的订单详单
    public boolean isInsertOrderItem(int oi_count,int oi_pid,String oi_oid);
    public OrderItem findProductByOid(String o_oid);

}
