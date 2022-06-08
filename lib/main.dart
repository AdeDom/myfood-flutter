import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/app/routes/app_pages.dart';
import 'package:myfood/data/models/user/user_entity.dart';
import 'package:myfood/data/providers/store/data_store.dart';

void main() async {
  await GetStorage.init(DataStoreImpl.storeFile);
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox(DatabaseConstant.tableUser);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.native,
      getPages: AppPages.routes,
      title: 'My Food',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFFFFD700),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
