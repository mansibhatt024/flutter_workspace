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
          leading: Image.network(list[i]['a_image'] ?? '',height: 400,width: 100,),
          title: Text(list[i]['a_version_name'].toString()),
          subtitle:Text(list[i]['a_name'].toString()),
        );
      },
    );
  }
}
