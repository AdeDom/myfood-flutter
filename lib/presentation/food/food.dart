import 'package:flutter/material.dart';

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
              _buildCategoryListSection(),
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

  Widget _buildCategoryListSection() {
    return Container(
      height: 300,
      color: Colors.green,
    );
  }

  Widget _buildFoodListSection() {
    return Container(
      height: 300,
      color: Colors.orange,
    );
  }
}
