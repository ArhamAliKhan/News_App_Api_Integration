import 'package:flutter/material.dart';
import 'package:news_app/Model/BreakingNews.dart';
import 'package:news_app/main_screen.dart';
import 'package:news_app/screens/breaking_news.dart';
import 'package:news_app/screens/listview.dart';
import 'package:news_app/screens/news_main.dart';
import 'package:news_app/screens/newslastwala.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: NewsMain(),
    );
  }
}
