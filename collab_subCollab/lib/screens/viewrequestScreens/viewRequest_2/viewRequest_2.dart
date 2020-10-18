import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewRequest_2 extends StatefulWidget {
  ViewRequest_2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ViewRequest_2State createState() => _ViewRequest_2State();
}

class _ViewRequest_2State extends State<ViewRequest_2> {
  bool search = false;
  @override
  void initState() {
    super.initState();
  }

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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBody: false,
        body:
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            Stack(
          children: <Widget>[
            Container(
              child: Stack(
                children: [
                  search == true
                      ? ListTile(
                          contentPadding: EdgeInsets.only(
                              top: 30, bottom: 0, left: 20, right: 0),
                          leading: IconButton(
                              iconSize: 28,
                              constraints: BoxConstraints(maxWidth: 30),
                              onPressed: () {
                                setState(() {
                                  search = false;
                                });
                              },
                              padding: EdgeInsets.only(right: 20),
                              icon:
                                  SvgPicture.asset("assets/images/Arrow.svg")),
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
                        )
                      : Text(""),
                  search == false
                      ? Positioned(
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 15.37,
                                color: Color(0xfffdfdfd),
                              ),
                              onPressed: () => Navigator.pop(context)),
                          top: 44,
                          left: 16,
                        )
                      : Text(""),
                  search == false
                      ? Positioned(
                          child: IconButton(
                              icon: SvgPicture.asset(
                                "assets/images/search.svg",
                                color: Color(0xfffdfdfd),
                              ),
                              onPressed: () {
                                setState(() {
                                  search = true;
                                });
                              }),
                          top: 44,
                          right: 40,
                        )
                      : Text(""),
                  search == false
                      ? Positioned(
                          child: IconButton(
                              icon: Icon(
                                Icons.more_vert,
                                color: Color(0xfffdfdfd),
                              ),
                              onPressed: () {}),
                          top: 44,
                          right: 0,
                        )
                      : Text(""),
                  search == false
                      ? Positioned(
                          top: 50,
                          left: (width / 2 - 40),
                          child: Container(
                              constraints:
                                  BoxConstraints.expand(height: 80, width: 80),
                              child: null,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage(
                                      "assets/images/Rectangle 75.png",
                                    )),
                              )))
                      : Text(""),
                  Positioned(
                      left: (width / 2 - 58),
                      top: 146,
                      child: Text(
                        "The Flutter Team",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xfffdfdfd)),
                      )),
                  Positioned(
                      top: 172,
                      left: (width / 2 - 75),
                      child: Text(
                        "in \"Face Detection Project\"",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xfffdfdfd)),
                      )),
                  Positioned(
                    child: Text(
                      "About:",
                      style: TextStyle(fontSize: 15, color: Color(0xfffdfdfd)),
                    ),
                    top: 201,
                    left: 31,
                  ),
                  Positioned(
                    child: Container(
                        child: Text(
                          "Nam quis nulla. Integer malesuada. In in enim a arcu imperdiet malesuada. Sed vel lectus. Donec odio urna, tempus molestie, porttitor ut, iaculis quis, sem. Phasellus rhoncus. Aenean id metus id velit ullamcorper pulvinar. Vestibulum fer",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xfffdfdfd)),
                        ),
                        constraints:
                            BoxConstraints.expand(height: 126, width: 315)),
                    top: 221,
                    left: 31,
                  ),
                  Positioned(
                    child: Container(
                      constraints:
                          BoxConstraints.expand(height: 34, width: 111),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          "More Info",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xfffdfdfd)),
                        ),
                        onPressed: () {},
                        color: Color(0xff48A1FF),
                      ),
                    ),
                    top: 354,
                    left: width / 2 - 56,
                  ),
                ],
              ),
              constraints: BoxConstraints.expand(height: height, width: width),
              decoration: BoxDecoration(color: Color(0xff075AAD)),
              padding: EdgeInsets.all(0),
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.4,
                maxChildSize: 0.85,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("Members (20)",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          child: Transform(
                            transform: Matrix4.translationValues(0, -10, 0),
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff3e3e3e).withOpacity(0.1),
                                    ),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                      minHeight: 20, minWidth: 20),
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
                          controller: scrollController,
                          separatorBuilder: (context, index) => Divider(
                            thickness: 0.01,
                          ),
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.all(0),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                onTap: () {},
                                title: Text(data[index]["name"]),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(data[index]["avatar"]),
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
                                              color: data[index]["Badge"] ==
                                                      "Incharge"
                                                  ? Color(0xff48a1ff)
                                                  : Color(0xff44b887)),
                                        ),
                                        constraints: BoxConstraints.expand(
                                            width: 70.01, height: 18.98),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            border: Border.all(
                                                color: data[index]["Badge"] ==
                                                        "Incharge"
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
                    constraints: BoxConstraints.expand(
                        height: (height * 9 / 10), width: width),
                    decoration: BoxDecoration(
                        color: Color(0xfffdfdfd),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  );
                }),
            Positioned(
              top: 613 * height / 750,
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset(
                        "assets/images/Rectangle 75.png",
                        height: 45,
                        width: 45,
                      ),
                      top: 14,
                      left: 63 * width / 360,
                    ),
                    Positioned(
                      child: Text(
                        "Request to create Sub-Collab",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000)),
                      ),
                      top: 14,
                      left: 127 * width / 360,
                    ),
                    Positioned(
                      child: Container(
                        constraints:
                            BoxConstraints.expand(height: 25, width: 82),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Text(
                            "Approve",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xfffdfdfd)),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/subCollab_1");
                            Fluttertoast.showToast(
                                backgroundColor: Color(0xff48A1FF),
                                msg: "You've been added",
                                fontSize: 12,
                                textColor: Colors.white,
                                timeInSecForIosWeb: 1,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM);
                          },
                          color: Color(0xff48A1FF),
                        ),
                      ),
                      top: 36.5,
                      left: 127 * width / 360,
                    ),
                    Positioned(
                      child: Container(
                        constraints:
                            BoxConstraints.expand(height: 25, width: 82),
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          borderSide: BorderSide(color: Color(0xff48A1FF)),
                          child: Text(
                            "Decline",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff48A1FF)),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/subCollab_1");
                            Fluttertoast.showToast(
                                backgroundColor: Colors.white,
                                msg: "You've declined",
                                fontSize: 12,
                                textColor: Color(0xff48A1FF),
                                timeInSecForIosWeb: 1,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM);
                          },
                        ),
                      ),
                      top: 36.5,
                      left: 217 * width / 360,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow()],
                    color: Color(0xfffdfdfd),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                constraints: BoxConstraints.expand(
                    height: height * 100 / 750, width: width),
              ),
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
            )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
