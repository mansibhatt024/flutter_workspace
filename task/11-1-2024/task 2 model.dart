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
          title: Text("name: ${list[i]['name']}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("realname: ${list[i]['realname']}"),
              Text("team: ${list[i]['team']}"),
              Text("firstappearance: ${list[i]['firstappearance']}"),
              Text("createdby: ${list[i]['createdby']}"),
              Text("publisher: ${list[i]['publisher']}"),
              Image.network(list[i]['imageurl'] ?? ''),
              Text("bio: ${list[i]['bio']}"),
            ],
          ),
        );
      },
    );
  }
}
