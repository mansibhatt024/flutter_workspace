import 'package:flutter/material.dart';

import 'model.dart';

class CustomGrid extends StatefulWidget {
  const CustomGrid({Key? key}) : super(key: key);

  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  final List<Model> items = [
    Model(
        image:
        'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/41RKkXSK8LL._AC_UF1000,1000_QL80_DpWeblab_.jpg',
        text1: 'wall shelves',
        text2: 'Rs.2500'),
    Model(
        image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg272oTHpEjnFCN6Iz6WnoHXyyNyIHKzUyGg&usqp=CAU',
        text1: 'clock for wall',
        text2: 'Rs.3050'),
    Model(
        image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_ViuOE9iJN3iTpMxK72tBb3spHh9xNhi2Ew&usqp=CAU',
        text1: ' Vases in Silver',
        text2: 'Rs.2090'),
    Model(
        image:
        'https://images-na.ssl-images-amazon.com/images/I/61VmgDQCgRL._AC_UL600_SR600,600_.jpg',
        text1: ' Angel With Wings  in White Colour',
        text2: 'Rs.6200'),
    Model(
        image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsEGzrGv6IiuoD3qfbIJb6XVb-CcwA8FKmLA&usqp=CAU',
        text1: 'Candle holder',
        text2: 'Rs.1500'),
    Model(
        image:
        'https://imgmedia.lbb.in/media/2019/09/5d75e7c106af943d008a2c34_1568008129760.jpg',
        text1: 'table decoration',
        text2: 'Rs.2000')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Grid"),
      ),
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(items[index].image, width: double.infinity, height: 100, fit: BoxFit.cover),
              ListTile(
                title: Text(items[index].text1),
                subtitle: Text(items[index].text2),
              ),
            ],
          );
        },
      ),
    );
  }
}
