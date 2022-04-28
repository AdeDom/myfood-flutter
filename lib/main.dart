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
      child: Container(
        color: Colors.green,
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
      child: Container(
        color: Colors.orange,
      ),
    );
  }
}