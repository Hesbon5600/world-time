import 'package:flutter/material.dart';
import 'package:world_timme/pages/choosse_location.dart';
import 'package:world_timme/pages/home.dart';
import 'package:world_timme/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
    ));
