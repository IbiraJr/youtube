import 'package:flutter/material.dart';
import 'package:youtube_bloc/components/youtube_appbar.dart';
import 'package:youtube_bloc/model/video.dart';
import 'package:youtube_bloc/view/home/start/start_view_model.dart';

class StartView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: StartViewModel().getVideos('a'),
      builder: (context, snapshot) {
       if(snapshot.connectionState == ConnectionState.done){
         return CustomScrollView(
           controller: _scrollController,
           slivers: [
             YoutubeAppBar(),
             SliverList(
               delegate: SliverChildBuilderDelegate(
                       (BuildContext context, int index){
                     return Container(
                       color: Colors.black54,
                       child: Column(
                         children: [

                         ],
                       ),
                     );
                   },
                   childCount: 10
               ),

             ),
           ],
         );
       }else{
         return Center(child: CircularProgressIndicator(),);
       }
      }
    );
  }
}
