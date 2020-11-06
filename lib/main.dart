import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_bloc/screens/home.dart';
import 'package:youtube_bloc/viewModel/videosViewModel.dart';

void main() {
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VideosViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Home()
    );
  }
}
