import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_bloc/api/apiConnection.dart';
import 'package:youtube_bloc/model/video.dart';

class Api {
  Future<List<Video>>search(String search) async {
    try {
      http.Response response = await http.get(
          "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$youtubeKey&maxResults=10"
      );

      if(response.statusCode == 200){
        var body = json.decode(response.body);
        var listItems = [];
        listItems = body["items"];
        List<Video> videos = [];
        listItems.forEach((element) {
          videos.add(Video.fromJson(element));
        });
        return videos;
      }
    }catch(e){
      print('ERROR: SEARCH() - $e');
    }

  }
}