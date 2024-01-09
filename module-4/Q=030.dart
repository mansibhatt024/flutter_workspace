import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> names = [];
  TextEditingController nameController = TextEditingController();
  String selectedName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter Name'),
              onSubmitted: (value) {
                addNameToList(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(names[index]),
                  onTap: () {
                    showNameDialog(names[index]);
                  },
                  onLongPress: () {
                    showContextMenu(names[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addNameToList(String name) {
    setState(() {
      names.add(name);
      nameController.clear();
    });
  }

  void showNameDialog(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Selected Name"),
          content: Text(name),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showContextMenu(String name) {
    setState(() {
      selectedName = name;
    });

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(0, 0, 0, 0),
      items: [
        PopupMenuItem<String>(
          value: 'delete',
          child: Text('Delete Item'),
        ),
        PopupMenuItem<String>(
          value: 'edit',
          child: Text('Edit Item'),
        ),
      ],
    ).then((value) {
      if (value == 'delete') {
        showDeleteAlertDialog();
      } else if (value == 'edit') {
        editItem();
      }
    });
  }

  void showDeleteAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Item"),
          content: Text("Are you sure want to delete $selectedName?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                deleteItem();
                Navigator.of(context).pop();
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  void deleteItem() {
    setState(() {
      names.remove(selectedName);
    });
  }

  void editItem() {
    nameController.text = selectedName;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Item"),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Edit Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                updateItem();
                Navigator.of(context).pop();
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void updateItem() {
    setState(() {
      names[names.indexOf(selectedName)] = nameController.text;
      nameController.clear();
    });
  }
}
