import 'package:flutter/material.dart';

class Model extends StatelessWidget {
  late List list;

  Model({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text("Album ID: ${list[i]['albumId']}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: ${list[i]['id']}"),
              Text("Title: ${list[i]['title']}"),
              Text("URL: ${list[i]['url']}"),
              Image.network(list[i]['thumbnailUrl'] ?? ''),
            ],
          ),
        );
      },
    );
  }
}
