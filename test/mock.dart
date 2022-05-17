import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';

class MockMyFoodDio extends Mock implements MyFoodDio {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockProfileRemoteDataSource extends Mock implements ProfileRemoteDataSource {}

class MockAuthRepository extends Mock implements AuthRepository {}
