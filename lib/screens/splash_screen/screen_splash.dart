// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:musicplayer/functions/design_funcions.dart';

import '../home_screen/screen_home.dart';

class ScreenSplash extends StatefulWidget {
  ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              functionText(
                'PLAY',
                whiteColor,
                FontWeight.bold,
                48,
              ),
              functionText(
                'Music Player',
                whiteColor,
                FontWeight.bold,
                24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> gotoHome(BuildContext context1) async {
  await Future.delayed(
    const Duration(seconds: 3),
  );
  // ignore: use_build_context_synchronously
  Navigator.of(context1).pushReplacement(
    MaterialPageRoute(builder: (ctx) {
      return const ScreenHome();
    }),
  );
}
