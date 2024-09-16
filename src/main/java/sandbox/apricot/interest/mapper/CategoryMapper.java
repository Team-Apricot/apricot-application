package sandbox.apricot.interest.mapper;

import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;
import sandbox.apricot.interest.vo.Category;

@Mapper
public interface CategoryMapper {

    Optional<Category> findById(String categoryId);

}
