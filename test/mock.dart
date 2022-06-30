import 'package:mocktail/mocktail.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/app/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';
import 'package:myfood/domain/repositories/food_detail/food_detail_repository.dart';

class MockMyFoodDio extends Mock implements MyFoodDio {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockProfileRemoteDataSource extends Mock implements ProfileRemoteDataSource {}

class MockAuthLoginRepository extends Mock implements AuthLoginRepository {}

class MockAuthUserProfileRepository extends Mock implements AuthUserProfileRepository {}

class MockFoodDetailRepository extends Mock implements FoodDetailRepository {}
