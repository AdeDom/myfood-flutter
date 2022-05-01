import 'package:flutter/material.dart';
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
    return Container(
      height: 300,
      color: Colors.yellow,
    );
  }


  Widget _buildFoodListSection() {
    return Container(
      height: 300,
      color: Colors.orange,
    );
  }
}
