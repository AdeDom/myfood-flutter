import 'package:myfood/app/data/models/home/home_model.dart';
import 'package:myfood/app/data/repositories/result.dart';

mixin HomeRepository {
  Future<Result<HomeModel>> callHomePage();
}
