import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/app/modules/home/views/build_category_list_section.dart';
import 'package:myfood/data/models/user/user_entity.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              _buildTitleSection(),
              _buildSearchSection(),
              const BuildCategoryListSection(),
              _buildFoodListSection(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Container(
      height: 300,
      color: Colors.red,
    );
  }

  Widget _buildSearchSection() {
    return ValueListenableBuilder(
      valueListenable: Hive.box(DatabaseConstant.tableUser).listenable(),
      builder: (context, box, _) {
        final userBox = box as Box<dynamic>;
        UserEntity? userEntity = userBox.get(DatabaseConstant.tableUser);
        return Container(
          height: 300,
          color: Colors.yellow,
          child: Column(
            children: [
              Text("userId : ${userEntity?.userId}"),
              Text("name : ${userEntity?.name}"),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFoodListSection() {
    return Container(
      height: 300,
      color: Colors.orange,
    );
  }
}
