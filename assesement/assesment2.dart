import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();

  bool isPlaying = false;
  Duration _duration = Duration();
  Duration _position = Duration();

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    await audioPlayer.play('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');

    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.PLAYING) {
        setState(() {
          isPlaying = true;
        });
      } else {
        setState(() {
          isPlaying = false;
        });
      }
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration position) {
      setState(() {
        _position = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            audioPlayer.stop();
            Navigator.pop(context);
          },
        ),
        title: Text('Travel Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Implement action for three dots button
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Section 1
            Text(
              'Travel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            // Image of Paris
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6p4j-VzkllqzV9lwGAEoUXjUFy4IRxNfMCQ&usqp=CAU',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 16),

            // Text Section 2
            Text(
              'Paris is the home of the most visited art museum in the world, the Louvre, as well as the Musee d\'Orsay, noted for its collection of French impressionist art, and the Musee national d\'Art moderne, a museum of modern and contemporary art.',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 16),

            // Audio player section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () {
                    if (isPlaying) {
                      audioPlayer.pause();
                    } else {
                      audioPlayer.resume();
                    }
                  },
                ),
                Text('${_position.inSeconds}/${_duration.inSeconds}'),
              ],
            ),

            SizedBox(height: 16),

            // Text Section 3
            Text(
              'Additional information',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 16),

            // Additional Text
            Text(
              'The notable architectural landmarks of Paris include Notre Dame Cathedral (12th century); the Sainte-Chapelle (13th century); the Eiffel Tower (1889); and the Basilica of Sacré-Cœur on Montmartre (1914). In 2014, Paris received 22.4 million visitors, making it one of the world\'s top tourist destinations.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
