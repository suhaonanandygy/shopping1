package jmu.ssc.supershopping.service.impl;

import jmu.ssc.supershopping.mapper.RatingMapper;
import jmu.ssc.supershopping.mapper.ProductMapper;
import jmu.ssc.supershopping.pojo.Product;
import jmu.ssc.supershopping.pojo.Rating;
import jmu.ssc.supershopping.service.RecommendationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import javax.annotation.Resource;
import java.util.stream.Collectors;

public class RecommendationServiceImpl implements RecommendationService{
    @Resource
    private ProductMapper productMapper;

    @Resource
    private RatingMapper ratingMapper;

    @Resource
    public List<Product> recommendProducts(Long userId, int numRecommendations) {
        List<Rating> allRatings = ratingMapper.findAll();
        Map<Long, Map<Long, Double>> userRatings = new HashMap<>();

        for (Rating rating : allRatings) {
            userRatings.computeIfAbsent(rating.getUserId(), k -> new HashMap<>()).put(rating.getProductId(), rating.getRating());
        }

        Map<Long, Double> targetUserRatings = userRatings.get(userId);
        if (targetUserRatings == null) {
            return Collections.emptyList();
        }

        Map<Long, Double> similarityScores = new HashMap<>();

        for (Long otherUserId : userRatings.keySet()) {
            if (!otherUserId.equals(userId)) {
                double similarity = computeSimilarity(targetUserRatings, userRatings.get(otherUserId));
                similarityScores.put(otherUserId, similarity);
            }
        }

        List<Map.Entry<Long, Double>> sortedSimilarUsers = similarityScores.entrySet().stream()
                .sorted(Map.Entry.<Long, Double>comparingByValue().reversed())
                .collect(Collectors.toList());

        Map<Long, Double> weightedRatings = new HashMap<>();
        Map<Long, Double> similaritySum = new HashMap<>();

        for (Map.Entry<Long, Double> entry : sortedSimilarUsers) {
            Long similarUserId = entry.getKey();
            Double similarity = entry.getValue();

            Map<Long, Double> similarUserRatings = userRatings.get(similarUserId);
            for (Map.Entry<Long, Double> ratingEntry : similarUserRatings.entrySet()) {
                Long productId = ratingEntry.getKey();
                Double rating = ratingEntry.getValue();

                weightedRatings.put(productId, weightedRatings.getOrDefault(productId, 0.0) + similarity * rating);
                similaritySum.put(productId, similaritySum.getOrDefault(productId, 0.0) + similarity);
            }
        }

        Map<Long, Double> predictedRatings = new HashMap<>();
        for (Long productId : weightedRatings.keySet()) {
            predictedRatings.put(productId, weightedRatings.get(productId) / similaritySum.get(productId));
        }

        return predictedRatings.entrySet().stream()
                .sorted(Map.Entry.<Long, Double>comparingByValue().reversed())
                .limit(numRecommendations)
                .map(entry -> productMapper.findById(entry.getKey()).orElse(null))
                .collect(Collectors.toList());
    }

    private double computeSimilarity(Map<Long, Double> ratings1, Map<Long, Double> ratings2) {
        Set<Long> commonProducts = new HashSet<>(ratings1.keySet());
        commonProducts.retainAll(ratings2.keySet());

        if (commonProducts.isEmpty()) {
            return 0.0;
        }

        double sumProduct = 0.0;
        double sum1 = 0.0;
        double sum2 = 0.0;
        double sum1Squared = 0.0;
        double sum2Squared = 0.0;

        for (Long productId : commonProducts) {
            double rating1 = ratings1.get(productId);
            double rating2 = ratings2.get(productId);

            sumProduct += rating1 * rating2;
            sum1 += rating1;
            sum2 += rating2;
            sum1Squared += rating1 * rating1;
            sum2Squared += rating2 * rating2;
        }

        int n = commonProducts.size();
        double numerator = sumProduct - (sum1 * sum2 / n);
        double denominator = Math.sqrt((sum1Squared - (sum1 * sum1 / n)) * (sum2Squared - (sum2 * sum2 / n)));

        return (denominator == 0) ? 0.0 : numerator / denominator;
    }

}
