import 'package:flutter/material.dart';

import 'screens/subCollabScreens/subCollab_1/subCollab_1.dart';
import 'screens/subCollabScreens/subCollab_4/subCollab_4.dart';
import 'screens/subCollabScreens/subCollab_5/subCollab_5.dart';
import 'screens/subCollabScreens/subCollab_8/subCollab_8.dart';
import 'screens/collabScreens/collab_5/collab_5.dart';
import 'screens/collabScreens/collab_6/collab_6.dart';
import 'screens/viewrequestScreens/viewRequest_1/viewRequest_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => subCollab_1(),
        "/collab_5": (BuildContext context) => collab_5(),
        "/collab_6": (BuildContext context) => collab_6(),
        "/subCollab_4": (BuildContext context) => subCollab_4(),
        "/subCollab_5": (BuildContext context) => subCollab_5(),
        "/subCollab_8": (BuildContext context) => subCollab_8(),
        "/viewRequest_1": (BuildContext context) => view_Request_1(),
      },
    );
  }
}
