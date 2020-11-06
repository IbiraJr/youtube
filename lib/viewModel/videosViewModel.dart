
import 'package:flutter/material.dart';
import 'package:youtube_bloc/api/apiYoutube.dart';
import 'package:youtube_bloc/model/video.dart';

class VideosViewModel extends ChangeNotifier {
  List<Video> videos = [];
  Api api = Api();
  Future<List<Video>> getVideosFromSearch(String query) async{
    videos = await api.search(query);
  }
}