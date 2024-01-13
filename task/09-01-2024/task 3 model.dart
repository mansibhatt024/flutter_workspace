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
          title: Text("Id: ${list[i]['Id']}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("title: ${list[i]['title']}"),
              Text("description: ${list[i]['description']}"),
              Text("platforms: ${list[i]['platforms']}"),
              Image.network(list[i]['image'] ?? ''),

            ],
          ),
        );
      },
    );
  }
}
