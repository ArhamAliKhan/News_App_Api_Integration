import 'package:flutter/material.dart';
import 'package:news_app/Navigation/viewall.dart';
import 'package:news_app/screens/listview.dart'; // Assuming this is your custom ListView widget
import 'breaking_news.dart';
import 'newslastwala.dart'; // I assume this widget is your content widget

class NewsMain extends StatefulWidget {
  const NewsMain({super.key});

  @override
  State<NewsMain> createState() => _NewsMainState();
}

class _NewsMainState extends State<NewsMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Flutter',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              TextSpan(
                text: 'News',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        // This allows scrolling when the content overflows
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // This could be a scrollable list of news or something else
              ListViewWalaScroll(),
              SizedBox(height: 5),
              SizedBox(height: 5),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    ' Breaking News',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 250, // Ensure this is the correct size
                child: NewsHorizontalListScreen(), // Ensure this widget works
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    ' Trending News',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Viewall()),
                      );
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250, // Ensure this is the correct size
                child: FetchNewsExample(), // Ensure this widget works
              ),
            ],
          ),
        ),
      ),
    );
  }
}
