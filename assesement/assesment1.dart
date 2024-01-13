// main.dart

import 'package:flutter/material.dart';
import 'assesment2.dart';
import 'notebook.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Notebook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ENotebookScreen(),
    );
  }
}

class ENotebookScreen extends StatefulWidget {
  @override
  _ENotebookScreenState createState() => _ENotebookScreenState();
}

class _ENotebookScreenState extends State<ENotebookScreen> {
  Notebook notebook = Notebook();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notebook'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _generateNote();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(

              child: Text(
                'E-Notebook',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (

              ) {
                if (_getCategoryText(index) == 'Travel') {
                  // Navigate to the details screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
                    ),
                  );
                } else {
                  // Implement grid item click functionality for other categories
                }
            },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),

                  Image.network(
                    _getCategoryImageUrl(index),
                    height: 100,
                    width: 100,
                  ),

                  Text(
                    _getCategoryText(index),
                    style: TextStyle(fontSize: 16),

                  ),
                ],
              ),
            );
          },
          itemCount: 4,
        ),

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Edit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Mic',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Check Box',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
              label: 'More'
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black, // Customize the unselected item color
        backgroundColor: Colors.white,
        onTap: (int index) {
          // Implement bottom navigation bar item click functionality
        },
      ),
    );
  }

  void _generateNote() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Generate Note'),
          content: Column(
            children: [
              TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(labelText: 'Note Type (Text/Image)'),
                onChanged: (value) => notebook.noteType = value,
              ),
              TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(labelText: 'Note Content'),
                onChanged: (value) => notebook.content = value,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                notebook.generateNote();
                Navigator.pop(context);
                _showConfirmationMessage('Note generated successfully!');
              },
              child: Text('Generate'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String _getCategoryImageUrl(int index) {
    // Replace with the actual URLs of your network images
    switch (index) {
      case 0:
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXG5JFBv3VIatKX1Qbvb9KV88c3x0d0GBAtw&usqp=CAU';
      case 1:
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRapSbLHX4rO4ydVgv1Lc-M2GmZjp-kVzP79Q&usqp=CAU';
      case 2:
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuDsCvW11yY8lzRrUCmM9FsuH9LYpYCdKZuw&usqp=CAU';
      case 3:
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlsUGCHaGxo6jy__WGDthjeZ36e4u_LjQabPCnjGBqnb3XaPZnl4dpNUigMJ4KFqoBt0k&usqp=CAU';
      default:
        return '';
    }
  }

  String _getCategoryText(int index) {
    switch (index) {
      case 0:
        return 'Travel';
      case 1:
        return 'ideas';
      case 2:
        return 'books';
      case 3:
        return 'Recipes';
      default:
        return '';
    }
  }
}



