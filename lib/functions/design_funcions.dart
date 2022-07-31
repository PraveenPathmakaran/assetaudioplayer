// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/screens/favourite_screen/screen_favourite.dart';
import 'package:musicplayer/screens/playlist_screen/screen_playlist.dart';
import '../screens/home_screen/home_classes.dart';
import '../screens/home_screen/screen_home.dart';
import '../screens/play_screen/screen_play.dart';

Color backgroundColor1 = Color(0xFF2C3639);
Color backgroundColor2 = Color(0xFF1e1c1d);
Color whiteColor = Colors.white;
Color roseColor = Color(0xFFaf1337);

double screenHeight = 0;
double screenWidth = 0;
ValueNotifier<bool> miniPlayerVisibility = ValueNotifier(false);
final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

//---------------------------functions for common usage

//common text function
Widget functionText(
    String content, Color color, FontWeight weight, double fontSize) {
  return Text(
    content,
    style: TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: fontSize,
    ),
  );
}

//common icon
Widget functionIcon(IconData icon1, double iconSize, Color iconColor) {
  return Icon(
    icon1,
    size: iconSize,
    color: iconColor,
  );
}

//sized box
Widget functionSizedBox(double width, double height) {
  return SizedBox(
    width: width,
    height: height,
  );
}

//text function
Widget functionTextButton(Function() textFunction, String text) {
  return TextButton(
    style: ButtonStyle(
        alignment: Alignment.centerLeft,
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(0),
        )),
    onPressed: textFunction,
    child: functionText(
      text,
      whiteColor,
      FontWeight.bold,
      20,
    ),
  );
}

//common color container
Widget functionContainer(Widget widgett) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF2C3639),
          Color(0xFF1e1c1d),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
      ),
    ),
    child: widgett,
  );
}
//------------------------------------------------end

//dialogue box for creating playlist in playlist screen
Future openDialog(BuildContext context3) async {
  showDialog(
      context: context3,
      builder: (ctx) {
        return AlertDialog(
          title: functionText(
              'Create Playlist', Colors.blue, FontWeight.normal, 20),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: 'Playlist Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Create'),
            ),
          ],
        );
      });
}

//bottom sheet for creating playlist and add favourite
Widget bottomSheetList(BuildContext context) {
  return ListView(
    children: [HomeListView()],
  );
}

//bottom sheet
Widget functionMiniPlayer(BuildContext context) {
  return audioPlayer.builderRealtimePlayingInfos(
      builder: (context, realtimePlayingInfos) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ScreePlay();
        }));
      },
      onDoubleTap: () {
        miniPlayerVisibility.value = false;
      },
      child: Visibility(
        visible: miniPlayerVisibility.value,
        child: Container(
          height: 85,
          color: backgroundColor2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/musicIcon1.png'),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          realtimePlayingInfos.current!.audio.audio.metas.title
                              .toString(),
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          realtimePlayingInfos.current!.audio.audio.metas.artist
                              .toString(),
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            audioPlayer.previous();
                          },
                          icon: functionIcon(
                              Icons.skip_previous, 40, Colors.white),
                        ),
                        IconButton(
                            onPressed: () {
                              audioPlayer.playOrPause();
                            },
                            icon: realtimePlayingInfos.isPlaying
                                ? functionIcon(Icons.pause, 40, Colors.white)
                                : functionIcon(Icons.play_arrow_rounded, 40,
                                    Colors.white)),
                        IconButton(
                          onPressed: () {
                            audioPlayer.next();
                          },
                          icon: functionIcon(Icons.skip_next, 40, Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  });
}

void showModalSheetFavourite(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return ScreenFavourite();
      });
}

void showModalSheetPlaylist(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return ScreenPlaylist();
      });
}

void showModalSheetHome(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return ScreenPlaylist();
      });
}

//------------------------------playscreen slider
Widget slider(RealtimePlayingInfos realtimePlayingInfos) {
  return Stack(
    children: [
      SliderTheme(
        data: SliderThemeData(
            thumbColor: Colors.white,
            activeTrackColor: Color(0xffe45923),
            inactiveTrackColor: Colors.grey,
            overlayColor: Colors.transparent),
        child: Slider.adaptive(
          value: realtimePlayingInfos.currentPosition.inSeconds.toDouble(),
          max: realtimePlayingInfos.duration.inSeconds.toDouble() + 3,
          min: -3,
          onChanged: ((value) {
            if (value <= 0) {
              audioPlayer.seek(Duration(seconds: 0));
            } else if (value >= realtimePlayingInfos.duration.inSeconds) {
              audioPlayer.seek(realtimePlayingInfos.duration);
            } else {
              audioPlayer.seek(Duration(seconds: value.toInt()));
            }
          }),
        ),
      ),
    ],
  );
}

Widget timeStamps(RealtimePlayingInfos realtimePlayingInfos) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          transformString(realtimePlayingInfos.currentPosition.inSeconds),
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          width: screenWidth * 0.7,
        ),
        Text(
          transformString(realtimePlayingInfos.duration.inSeconds),
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}

String transformString(int seconds) {
  String minuteString =
      '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
  String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
  return '$minuteString:$secondString';
}
//------------------------------playscreen slider end