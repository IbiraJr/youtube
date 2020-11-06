import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_bloc/api/apiConnection.dart';
import 'package:youtube_bloc/model/channel.dart';
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
  Future<Channel> getChannel(String idChannel)async{
    try{
      http.Response response = await http.get("https://youtube.googleapis.com/youtube/v3/channels?part=id&part=snippet&part=contentDetails&id=$idChannel&key=$youtubeKey");
      if(response.statusCode == 200){
        var body = json.decode(response.body);
        Channel channel = Channel.fromJson(body["items"].first());
        print(channel.toJson());
        return channel;
      }
    }catch(e){
      print('ERROR: GETCHANNEL() - $e');
    }
  }
}