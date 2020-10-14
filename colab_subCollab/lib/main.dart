import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Firebase());
}

class Firebase extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseDynamicLink(),
    );
  }
}

class FirebaseDynamicLink extends StatefulWidget {
  _FirebaseState createState() => _FirebaseState();
}

class _FirebaseState extends State<FirebaseDynamicLink> {
  void initState() {
    super.initState();
    dynamicLink();
  }

  void dispose() {
    super.dispose();
  }

  void dynamicLink() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deeplink = dynamicLink?.link;
      if (deeplink != null) {
        Map<String, String> parameters = deeplink.queryParameters;
        print("Deeplink clicked:" + deeplink.toString());
        Navigator.pushNamed(context, parameters["route"]);
      } else {
        print("Deeplink is null");
      }
    }, onError: (OnLinkErrorException err) async {
      print("onLinkError" + err.message);
    });

    final PendingDynamicLinkData dynamicLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deeplink = dynamicLink?.link;
    if (deeplink != null) {
      Map<String, String> parameters = deeplink.queryParameters;
      print("Deeplink clicked:" + deeplink.toString());
      Navigator.pushNamed(context, parameters["route"]);
    } else {
      print("Deeplink is null");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
    );
  }
}
