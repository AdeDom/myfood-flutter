import 'package:flutter/material.dart';
import 'package:myfood/data/models/youtubes.dart';
import 'package:myfood/data/source/remote/learning/learning_remote_data_source.dart';
import 'package:myfood/presentation/welcome/widget/build_welcome_bottom_section.dart';
import 'package:myfood/presentation/welcome/widget/build_welcome_center_section.dart';
import 'package:myfood/presentation/welcome/widget/build_welcome_top_section.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _fetchYoutube();
    return Scaffold(
      body: Column(
        children: const [
          BuildWelcomeTopSection(),
          BuildWelcomeCenterSection(),
          BuildWelcomeBottomSection(),
        ],
      ),
    );
  }

  void _fetchYoutube() async {
    LearningRemoteDataSource learningRemoteDataSource =
        LearningRemoteDataSourceImpl();
    YoutubeResponse youtubeResponse =
        await learningRemoteDataSource.fetchYoutube();
    for (var item in youtubeResponse.youtubes) {
      print("item : ${item.title}");
    }
  }
}
