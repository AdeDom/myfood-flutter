import 'package:flutter/material.dart';
import 'package:myfood/presentation/food_detail/food_detail.dart';

class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FoodDetail(foodId: 1),
                  ),
                );
              },
              child: const Text("Food detail 1"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FoodDetail(foodId: 2),
                  ),
                );
              },
              child: const Text("Food detail 2"),
            ),
          ],
        ),
      ),
    );
  }
}
