package jmu.ssc.supershopping.mapper;

import org.apache.ibatis.annotations.Select;
import jmu.ssc.supershopping.pojo.Rating;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface RatingMapper {
    @Select("SELECT * FROM ratings")
   public List<Rating> findAll();

    @Select("SELECT * FROM ratings WHERE user_id = #{userId}")
    public List<Rating> findByUserId(int userId);
}
