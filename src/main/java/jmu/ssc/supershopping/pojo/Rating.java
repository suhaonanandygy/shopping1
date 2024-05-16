package jmu.ssc.supershopping.pojo;

import java.util.List;

public class Rating {
    private int id;
    private Long userId;
    private Long productId;
    private Double rating;
    private List<Rating> ratings;

    public Long getUserId() {
        return userId;
    }

    public Long getProductId() {
        return productId;
    }

    public Double getRating() {
        return rating;
    }
}
