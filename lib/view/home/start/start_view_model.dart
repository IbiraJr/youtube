import 'package:youtube_bloc/model/video.dart';

class StartViewModel {


  Future<List<Video>> getVideos(String x) async{
    await Future.delayed(Duration(seconds: 2));
    return [Video()];
  }
}