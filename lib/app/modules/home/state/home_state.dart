import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myfood/app/data/models/category/category.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.loaded({
    List<Category>? foodList,
  }) = Loaded;
}
