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
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Context Menu Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              // Handle item tap (e.g., view details)
              _showItemDetails(context, items[index]);
            },
            onLongPress: () {
              // Show context menu
              _showContextMenu(context, index);
            },
          );
        },
      ),
    );
  }

  void _showContextMenu(BuildContext context, int index) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final Rect popupMenuPosition = Rect.fromPoints(
      Localizations.localeOf(context).languageCode == 'ar'
          ? overlay.localToGlobal(overlay.size.bottomRight(Offset.zero), ancestor: overlay)
          : overlay.localToGlobal(overlay.size.topLeft(Offset.zero), ancestor: overlay),
      Localizations.localeOf(context).languageCode == 'ar'
          ? overlay.localToGlobal(overlay.size.bottomLeft(Offset.zero), ancestor: overlay)
          : overlay.localToGlobal(overlay.size.topRight(Offset.zero), ancestor: overlay),
    );

    showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(popupMenuPosition, popupMenuPosition),
      items: <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'view',
          child: ListTile(
            leading: Icon(Icons.visibility),
            title: Text('View'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'edit',
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),
      ],
    ).then((String? value) {
      if (value != null) {
        // Handle the selected option
        if (value == 'view') {
          _showItemDetails(context, items[index]);
        } else if (value == 'edit') {
          _editItem(index);
        } else if (value == 'delete') {
          _deleteItem(index);
        }
      }
    });
  }

  void _showItemDetails(BuildContext context, String itemName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item Details'),
          content: Text('You selected item: $itemName'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _editItem(int index) {
    // Implement edit logic here
    print('Edit item at index $index');
  }

  void _deleteItem(int index) {
    // Implement delete logic here
    setState(() {
      items.removeAt(index);
    });
    print('Delete item at index $index');
  }
}
