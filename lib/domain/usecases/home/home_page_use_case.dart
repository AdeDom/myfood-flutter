import 'package:myfood/app/data/models/home/home_model.dart';
import 'package:myfood/app/data/repositories/result.dart';
import 'package:myfood/domain/repositories/home/home_repository.dart';

class HomePageUseCase {
  final HomeRepository homeRepository;

  HomePageUseCase({
    required this.homeRepository,
  });

  Future<Result<HomeModel>> call() {
    return homeRepository.callHomePage();
  }
}
