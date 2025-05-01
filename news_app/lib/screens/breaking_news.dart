// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../Model/BreakingNews.dart';
//
// class NewsHorizontalListScreen extends StatefulWidget {
//   const NewsHorizontalListScreen({super.key});
//
//   @override
//   State<NewsHorizontalListScreen> createState() =>
//       _NewsHorizontalListScreenState();
// }
//
// class _NewsHorizontalListScreenState extends State<NewsHorizontalListScreen> {
//   final PageController _pageController = PageController(viewportFraction: 0.8);
//   int _currentPage = 0;
//
//   Future<BreakingNews> fetchNews() async {
//     final response = await http.get(
//       Uri.parse('https://webhook.site/490b36c0-8da2-4582-9b86-ad9d48751071'),
//     );
//
//     if (response.statusCode == 200) {
//       return BreakingNews.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//       int nextPage = _pageController.page?.round() ?? 0;
//       if (_currentPage != nextPage) {
//         setState(() {
//           _currentPage = nextPage;
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<BreakingNews>(
//       future: fetchNews(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (snapshot.hasData && snapshot.data!.news != null) {
//           final newsList = snapshot.data!.news!;
//
//           return Column(
//             children: [
//               Expanded(
//                 child: PageView.builder(
//                   controller: _pageController,
//                   itemCount: newsList.length,
//                   itemBuilder: (context, index) {
//                     return AnimatedBuilder(
//                       animation: _pageController,
//                       builder: (context, child) {
//                         double scale = 1.0;
//                         if (_pageController.position.haveDimensions) {
//                           double currentPage =
//                               _pageController.page ??
//                               _pageController.initialPage.toDouble();
//                           scale = (1 - ((currentPage - index).abs() * 0.4))
//                               .clamp(0.7, 1.1);
//                         }
//
//                         final news = newsList[index];
//
//                         return Center(
//                           child: SizedBox(
//                             height: 250 * scale,
//                             width: 350 * scale,
//                             child: Container(
//                               margin: const EdgeInsets.symmetric(
//                                 horizontal: 8,
//                                 vertical: 20,
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(16),
//                                 image: DecorationImage(
//                                   image: NetworkImage(news.imageUrl ?? ''),
//                                   fit: BoxFit.cover,
//                                 ),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                     color: Colors.black26,
//                                     blurRadius: 10,
//                                     offset: Offset(0, 5),
//                                   ),
//                                 ],
//                               ),
//                               alignment: Alignment.bottomLeft,
//                               child: Container(
//                                 padding: const EdgeInsets.all(10),
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   color: Colors.black.withOpacity(0.6),
//                                   borderRadius: const BorderRadius.only(
//                                     bottomLeft: Radius.circular(16),
//                                     bottomRight: Radius.circular(16),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   news.headline ?? '',
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   newsList.length, // IMPORTANT: based on actual list
//                   (index) => AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     margin: const EdgeInsets.symmetric(horizontal: 4),
//                     width: _currentPage == index ? 12 : 8,
//                     height: _currentPage == index ? 12 : 8,
//                     decoration: BoxDecoration(
//                       color: _currentPage == index ? Colors.blue : Colors.grey,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//             ],
//           );
//         } else {
//           return const Center(child: Text('No news available'));
//         }
//       },
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/BreakingNews.dart';

class NewsHorizontalListScreen extends StatefulWidget {
  const NewsHorizontalListScreen({super.key});

  @override
  State<NewsHorizontalListScreen> createState() =>
      _NewsHorizontalListScreenState();
}

class _NewsHorizontalListScreenState extends State<NewsHorizontalListScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;
  late Future<BreakingNews> _breakingNewsFuture; // Store Future here
  bool _dataFetched = false; // Flag to prevent refetching

  Future<BreakingNews> fetchNews() async {
    final response = await http.get(
      Uri.parse(
        'https://gist.githubusercontent.com/ArhamAliKhan/7c3a82861cf7c819c54afa19a1b43ec1/raw/6e30f60483b8d7f52e2de992e3c7c8f70f9aa411/gistfile1.txt',
      ),
    );

    if (response.statusCode == 200) {
      return BreakingNews.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  void initState() {
    super.initState();
    if (!_dataFetched) {
      _breakingNewsFuture = fetchNews(); // Load data only once
      _dataFetched = true;
    }
    _pageController.addListener(() {
      int nextPage = _pageController.page?.round() ?? 0;
      if (_currentPage != nextPage) {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BreakingNews>(
      future: _breakingNewsFuture, // Use cached future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData &&
            snapshot.data!.news != null &&
            snapshot.data!.news!.isNotEmpty) {
          final newsList = snapshot.data!.news!;
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        double scale = 1.0;
                        if (_pageController.position.haveDimensions) {
                          double currentPage =
                              _pageController.page ??
                              _pageController.initialPage.toDouble();
                          scale = (1 - ((currentPage - index).abs() * 0.4))
                              .clamp(0.7, 1.1);
                        }

                        final news = newsList[index];

                        return Center(
                          child: SizedBox(
                            height: 250 * scale,
                            width: 350 * scale,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: NetworkImage(news.imageUrl ?? ''),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  news.headline ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  newsList.length, // IMPORTANT: based on actual list
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 12 : 8,
                    height: _currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.blue : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        } else {
          return const Center(child: Text('No news available'));
        }
      },
    );
  }
}
