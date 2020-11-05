import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_bloc/api/apiYoutube.dart';
import 'package:youtube_bloc/model/video.dart';

class DataSearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isNotEmpty?IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = '';
      }):IconButton(icon: Icon(Icons.mic_none), onPressed: (){
      }),
      IconButton(icon: Icon(Icons.cast), onPressed: (){

      }),

    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation),
        onPressed: (){
          close(context, null);
        },);
  }

  @override
  Widget buildResults(BuildContext context) {
    showResults(context);
   return FutureBuilder(
     future: Api().search(query),
     builder: (context, snapshot) {
       if(snapshot.hasData){
         List<Video> videos = snapshot.data;
         return ListView.builder(
           itemCount: videos.length,
           itemBuilder: (context, index) {
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               child: Column(
                 children: [
                   Container(
                     child: Image.network(videos[index].snippet.thumbnails.medium.url),
                   ),
                 ],
               ),
             ),
           );
         },);
       }else{
         return Center(child: CircularProgressIndicator(),);
       }
     },
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty) return Container();
    else
      return FutureBuilder<List>(
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]),
                  leading: Icon(Icons.play_arrow),
                  onTap: (){
                    query = snapshot.data[index];
                    buildResults(context);
                  },
                );
              },
              itemCount: snapshot.data.length,
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
      },future: suggetions(query),);
  }
  Future<List> suggetions(String search) async {
    http.Response response = await http.get(
        "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"
    );
    if(response.statusCode == 200){
      return json.decode(response.body)[1].map((v){
        return v[0];
      }).toList();
    }else{
      throw Exception('Sem Sugestões');
    }
  }
}