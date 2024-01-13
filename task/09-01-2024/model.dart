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
          leading: Text(list[i]['id'].toString()),
          title: Text(list[i]['category_name'].toString()),
          subtitle: Image.network(list[i]['category_img'] ?? ''),
        );
      },
    );
  }
}
