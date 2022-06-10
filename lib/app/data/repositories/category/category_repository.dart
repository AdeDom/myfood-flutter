import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/category/category.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/category/category_repository.dart';

class CategoryRepositoryImpl with CategoryRepository {
  @override
  Future<Result<List<Category>>> callCategoryAll() {
    final json = {
      "version": "1.0",
      "status": "success",
      "result": [
        {
          "categoryId": 1,
          "categoryName": "Offers",
          "image": "https://insanelygoodrecipes.com/wp-content/uploads/2020/10/Hamburger-with-Sesame-Seeds-Cheese-and-Veggies.png",
          "categoryTypeName": "recommend",
          "created": "26/3/2022 20:40"
        },
        {
          "categoryId": 11,
          "categoryName": "Sri Lankan",
          "image": "https://d1oh9y2nmj4y5b.cloudfront.net/uploads/photo/filename/8358/IMG_8018.jpg",
          "categoryTypeName": "normal",
          "created": "26/3/2022 20:42"
        },
        {
          "categoryId": 21,
          "categoryName": "Italian",
          "image": "https://cdn.lifestyleasia.com/wp-content/uploads/sites/7/2022/03/16190144/jakub-kapusnak-tEVisOXz26Y-unsplash-1350x900.jpg",
          "categoryTypeName": "normal",
          "created": "26/3/2022 20:43"
        },
        {
          "categoryId": 31,
          "categoryName": "Indian",
          "image": "https://img.traveltriangle.com/blog/wp-content/uploads/2018/02/FotoJetcoverindianrest.jpg",
          "categoryTypeName": "normal",
          "created": "26/3/2022 20:47"
        },
        {
          "categoryId": 41,
          "categoryName": "Thai",
          "image": "https://www.thefunkyturtle.com/wp-content/uploads/2020/01/thefunkyturtle.com-thai-cooking-classes-koh-tao.jpg",
          "categoryTypeName": "normal",
          "created": "26/3/2022 20:48"
        }
      ]
    };
    BaseResponse<List<Category>> categoryAll = BaseResponse.fromJson(
      json,
      (json) {
        final jsonList = json as List<dynamic>? ?? [];
        final categoryAll = jsonList.map((json) => Category.fromJson(json));
        return categoryAll.toList();
      },
    );
    Result<List<Category>> result = Result.success(data: categoryAll.result);
    return Future.value(result);
  }
}
