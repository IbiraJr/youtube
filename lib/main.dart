import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_bloc/view/home/home_view.dart';
import 'view/home/home_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
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
        home: HomeView());
  }
}
