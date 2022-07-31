// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../functions/asset_audioplayer.dart';
import '../../functions/design_funcions.dart';

//Home page listtile
class HomeListView extends StatefulWidget {
  const HomeListView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ListView.builder(
          controller: ScrollController(),
          itemBuilder: ((context, index) {
            return Card(
              margin: EdgeInsets.all(3),
              color: Color.fromARGB(23, 0, 0, 0),
              child: ListTile(
                  onTap: () {
                    audioPlayer.playlistPlayAtIndex(index);
                    miniPlayerVisibility.value = true;
                  },
                  isThreeLine: true,
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/musicIcon1.png'),
                  ),
                  title: functionText(
                      audioSongsList[index].metas.title.toString(),
                      whiteColor,
                      FontWeight.normal,
                      15),
                  subtitle: functionText(
                      audioSongsList[index].metas.artist.toString(),
                      whiteColor,
                      FontWeight.normal,
                      10),
                  trailing: IconButton(
                    icon: functionIcon(Icons.more_horiz, 30, Colors.white),
                    onPressed: () {
                      showModalSheetHome(context);
                    },
                  )),
            );
          }),
          itemCount: audioSongsList.length,
          shrinkWrap: true,
        ),
      ]),
    );
  }
}

//Drawer Content
class DrawerContent extends StatefulWidget {
  const DrawerContent({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              functionText('PLAY', whiteColor, FontWeight.bold, 35),
              SizedBox(
                height: height * 0.01,
              ),
              functionText('Music Player', whiteColor, FontWeight.bold, 25),
              functionSizedBox(0, 50),
              Row(
                children: [
                  functionTextButton(() {}, 'Notifications'),
                  Switch(
                    activeTrackColor: Colors.white,
                    activeColor: whiteColor,
                    value: true,
                    onChanged: ((value) {}),
                  ),
                ],
              ),
              functionTextButton(() {}, 'Privacy Policy'),
              functionTextButton(() {}, 'Settings'),
              functionTextButton(() {}, 'About'),
              functionTextButton(() {
                SystemNavigator.pop();
              }, 'Exit'),
            ],
          ),
        ),
      ),
    );
  }
}
