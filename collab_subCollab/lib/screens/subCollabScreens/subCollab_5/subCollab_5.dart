import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class subCollab_5 extends StatefulWidget {
  @override
  _subCollab_5State createState() => _subCollab_5State();
}

class _subCollab_5State extends State<subCollab_5> {
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
      body: Subcollab_5(),
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

class Subcollab_5 extends StatefulWidget {
  const Subcollab_5({
    Key key,
  }) : super(key: key);

  @override
  _Subcollab_5State createState() => _Subcollab_5State();
}

class _Subcollab_5State extends State<Subcollab_5> {
  List data = [
    {
      "image": "assets/images/Rectangle 18.png",
      "name": "Michael..",
    },
    {
      "image": "assets/images/Rectangle 17.png",
      "name": "Wade",
    },
    {
      "image": "assets/images/Rectangle 19.png",
      "name": "Casey Da.",
    },
    {
      "image": "assets/images/Rectangle 20.png",
      "name": "Lebron..",
    },
    {
      "image": "assets/images/Rectangle 21.png",
      "name": "Skylar D..",
    },
    {
      "image": "assets/images/Rectangle 22.png",
      "name": "Meredith..",
    },
  ];
  List data1 = [
    {
      "title": "Yokesh Mithoon (You)",
      "subtitle": "Student at NIT Calicut",
      "icon": "assets/images/Vector (1).png",
    },
    {
      "title": "Wade Warren",
      "subtitle": "Student at NIT Calicut",
      "icon": "assets/images/Vector (2).png",
    },
    {
      "title": "Brooklyn Simmons",
      "subtitle": "8502 Preston Rd. Inglewood.",
      "icon": "assets/images/Vector (7).png",
    },
    {
      "title": "Cameron Williamson",
      "subtitle": "Interaction Manager",
      "icon": "assets/images/Vector (3).png",
    },
    {
      "title": "Yokesh Mithoon (You)",
      "subtitle": "Student at NIT Calicut",
      "icon": "assets/images/Vector (1).png",
    },
    {
      "title": "Wade Warren",
      "subtitle": "Student at NIT Calicut",
      "icon": "assets/images/Vector (2).png",
    },
    {
      "title": "Brooklyn Simmons",
      "subtitle": "8502 Preston Rd. Inglewood.",
      "icon": "assets/images/Vector (7).png",
    },
    {
      "title": "Cameron Williamson",
      "subtitle": "Interaction Manager",
      "icon": "assets/images/Vector (3).png",
    },
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 16),
            child: ListTile(
              contentPadding:
                  EdgeInsets.only(top: 22, bottom: 0, left: 0, right: 0),
              leading: Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.only(right: 40),
                  icon: SvgPicture.asset(
                    "assets/images/Arrow.svg",
                  ),
                ),
              ),
              title: Transform(
                transform: Matrix4.translationValues(-50, 0, 0),
                child: Text(
                  "Create Sub-Collab",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              subtitle: Transform(
                transform: Matrix4.translationValues(-50, 0, 0),
                child: Text(
                  'in “Face Detection Project”',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Proxima Nova",
                      color: Colors.white),
                ),
              ),
              trailing: Container(
                height: 30,
                width: 90,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, "/subCollab_6"),
                  color: Color(0xff44B887),
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 12),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Added Participants (0) and Sub-Collabs (0)* ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        "You can only add the ones in “The Robot Project” ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      padding: EdgeInsets.only(left: 20),
                      child: Container(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: 50,
                                    width: 50,
                                    child: Stack(children: [
                                      Image.asset(data[index]["image"]),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            padding: EdgeInsets.all(0),
                                            color: Color(0xff565656),
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.close,
                                              size: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Text(
                                    data[index]["name"],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color(0xff000000).withOpacity(0.7)),
                                  )
                                ],
                              ),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xffc4c4c4).withOpacity(0.5),
                      thickness: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: Text(
                        "Add Via Search",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff3e3e3e).withOpacity(0.1),
                              ),
                            ),
                            prefixIconConstraints:
                                BoxConstraints(minHeight: 15, minWidth: 15),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        "You can Invite participants of another sub-collab that you are a  part of, into this collab.",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000).withOpacity(0.38),
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xffc4c4c4).withOpacity(0.5),
                      thickness: 4,
                      height: 1,
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.only(left: 20),
                      title: Text(
                        "Select Members",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      subtitle: Text(
                        "in “The Robot Project”",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff3e3e3e)),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.all(0),
                        separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                        ),
                        shrinkWrap: true,
                        itemCount: data1.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                                minRadius: 22.5,
                                maxRadius: 22.5,
                                child: Image.asset(data1[index]["icon"])),
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            title: Text(
                              data1[index]["title"],
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              data1[index]["subtitle"],
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          );
                        },
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
