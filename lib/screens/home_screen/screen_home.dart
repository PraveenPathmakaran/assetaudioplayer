// ignore_for_file: prefer_const_constructors

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/functions/design_funcions.dart';
import 'package:musicplayer/screens/favourite_screen/screen_favourite.dart';
import 'package:musicplayer/screens/play_screen/screen_play.dart';
import 'package:musicplayer/screens/playlist_screen/screen_playlist.dart';
import 'package:musicplayer/screens/splash_screen/screen_splash.dart';
import '../../functions/asset_audioplayer.dart';
import 'home_classes.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> with TickerProviderStateMixin {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this, initialIndex: 1);
    setupPlaylist();
  }

  @override
  void dispose() {
    controller.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        width: 250,
        backgroundColor: Colors.transparent,
        child: DrawerContent(),
      ),
      appBar: AppBar(
        title: Text('Music Player'),
        centerTitle: true,
        backgroundColor: roseColor,
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: 'Favourites',
              icon: functionIcon(Icons.favorite, 30, whiteColor),
            ),
            Tab(
              text: 'Home',
              icon: functionIcon(Icons.home, 35, whiteColor),
            ),
            Tab(
              text: 'Playlist',
              icon: functionIcon(Icons.playlist_play, 35, whiteColor),
            ),
          ],
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(19),
            child: functionIcon(Icons.search, 30, whiteColor),
          ),
        ],
      ),
      body: TabBarView(
        controller: controller,
        children: [
          functionContainer(ScreenFavourite()),
          functionContainer(HomeListView()),
          functionContainer(ScreenPlaylist()),
        ],
      ),
      bottomNavigationBar: functionMiniPlayer(context),
    );
  }
}
