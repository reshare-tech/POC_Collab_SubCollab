import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Collab_7 extends StatefulWidget {
  Collab_7({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Collab_7State createState() => _Collab_7State();
}

class _Collab_7State extends State<Collab_7> {
  bool search = false;
  @override
  Widget build(BuildContext context) {
    List data = [
      {
        "name": "Yogesh Mithoon (You)",
        "subtitle": 'Student at NIT Calicut',
        "avatar": "assets/images/Vector1.png",
        "Badge": "Incharge"
      },
      {
        "name": "Wade Warren",
        "subtitle": 'Student at NIT Calicut',
        "avatar": "assets/images/Vector2.png",
        "Badge": "Manager"
      },
      {
        "name": "Brooklyn Simmons",
        "subtitle": '8502 Preston Rd. Inglewood.',
        "avatar": "assets/images/Vector3.png",
        "Badge": ""
      },
      {
        "name": "Cameron Williamson",
        "subtitle": 'Interaction Designer',
        "avatar": "assets/images/Vector4.png",
        "Badge": "Manager"
      },
      {
        "name": "Jane Cooper",
        "subtitle": 'Interaction Designer',
        "avatar": "assets/images/Vector5.png",
        "Badge": ""
      },
      {
        "name": "Robert Fox",
        "subtitle": 'Ashley Design Studio',
        "avatar": "assets/images/Vector6.png",
        "Badge": ""
      },
      {
        "name": "Jacob ",
        "subtitle": 'Not Visible',
        "avatar": "assets/images/Vector7.png",
        "Badge": ""
      },
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      extendBody: true,
      body: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff0659ac), Color(0xff179ee6)],
                    stops: [0.26, 1])),
            padding: EdgeInsets.only(left: 20, right: 0, top: 16),
            child: search == false
                ? ListTile(
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: SvgPicture.asset(
                              "assets/images/search.svg",
                              height: 20,
                              width: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                search = true;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    title: Transform(
                      transform: Matrix4.translationValues(-30, 0, 0),
                      child: Text(
                        "Flutter Project",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.only(top: 22, bottom: 0, left: 0, right: 0),
                    leading: Container(
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              padding: EdgeInsets.only(right: 20),
                              icon:
                                  SvgPicture.asset("assets/images/Arrow.svg")),
                          Transform(
                            transform: Matrix4.translationValues(-15, 0, 0),
                            child: Container(
                              margin: EdgeInsets.only(left: 0),
                              width: 40,
                              height: 40,
                              child:
                                  Image.asset("assets/images/Rectangle 75.png"),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : ListTile(
                    contentPadding:
                        EdgeInsets.only(top: 30, bottom: 0, left: 0, right: 0),
                    leading: IconButton(
                        iconSize: 28,
                        constraints: BoxConstraints(maxWidth: 30),
                        onPressed: () {
                          setState(() {
                            search = false;
                          });
                        },
                        padding: EdgeInsets.only(right: 20),
                        icon: SvgPicture.asset("assets/images/Arrow.svg")),
                    title: Transform(
                      transform: Matrix4.translationValues(-15, 0, 0),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search...",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          Positioned(
            child: Container(
              constraints: BoxConstraints.expand(
                  height: height - 106 - kBottomNavigationBarHeight,
                  width: width),
              decoration: BoxDecoration(
                  color: Color(0xfffdfdfd),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text("Members (20)",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      trailing: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Manage Members",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Transform(
                      transform: Matrix4.translationValues(0, -10, 0),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff3e3e3e).withOpacity(0.1),
                              ),
                            ),
                            prefixIconConstraints:
                                BoxConstraints(minHeight: 20, minWidth: 20),
                            prefixIcon: SvgPicture.asset(
                              "assets/images/mysearch.svg",
                            ),
                            hintText: "    Search for a profile name",
                            hintStyle: TextStyle(
                                color: Color(0xff3E3E3E).withOpacity(0.3),
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.separated(
                    padding: EdgeInsets.all(0),
                    separatorBuilder: (context, index) => Divider(
                      thickness: 0.01,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(0),
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                          onTap: () {},
                          title: Text(data[index]["name"]),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(data[index]["avatar"]),
                            radius: 22.5,
                          ),
                          subtitle: Text(data[index]["subtitle"]),
                          trailing: data[index]["Badge"] != ''
                              ? Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    data[index]["Badge"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            data[index]["Badge"] == "Incharge"
                                                ? Color(0xff48a1ff)
                                                : Color(0xff44b887)),
                                  ),
                                  constraints: BoxConstraints.expand(
                                      width: 70.01, height: 18.98),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                          color:
                                              data[index]["Badge"] == "Incharge"
                                                  ? Color(0xff48a1ff)
                                                  : Color(0xff44b887))),
                                )
                              : null,
                        ),
                      );
                    },
                    itemCount: data.length,
                  ))
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            top: 106,
          )
        ],
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 20, spreadRadius: 3)]),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            child: BottomNavigationBar(
                currentIndex: 2,
                selectedItemColor: Color(0xff3E73C1),
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/images/Path.svg"),
                    title: Text("Demo"),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/images/Vector.svg"),
                    title: Text("Demo"),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/images/Shape.svg"),
                    title: Text(
                      "Chat",
                      style: TextStyle(
                        fontSize: 11,
                        height: 2,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/Combined Shape.svg",
                      width: 18.2,
                    ),
                    title: Text("Demo"),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/images/User (filled).svg"),
                    title: Text("Demo"),
                  ),
                ]),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
