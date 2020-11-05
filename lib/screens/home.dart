import 'package:flutter/material.dart';
import 'package:youtube_bloc/delegates/dataSearch.dart';

class Home extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black87,
            flexibleSpace: Container(
              margin: EdgeInsets.only(left: 16,top: MediaQuery.of(context).size.height*0.04),
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width*0.08,
                      child: Image.asset('assets/images/youtube-logo.png')),
                  SizedBox(width: 4,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('YouTube', style: TextStyle(fontFamily: 'Youtube-Sans',color: Colors.white),)),

                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.5,),
                  IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){
                    showSearch(context: context, delegate: DataSearch());
                  })
                ],
              ),

            ),
          ),
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
      )
    );
  }
}
