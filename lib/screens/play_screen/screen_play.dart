// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/functions/design_funcions.dart';

RealtimePlayingInfos? realtimePlayingInfos1;

class ScreePlay extends StatefulWidget {
  ScreePlay({Key? key}) : super(key: key);

  @override
  State<ScreePlay> createState() => _ScreePlayState();
}

class _ScreePlayState extends State<ScreePlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2C3639),
        elevation: 0,
        title: Text('Now Playing'),
        centerTitle: true,
      ),
      body: audioPlayer.builderRealtimePlayingInfos(
          builder: (contex, realtimePlayingInfos) {
        realtimePlayingInfos1 = realtimePlayingInfos;
        if (realtimePlayingInfos != null) {
          return functionContainer(PlayContainer());
        } else {
          return functionContainer(
            PlayContainer(),
          );
        }
      }),
    );
  }
}

class PlayContainer extends StatelessWidget {
  PlayContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/musicIcon2.png'),
              radius: 130,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
              child: functionText(
                  realtimePlayingInfos1!.current!.audio.audio.metas.title
                      .toString(),
                  Colors.white,
                  FontWeight.w600,
                  16),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: functionText(
                  realtimePlayingInfos1!.current!.audio.audio.metas.artist
                      .toString(),
                  Colors.white,
                  FontWeight.w500,
                  12.5),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                functionIcon(Icons.favorite, 30, whiteColor),
                functionIcon(Icons.repeat, 35, whiteColor),
                functionIcon(Icons.playlist_play, 35, whiteColor),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            slider(realtimePlayingInfos1!),
            Container(
              transform: Matrix4.translationValues(0, -5, 0),
              margin: EdgeInsets.fromLTRB(5, 0, 5, 15),
              child: timeStamps(realtimePlayingInfos1!),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: functionIcon(Icons.skip_previous, 55, Colors.white),
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      audioPlayer.previous();
                    },
                  ),
                  GestureDetector(
                    child: realtimePlayingInfos1!.isPlaying
                        ? functionIcon(Icons.pause, 55, Colors.white)
                        : functionIcon(
                            Icons.play_arrow_rounded, 55, Colors.white),
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      audioPlayer.playOrPause();
                    },
                  ),
                  GestureDetector(
                    child: functionIcon(Icons.skip_next, 55, Colors.white),
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      audioPlayer.next();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
