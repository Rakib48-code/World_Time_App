import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/choose_location.dart';
import 'package:flutter_application_1/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: "Berlin",
      flag: "germany.png",
      url: "Europe/Berlin",
    );

    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}
