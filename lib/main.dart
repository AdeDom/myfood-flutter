import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/app/data/models/category/category_entity.dart';
import 'package:myfood/app/data/models/food/food_entity.dart';
import 'package:myfood/app/data/models/user/user_entity.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/routes/app_pages.dart';
import 'package:myfood/generated/main_translation.dart';
import 'package:myfood/initial_binding.dart';

void main() async {
  await GetStorage.init(DataStoreImpl.storeFile);
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  Hive.registerAdapter(CategoryEntityAdapter());
  Hive.registerAdapter(FoodEntityAdapter());
  await Hive.openBox(DatabaseConstant.tableUser);
  await Hive.openBox(DatabaseConstant.tableCategory);
  await Hive.openBox(DatabaseConstant.tableFood);
  await Hive.openBox(DatabaseConstant.tempFood);
  runApp(GetMaterialApp(
    initialRoute: AppPages.INITIAL,
    initialBinding: InitialBinding(),
    defaultTransition: Transition.native,
    translations: MainTranslation(),
    getPages: AppPages.routes,
    title: 'My Food',
    theme: ThemeData(
      primarySwatch: Colors.yellow,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: const Color(0xFFFFD700),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
