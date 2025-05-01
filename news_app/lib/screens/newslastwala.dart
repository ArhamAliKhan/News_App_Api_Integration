// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class FetchNewsExample extends StatefulWidget {
//   const FetchNewsExample({super.key});
//
//   @override
//   State<FetchNewsExample> createState() => _FetchNewsExampleState();
// }
//
// class _FetchNewsExampleState extends State<FetchNewsExample> {
//   Future<List<dynamic>> getArticles() async {
//     final response = await http.get(
//       Uri.parse(
//         'https://webhook.site/4b8d0ef8-d4d0-4f5e-ae79-96b6f0f3ba14',
//       ), // Replace with your actual API URL
//     );
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data['articles'];
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getArticles(),
//       builder: (context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text("Error: ${snapshot.error}"));
//         } else if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data.length,
//             itemBuilder: (context, index) {
//               var article = snapshot.data[index];
//               return ListTile(
//                 leading: Image.network(
//                   article['urlToImage'] ?? 'https://via.placeholder.com/150',
//                 ),
//                 title: Text(
//                   article['title'] ?? 'No Title',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text(
//                   article['content'] != null
//                       ? (article['content'].length > 100
//                           ? article['content'].substring(0, 100) + '...'
//                           : article['content'])
//                       : 'No Content Available',
//                   maxLines: 3,
//                   overflow:
//                       TextOverflow
//                           .ellipsis, // This will add "..." if the content is long
//                 ),
//                 onTap: () {
//                   // You can add navigation to detailed view if needed
//                 },
//               );
//             },
//           );
//         } else {
//           return const Center(child: Text("No data available"));
//         }
//       },
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchNewsExample extends StatefulWidget {
  const FetchNewsExample({super.key});

  @override
  State<FetchNewsExample> createState() => _FetchNewsExampleState();
}

class _FetchNewsExampleState extends State<FetchNewsExample> {
  Future<List<dynamic>> getArticles() async {
    final response = await http.get(
      Uri.parse(
        'https://gist.githubusercontent.com/ArhamAliKhan/7c3a82861cf7c819c54afa19a1b43ec1/raw/b27eec647d9c0d09fa21b176ea2340533a39be90/gistfile1.txt',
      ), // Replace with your actual API URL
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getArticles(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var article = snapshot.data[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    SizedBox(
                      width: 100, // You can adjust the size as needed
                      height: 100, // Adjust this as per your requirement
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          article['urlToImage'] ??
                              'https://via.placeholder.com/150',
                          fit: BoxFit.cover, // Makes sure image fits in box
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // Space between image and text
                    // Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article['title'] ?? 'No Title',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16, // Adjust text size
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            article['content'] != null
                                ? (article['content'].length > 100
                                    ? article['content'].substring(0, 100) +
                                        '...'
                                    : article['content'])
                                : 'No Content Available',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            // Handles long text
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(child: Text("No data available"));
        }
      },
    );
  }
}
