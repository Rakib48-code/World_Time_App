import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/choose_location.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/loading.dart';

void main() => runApp(MaterialApp(
  // home: Home(),
  initialRoute: "/loading",
  routes: {
    "/loading": (context) => Loading(),
    "/home": (context) => Home(),
    "/location": (context) => Location(),
  },
));
