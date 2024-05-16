package jmu.ssc.supershopping.pojo;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
@Getter
public class BusinessUser {
    private int business_id;
    private String business_account;
    private String business_password;

    public String getBusiness_account() {
        return business_account;
    }

    public String getBusiness_password() {
        return business_password;
    }

    public void setBusiness_account(String bussiness_account) {
        this.business_account = bussiness_account;
    }

    public void setBusiness_password(String bussiness_password) {
        this.business_password = bussiness_password;
    }
}
