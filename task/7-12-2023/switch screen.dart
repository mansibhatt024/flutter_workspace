import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SwitchEx extends StatefulWidget {
  @override
  _SwitchExState createState() => _SwitchExState();
}

class _SwitchExState extends State<SwitchEx> {
  bool isActivated = false;
  var textValue = 'Switch is OFF';
  // DateTime? currentBackPressTime;

  AudioPlayer _audioPlayer = AudioPlayer(); // Declare AudioPlayer instance
  String _audioUrl = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';

//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   Future<bool> onWillPop() async {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
//       currentBackPressTime = now;
//       return false; // Do not exit immediately
//     } else {
//       return true; // Trigger exit
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: onWillPop,
//       child: GestureDetector(
//         onDoubleTap: () async {
//           DateTime now = DateTime.now();
//           if (currentBackPressTime == null ||
//               now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
//             currentBackPressTime = now;
//           } else {
//             // Double-tap detected, trigger exit
//             Navigator.of(context).pop(true);
//           }
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Double Tap Exit Example'),
//           ),
//           body: Center(
//             child: Text('Your App Content Goes Here'),
//           ),
//         ),
//       ),
//     );
//   }
// }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _play() {
    _audioPlayer.play(UrlSource(_audioUrl));
  }

  void _pause() {
    _audioPlayer.pause();
  }

  void _stop() {
    _audioPlayer.stop();
  }

  // Function to start or stop music based on the switch state
  void handleMusicPlayback() {
    if (isActivated) {
      print('Music Play');
      _play(); // Call the play function when the switch is activated
    } else {
      print('Music Stop');
      _stop(); // Call the stop function when the switch is deactivated
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit Switch Screen'),
            content: Text('Are you sure you want to exit?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Switch Example"),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Transform.scale(
                scale: 2,
                child: Switch(
                  value: isActivated,
                  onChanged: (bool value) {
                    setState(() {
                      isActivated = value;
                      textValue = isActivated
                          ? 'Switch Button is ON'
                          : 'Switch Button is OFF';
                    });
                    handleMusicPlayback();
                  },
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.yellow,
                  inactiveThumbColor: Colors.redAccent,
                  inactiveTrackColor: Colors.orange,
                ),
              ),
              SizedBox(height: 20),
              Text("$textValue", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}



