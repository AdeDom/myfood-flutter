import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/data/models/user/user_entity.dart';
import 'package:myfood/data/providers/store/store.dart';
import 'package:myfood/presentation/food/food.dart';
import 'package:myfood/presentation/login/login.dart';
import 'package:myfood/presentation/register/register.dart';
import 'package:myfood/presentation/welcome/welcome.dart';

void main() async {
  await GetStorage.init(StoreImpl.storeFile);
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox(DatabaseConstant.tableUser);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _route = <String, WidgetBuilder>{
    "/welcome": (BuildContext context) => const Welcome(),
    "/login": (BuildContext context) => const Login(),
    "/register": (BuildContext context) => const Register(),
    "/food": (BuildContext context) => const Food(),
  };

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _route,
      title: 'My Food',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFFFFD700),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
    );
  }
}
