import 'package:flutter/material.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'screens/subCollabScreens/subCollab_1/subCollab_1.dart';
import 'screens/subCollabScreens/subCollab_2_3/subCollab_2_3.dart';
import 'screens/subCollabScreens/subCollab_4/subCollab_4.dart';
import 'screens/subCollabScreens/subCollab_5/subCollab_5.dart';
import 'screens/subCollabScreens/subCollab_6/subCollab_6.dart';
import 'screens/subCollabScreens/subCollab_7/subCollab_7.dart';
import 'screens/subCollabScreens/subCollab_8/subCollab_8.dart';
import 'screens/collabScreens/collab_2_3/collab_2_3.dart';
import 'screens/collabScreens/collab_5/collab_5.dart';
import 'screens/collabScreens/collab_6/collab_6.dart';
import 'screens/collabScreens/collab_7/collab_7.dart';
import 'screens/viewrequestScreens/viewRequest_1/viewRequest_1.dart';
import 'screens/viewrequestScreens/viewRequest_2/viewRequest_2.dart';

void main() {
  runApp(MaterialApp(
    home: MyAppStateful(),
    debugShowCheckedModeBanner: false,
    initialRoute: "/collab_2_3",
    routes: <String, WidgetBuilder>{
      "/collab_2_3": (BuildContext context) => collab_2_3(),
      "/collab_5": (BuildContext context) => collab_5(),
      "/collab_6": (BuildContext context) => collab_6(),
      "/collab_7": (BuildContext context) => Collab_7(),
      "/subCollab_1": (BuildContext context) => subCollab_1(),
      "/subCollab_2_3": (BuildContext context) => SubCollab_2_3(),
      "/subCollab_4": (BuildContext context) => subCollab_4(),
      "/subCollab_5": (BuildContext context) => subCollab_5(),
      "/subCollab_6": (BuildContext context) => SubCollab_6(),
      "/subCollab_7": (BuildContext context) => SubCollab_7(),
      "/subCollab_8": (BuildContext context) => subCollab_8(),
      "/viewRequest_1": (BuildContext context) => view_Request_1(),
      "/viewRequest_2": (BuildContext context) => ViewRequest_2(),
    },
  ));
}

class MyAppStateful extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppStateful> {
  String deeplinkStatus = "null";
  void initState() {
    super.initState();
    dynamicLink();
  }

  void dispose() {
    super.dispose();
  }

  Future dynamicLink() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deeplink = dynamicLink?.link;
      if (deeplink != null) {
        setState(() {
          deeplinkStatus = "received";
        });
        Map<String, String> parameters = deeplink.queryParameters;
        print("Deeplink clicked:" + deeplink.toString());
        print("route : " + parameters["route"]);
        Navigator.popAndPushNamed(context, parameters["route"]);
      } else {
        setState(() {
          deeplinkStatus = "notReceived";
        });
        print("Deeplink is null");
      }
    }, onError: (OnLinkErrorException err) async {
      print("onLinkError" + err.message);
    });

    final PendingDynamicLinkData dynamicLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deeplink = dynamicLink?.link;
    if (deeplink != null) {
      setState(() {
        deeplinkStatus = "received";
      });
      Map<String, String> parameters = deeplink.queryParameters;
      print("Deeplink clicked:" + deeplink.toString());
      print("route : " + parameters["route"].toString());
      Navigator.popAndPushNamed(context, parameters["route"]);
    } else {
      print("Deeplink is null");
      setState(() {
        deeplinkStatus = "notReceived";
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildChild(deeplinkStatus),
      ),
    );
  }
}

Widget buildChild(String deeplinkStatus) {
  if (deeplinkStatus.compareTo("received") == 0)
    return CircularProgressIndicator();
  else if (deeplinkStatus.compareTo("notReceived") == 0)
    return subCollab_1();
  else
    return CircularProgressIndicator();
}
