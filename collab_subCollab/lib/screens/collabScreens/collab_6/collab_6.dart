import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class collab_6 extends StatefulWidget {
  @override
  _collab_6State createState() => _collab_6State();
}

class _collab_6State extends State<collab_6> {
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
      body: CC6(),
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

class CC6 extends StatefulWidget {
  const CC6({
    Key key,
  }) : super(key: key);

  @override
  _CC6State createState() => _CC6State();
}

class _CC6State extends State<CC6> {
  bool search = false;

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
            top: 106,
            height: size.height - kBottomNavigationBarHeight - 106,
            width: size.width,
            child: ClipRRect(
              child: Container(
                alignment: Alignment.topCenter,
                height: size.height - 106 - kBottomNavigationBarHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  children: <Widget>[
                    DefaultTabController(
                      length: 3,
                      child: TabBar(
                        labelColor: Color(0xff3e73c1),
                        indicatorColor: Color(0xff3e73c1),
                        indicatorWeight: 3,
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: "Sub-Collabs",
                          ),
                          Tab(
                            text: "Messages",
                          ),
                          Tab(
                            text: "Plugins",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 40),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 47,
                                  height: 47,
                                  decoration: BoxDecoration(
                                      color: Color(0xff3e73c1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: IconButton(
                                      icon: SvgPicture.asset(
                                        "assets/images/Vector123.svg",
                                        width: 18,
                                        height: 24,
                                      ),
                                      onPressed: () => Navigator.pushNamed(
                                          context, "/subCollab_2_3")),
                                ),
                                Text(
                                  "Create",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text("Sub-Collab",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 40),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 47,
                                  height: 47,
                                  decoration: BoxDecoration(
                                      color: Color(0xff3e73c1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/images/Group 127.svg",
                                      width: 18,
                                      height: 24,
                                    ),
                                    onPressed: () => Navigator.pushNamed(
                                        context, "/viewRequest_1"),
                                  ),
                                ),
                                Text("View",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                                Text("Requests",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 40),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 47,
                                  height: 47,
                                  decoration: BoxDecoration(
                                      color: Color(0xff3e73c1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/images/Group 127.svg",
                                      width: 18,
                                      height: 24,
                                    ),
                                    onPressed: () => Navigator.pushNamed(
                                        context, "/collab_7"),
                                  ),
                                ),
                                Text("View",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                                Text("Members",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Subcollabs in this Collabs",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        subtitle: Text(
                            "Showing in “Face Detection Project” only",
                            style: TextStyle(
                                color: Color(0xff3E3E3E).withOpacity(0.3),
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Transform(
                        transform: Matrix4.translationValues(0, -15, 0),
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff3e3e3e).withOpacity(0.1),
                                ),
                              ),
                              prefixIconConstraints: BoxConstraints(
                                  maxHeight: 16.78, maxWidth: 16.68),
                              prefixIcon: SvgPicture.asset(
                                "assets/images/mysearch.svg",
                              ),
                              hintText: "    Search for a Profile Name",
                              hintStyle: TextStyle(
                                  color: Color(0xff3E3E3E).withOpacity(0.3),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "There are no Subcollabs in this Collabs",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff3e3e3e).withOpacity(0.3)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
