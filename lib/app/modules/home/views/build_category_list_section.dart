import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfood/app/modules/home/controllers/home_controller.dart';

class BuildCategoryListSection extends GetView<HomeController> {
  const BuildCategoryListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.green,
    );
  }
}
