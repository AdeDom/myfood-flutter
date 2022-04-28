import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTopSection(),
            _buildCenterSection(),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Expanded(
      flex: 7,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  spreadRadius: 5,
                  blurRadius: 10,
                )
              ],
            ),
            child: const ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              child: Image(
                image: AssetImage("assets/images/bg_welcome.png"),
                alignment: Alignment.center,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo_black.png",
                  width: 200,
                ),
                Image.asset(
                  "assets/images/logo_food_delivery.png",
                  width: 110,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterSection() {
    return Expanded(
      flex: 3,
      child: Container(),
    );
  }

  Widget _buildBottomSection() {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          _buildLoginButton(),
          _buildRegisterButton(),
        ],
      ),
    );
  }

  Container _buildLoginButton() {
    return Container(
      width: 380,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromARGB(230, 255, 215, 0),
      ),
      child: const Center(
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container _buildRegisterButton() {
    return Container(
      width: 380,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(230, 255, 215, 0),
        ),
      ),
      child: const Center(
        child: Text(
          "Create an Account",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}