// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:musicplayer/functions/design_funcions.dart';
import 'package:musicplayer/screens/playlist_screen/screen_playlist_songs.dart';

class ScreenPlaylist extends StatefulWidget {
  const ScreenPlaylist({Key? key}) : super(key: key);

  @override
  State<ScreenPlaylist> createState() => _ScreenPlaylistState();
}

class _ScreenPlaylistState extends State<ScreenPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: roseColor,
          onPressed: (() {
            openDialog(context);
          }),
          child: functionIcon(Icons.add, 15, Colors.white)),
      body: functionContainer(PlaylistContent()),
    );
  }
}

class PlaylistContent extends StatefulWidget {
  const PlaylistContent({
    Key? key,
  }) : super(key: key);

  @override
  State<PlaylistContent> createState() => _PlaylistContentState();
}

class _PlaylistContentState extends State<PlaylistContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: ((context, index) {
          return ListTile(
            onTap: (() {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return ScreenPlaylistSongs();
              })));
            }),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 25,
              backgroundImage: AssetImage('assets/images/music.png'),
            ),
            title: functionText('Melody', Colors.white, FontWeight.normal, 15),
            subtitle:
                functionText('Count', Colors.white, FontWeight.normal, 10),
            trailing: IconButton(
              icon: functionIcon(Icons.more_horiz, 30, Colors.white),
              onPressed: () {
                showModalSheetFavourite(context);
              },
            ),
          );
        }),
      ),
    );
  }
}
