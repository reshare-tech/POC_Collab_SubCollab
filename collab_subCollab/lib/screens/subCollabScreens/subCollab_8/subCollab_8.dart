import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class subCollab_8 extends StatefulWidget {
  @override
  _subCollab_8State createState() => _subCollab_8State();
}

class _subCollab_8State extends State<subCollab_8> {
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
      body: Subcollab_8(),
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

class Subcollab_8 extends StatefulWidget {
  const Subcollab_8({
    Key key,
  }) : super(key: key);

  @override
  _Subcollab_8State createState() => _Subcollab_8State();
}

class _Subcollab_8State extends State<Subcollab_8> {
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
                    "Dart",
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
                  padding: EdgeInsets.only(top: 20, left: 20),
                  alignment: Alignment.topLeft,
                  height: size.height - 106 - kBottomNavigationBarHeight,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: Text(
                    "Members (20)",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
