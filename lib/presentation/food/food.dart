import 'package:flutter/material.dart';
import 'package:myfood/data/models/user/user_entity.dart';
import 'package:myfood/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/presentation/food/widget/build_category_list_section.dart';

class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);

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
    UserLocalDataSource userLocalDataSource = UserLocalDataSourceImpl();
    UserEntity? userEntity = userLocalDataSource.getUser();
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
  }


  Widget _buildFoodListSection() {
    return Container(
      height: 300,
      color: Colors.orange,
    );
  }
}
