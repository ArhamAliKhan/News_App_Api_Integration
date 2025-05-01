import 'package:flutter/material.dart';
import 'category_news_screen.dart'; // this is new, you’ll create it

class ListViewWalaScroll extends StatelessWidget {
  const ListViewWalaScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "name": "Technology",
        "image":
            "https://dashboard.thefinanser.com/wp-content/uploads/2024/02/Technology.jpg",
        "api":
            "https://gist.githubusercontent.com/ArhamAliKhan/7c3a82861cf7c819c54afa19a1b43ec1/raw/def149b1cec30d262d7abb79e77e8a66e2c8be52/gistfile1.txt",
      },
      {
        "name": "Business",
        "image":
            "https://www.shutterstock.com/image-photo/two-happy-busy-middle-aged-600nw-2479065515.jpg",
        "api":
            "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f59c30b2a5b749aeabd308298759d459",
        // Replace accordingly
      },
      {
        "name": "IT",
        "image":
            "https://thumbs.dreamstime.com/b/internet-information-technology-concept-laptop-computer-showing-data-processing-screen-122397310.jpg",
        "api":
            "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f59c30b2a5b749aeabd308298759d459",
        // Replace accordingly
      },
      {
        "name": " ",
        "image": "https://static.toiimg.com/photo/msid-97672613/97672613.jpg",
        "api":
            "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=f59c30b2a5b749aeabd308298759d459",
        // Replace accordingly
      },
    ];

    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => CategoryNewsScreen(
                        categoryName: category['name']!,
                        apiUrl: category['api']!,
                      ),
                ),
              );
            },
            child: Container(
              width: 140,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      category['image']!,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      category['name']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
