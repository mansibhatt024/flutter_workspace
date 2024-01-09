//23. Create an application with Navigation Drawer with 3 tabs Gallery,
// audio and video and design each page with dummy data
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer App'),
      ),
      drawer: DrawerWidget(),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Tabs App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Gallery'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GalleryTab()),
              );
            },
          ),
          ListTile(
            title: Text('Audio'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AudioTab()),
              );
            },
          ),
          ListTile(
            title: Text('Video'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoTab()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class GalleryItem {
  final String title;
  final String imageUrl;

  GalleryItem({required this.title, required this.imageUrl});
}

class AudioItem {
  final String title;
  final String audioUrl;

  AudioItem({required this.title, required this.audioUrl});
}

class VideoItem {
  final String title;
  final String videoUrl;

  VideoItem({required this.title, required this.videoUrl});
}

class GalleryTab extends StatelessWidget {
  final List<GalleryItem> galleryItems = [
    GalleryItem(title: 'Image 1', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOAQTM6JLn_OBsbvQnYCIuQRq1AV09HNtFSg&usqp=CAU'),
    GalleryItem(title: 'Image 2', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLZiPC0Aingp5BAYV3ZTJqkHqcHyPLWyj4vQ&usqp=CAU'),
    // Add more dummy data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: ListView.builder(
        itemCount: galleryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(galleryItems[index].title),
            leading: Image.network(galleryItems[index].imageUrl),
          );
        },
      ),
    );
  }
}

class AudioTab extends StatelessWidget {
  final List<AudioItem> audioItems = [
    AudioItem(title: 'Audio 1', audioUrl: 'https://www.saregama.com/ghazals-sufi/song/chithi-na-koi-sandeshjagjit-singh_47350'),
    AudioItem(title: 'Audio 2', audioUrl: 'https://www.saregama.com/song/aawaz-do-humkohappy_47349'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio'),
      ),
      body: ListView.builder(
        itemCount: audioItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(audioItems[index].title),
            // You can use a package like audioplayers to play audio here
          );
        },
      ),
    );
  }
}

class VideoTab extends StatelessWidget {
  final List<VideoItem> videoItems = [
    VideoItem(title: 'Video 1', videoUrl: 'https://www.youtube.com/watch?v=B0U9z4gtEtc'),
    VideoItem(title: 'Video 2', videoUrl: 'https://www.youtube.com/watch?v=mwU0xr2jhIU&t=2550s'),
    // Add more dummy data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: ListView.builder(
        itemCount: videoItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(videoItems[index].title),
            // You can use a package like chewie to display videos here
          );
        },
      ),
    );
  }
}
