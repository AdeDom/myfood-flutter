import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:myfood/data/models/youtubes.dart';

abstract class LearningRemoteDataSource {
  Future<YoutubeResponse> fetchYoutube();
}

class LearningRemoteDataSourceImpl implements LearningRemoteDataSource {
  @override
  Future<YoutubeResponse> fetchYoutube() async {
    String url =
        "https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=superhero";
    const _authority = "codemobiles.com";
    const _path = "/adhoc/youtubes/index_new.php";
    final _params = {
      "username": "admin",
      "password": "password",
      "type": "superhero",
    };
    final _uri = Uri.https(_authority, _path, _params);

    final response = await http.get(_uri);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      YoutubeResponse youtubeResponse = YoutubeResponse.fromJson(jsonResponse);
      return youtubeResponse;
    } else {
      throw const HttpException("Api error.");
    }
  }
}
