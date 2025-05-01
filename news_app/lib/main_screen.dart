import 'package:flutter/material.dart';

class ListWala extends StatelessWidget {
  const ListWala({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25),
              ClipRRect(
                borderRadius: BorderRadius.circular(31),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  child: Image.network(
                    'https://c8.alamy.com/comp/2BA7JWB/beautiful-shot-of-oxford-university-dormitories-facade-england-united-kingdom-typical-english-architecture-in-the-city-of-dreaming-spires-vertical-2BA7JWB.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 25),

              Center(
                child: Text(
                  'News from around the \n world for you ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: Text(
                  'Best time to read, take your time to read a little more of this world',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 21),
                ),
              ),
              SizedBox(height: 15),

              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
