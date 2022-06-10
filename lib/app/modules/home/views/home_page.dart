import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:myfood/app/config/app_constant.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FormBuilderTextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          labelStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          labelText: "Search food",
          prefixIcon: const Icon(Icons.search),
        ),
        // validator: controller.validateEmail,
        name: AppConstant.searchKey,
        // onChanged: controller.setEmail,
        // initialValue: email,
      ),
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
