import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:myfood/app/config/app_constant.dart';
import 'package:myfood/app/data/models/category/category.dart';
import 'package:myfood/app/modules/home/controllers/home_controller.dart';
import 'package:myfood/app/routes/app_pages.dart';

class HomePage extends GetView<HomeController> {
  final List<Category>? categoryList;

  const HomePage({
    Key? key,
    this.categoryList,
  }) : super(key: key);

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
    return Row(
      children: [
        const SizedBox(
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
        ),
        Expanded(child: Container()),
        IconButton(
          onPressed: () {
            controller.setLogout();
            Get.offAllNamed(Routes.WELCOME);
          },
          icon: const Icon(Icons.logout),
        ),
      ],
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
    if (categoryList == null) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Image.network(
                          categoryList![index].image ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      categoryList![index].categoryName ?? "",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    }
  }

  Widget _buildFoodListSection() {
    return Container(
      width: double.infinity,
      height: 400,
      color: Colors.cyan,
    );
  }
}
