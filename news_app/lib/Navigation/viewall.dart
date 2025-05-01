import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'articleview.dart'; // Import your article view screen

class Viewall extends StatefulWidget {
  const Viewall({super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {
  late Future<List<dynamic>> _articles;

  @override
  void initState() {
    super.initState();
    _articles = fetchArticles();
  }

  Future<List<dynamic>> fetchArticles() async {
    final response = await http.get(
      Uri.parse(
        'https://gist.githubusercontent.com/ArhamAliKhan/7c3a82861cf7c819c54afa19a1b43ec1/raw/d4ad530dce7a96a4db9b9ace57f4bb879ddc93b6/gistfile1.txt',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load articles');
    }
  }

  void _openWebView(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Articleview(url: url)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View All News'), centerTitle: true),
      body: FutureBuilder<List<dynamic>>(
        future: _articles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No articles found.'));
          } else {
            final articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return GestureDetector(
                  onTap: () => _openWebView(article['url']),
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        article['urlToImage'] != null
                            ? ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.network(
                                article['urlToImage'],
                                width: double.infinity,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            )
                            : Container(
                              width: double.infinity,
                              height: 250,
                              color: Colors.grey,
                              child: const Center(
                                child: Icon(Icons.broken_image, size: 50),
                              ),
                            ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            article['title'] ?? 'No Title',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            article['description'] ??
                                'No Description available',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
