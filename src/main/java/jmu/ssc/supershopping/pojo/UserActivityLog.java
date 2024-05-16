package jmu.ssc.supershopping.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class UserActivityLog {
    private Long id;
    private String user_name;
    private String activity_type;
    private String category;
    private String ip_address;
    private Timestamp activity_time;
    private Integer duration;
    private Integer product_id;
    private Integer quantity;
    private double price;

    private List<UserActivityLog> userList;

    public void setUserName(String username) {
        this.user_name=username;
    }

    public void setActivityType(String login) {
        this.activity_type=login;
    }

    public void setIpAddress(String ip) {
        this.ip_address=ip;

    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public void setCategory(String category) {
        this.category=category;
    }

    public void setDuration(int duration) {
        this.duration=duration;
    }
}
