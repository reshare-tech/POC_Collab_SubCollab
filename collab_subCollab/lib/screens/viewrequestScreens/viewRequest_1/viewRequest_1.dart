import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class view_Request_1 extends StatefulWidget {
  @override
  _view_Request_1State createState() => _view_Request_1State();
}

class _view_Request_1State extends State<view_Request_1> {
  List<BottomNavigationBarItem> navitems = [
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Viewreq_1(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0xffaeaec0), blurRadius: 20, offset: Offset(0, -1))
          ],
        ),
        child: ClipRRect(
          child: BottomNavigationBar(
            currentIndex: 2,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            items: navitems,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
      ),
    );
  }
}

class Viewreq_1 extends StatefulWidget {
  const Viewreq_1({
    Key key,
  }) : super(key: key);

  @override
  _Viewreq_1State createState() => _Viewreq_1State();
}

class _Viewreq_1State extends State<Viewreq_1> {
  List data = [
    {"name": "Sai Vivek"},
    {"name": "Dev Kumar"},
    {"name": "Ashley Conan"},
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            height: 300,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff0659ac), Color(0xff179ee6)],
                    stops: [0.26, 1])),
            padding: EdgeInsets.only(left: 20, right: 0, top: 16),
            child: ListTile(
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
                      onPressed: () {},
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
                transform: Matrix4.translationValues(-15, 0, 0),
                child: Container(
                  child: Text(
                    "View Requests",
                    softWrap: false,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              subtitle: Transform(
                transform: Matrix4.translationValues(-15, 0, 0),
                child: Text(
                  "in “Face Detection project”",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
              contentPadding:
                  EdgeInsets.only(top: 22, bottom: 0, left: 0, right: 0),
              leading: Container(
                margin: EdgeInsets.all(0),
                constraints: BoxConstraints(maxWidth: 70),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        iconSize: 28,
                        constraints: BoxConstraints(maxWidth: 30),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.only(right: 20),
                        icon: SvgPicture.asset("assets/images/Arrow.svg")),
                    Transform(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Container(
                        margin: EdgeInsets.only(left: 0),
                        width: 40,
                        height: 40,
                        child: Image.asset("assets/images/Rectangle 75.png"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 106,
            height: size.height - kBottomNavigationBarHeight - 106,
            width: size.width,
            child: ClipRRect(
              child: Container(
                width: size.width,
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                height: size.height - 106 - kBottomNavigationBarHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, i) {
                          return Tile(data[i]["name"]);
                        },
                        separatorBuilder: (context, i) {
                          return Divider(
                            thickness: 1,
                          );
                        },
                        itemCount: data.length)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Tile extends StatefulWidget {
  String name;
  Tile(this.name);
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    String name1 = widget.name;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 30,
                  height: 30,
                  child: Image.asset("assets/images/Rectangle 112.png"),
                ),
                Container(
                  width: 10,
                  height: 10,
                  child: SvgPicture.asset("assets/images/downarrow.svg"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 30,
                  height: 30,
                  child: Image.asset("assets/images/Rectangle 75.png"),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: Text(
                    "The Flutter Team",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Request to create Subgroup",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff3e3e3e)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Request by “$name1”",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff3e3e3e)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 82,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Color(0xff48a1ff),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FlatButton(
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
                            child: Text(
                              "Approve",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )),
                      ),
                      Container(
                        width: 82,
                        height: 25,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff48a1ff), width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FlatButton(
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
                            child: Text(
                              "Decline",
                              style: TextStyle(
                                  color: Color(0xff48a1ff), fontSize: 12),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: FlatButton(
              onPressed: () => Navigator.pushNamed(context, "/viewRequest_2"),
              child: Text(
                "View Details",
                style: TextStyle(color: Color(0xff48a1ff), fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
