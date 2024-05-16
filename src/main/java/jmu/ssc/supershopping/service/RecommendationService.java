package jmu.ssc.supershopping.service;

import java.util.List;
import jmu.ssc.supershopping.Utils.PageBean;
import jmu.ssc.supershopping.pojo.Product;
public interface RecommendationService {
    List<Product> recommendProducts(Long userId, int numRecommendations);
}
