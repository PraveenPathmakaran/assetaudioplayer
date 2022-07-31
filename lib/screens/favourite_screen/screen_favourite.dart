// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../functions/design_funcions.dart';
import '../play_screen/screen_play.dart';

class ScreenFavourite extends StatefulWidget {
  const ScreenFavourite({Key? key}) : super(key: key);

  @override
  State<ScreenFavourite> createState() => _ScreenFavouriteState();
}

class _ScreenFavouriteState extends State<ScreenFavourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: roseColor,
            onPressed: (() {
              showModalBottomSheet(
                  backgroundColor: roseColor,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  builder: (context) {
                    return bottomSheetList(context);
                  });
            }),
            child: functionIcon(Icons.add, 15, Colors.white)),
        body: functionContainer(
          ListView.builder(
            controller: ScrollController(),
            itemBuilder: ((context, index) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return ScreenFavourite();
                      }),
                    ),
                  );
                },
                isThreeLine: true,
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/musicIcon3.png'),
                ),
                title: functionText(
                    'Favourite', whiteColor, FontWeight.normal, 15),
                subtitle: functionText(
                    'Shreya Ghosha,Yesudas', whiteColor, FontWeight.normal, 10),
                trailing: IconButton(
                  icon: functionIcon(Icons.more_horiz, 30, Colors.white),
                  onPressed: () {
                    showModalSheetFavourite(context);
                  },
                ),
              );
            }),
            itemCount: 20,
            shrinkWrap: true,
          ),
        ));
  }
}
