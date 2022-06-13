import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myfood/app/data/models/base/base_error.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.homePageError({
    required BaseError error,
  }) = HomePageError;
}
