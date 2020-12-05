import 'package:flutter/material.dart';
import 'package:youtube_bloc/api/apiYoutube.dart';
import 'package:youtube_bloc/model/channel.dart';
import 'package:youtube_bloc/model/video.dart';
import 'package:youtube_bloc/view/home/explore/explore_view.dart';
import 'package:youtube_bloc/view/home/library/library_view.dart';
import 'package:youtube_bloc/view/home/start/start_view.dart';
import 'package:youtube_bloc/view/home/subscription/subscription_view.dart';

class HomeViewModel extends ChangeNotifier{
  List<Video> videos = [];
  Api api = Api();
  int bnbIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    StartView(),
    ExploreView(),
    SubscriptionView(),
    LibraryView()
  ];
  Future<List<Video>> getVideosFromSearch(String query) async{
    videos = await api.search(query);
    String channelIds ='';
    videos.forEach((element) {
      channelIds += '&id=' + element.snippet.channelId;
    });
    List<Channel> channels = [];
    channels.add(await api.getChannel(channelIds));
    notifyListeners();
    return videos;
  }
   void onTapBnbIndex(int index){
    bnbIndex = index;
    notifyListeners();
   }
}