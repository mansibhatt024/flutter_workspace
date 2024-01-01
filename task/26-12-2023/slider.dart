import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// Import your CustomGrid widget
import 'gridview.dart';

void main() {

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider")),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnFR_3_CZLOZBKBPTCvL1wsigNuG_gza-ohQ&usqp=CAU"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuMklakVnHYoBUBUg3vK9C7lo9tyTTl_sRzw&usqp=CAU"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZHFbXN5juKqDReXuskfwrsvayCg-wejwViA&usqp=CAU"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbV5RWCpNUngAbUzY9sgufCkAuFGPPkba1Og&usqp=CAU"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8vKSPCZN0b3PPOGmsDdHMdCQfRXa7JdU4YA&usqp=CAU"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqicB2MfCxox6hyF8Gftajb3wM9HFhzFBJVw&usqp=CAU"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],

            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.easeInBack,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          SizedBox(height: 20), // Add some spacing between the carousel and grid
          // Custom Grid
          Expanded(
            child: CustomGrid(),
          ),
        ],
      ),
    );
  }
}
