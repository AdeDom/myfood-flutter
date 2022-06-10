import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitleSection(),
        _buildSearchSection(),
        _buildCategoryListSection(),
        _buildFoodListSection(),
      ],
    );
  }

  Widget _buildTitleSection() {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          bottom: 16,
        ),
        child: Text(
          "Food",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blueGrey,
    );
  }

  Widget _buildCategoryListSection() {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.deepOrangeAccent,
    );
  }

  Widget _buildFoodListSection() {
    return Container(
      width: double.infinity,
      height: 400,
      color: Colors.cyan,
    );
  }
}
