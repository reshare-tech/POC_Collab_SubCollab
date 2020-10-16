import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class subCollab_1 extends StatefulWidget {
  @override
  _subCollab_1State createState() => _subCollab_1State();
}

class _subCollab_1State extends State<subCollab_1> {
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
      body: Subcollab_1(),
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

class Subcollab_1 extends StatefulWidget {
  const Subcollab_1({
    Key key,
  }) : super(key: key);

  @override
  _Subcollab_1State createState() => _Subcollab_1State();
}

class _Subcollab_1State extends State<Subcollab_1> {
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
                    "Face Detection Projects",
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
                  "in “The Robot Projects”",
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
                alignment: Alignment.topCenter,
                height: size.height - 106 - kBottomNavigationBarHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  children: <Widget>[
                    DefaultTabController(
                      initialIndex: 0,
                      length: 3,
                      child: Column(
                        children: <Widget>[
                          TabBar(
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
                          Container(
                            height: size.height -
                                107 -
                                kBottomNavigationBarHeight -
                                kTextTabBarHeight,
                            child: TabBarView(children: [
                              Sub_Collabs(),
                              Center(
                                child: Text("Messages"),
                              ),
                              Center(
                                child: Text("Plugins"),
                              ),
                            ]),
                          )
                        ],
                      ),
                    ),
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

class Sub_Collabs extends StatefulWidget {
  @override
  _Sub_CollabsState createState() => _Sub_CollabsState();
}

class _Sub_CollabsState extends State<Sub_Collabs>
    with SingleTickerProviderStateMixin {
  List data = [
    {
      "title": "Python Team",
      "subtitle": 'In "Face Detection Projects"',
      "icon": "assets/images/Vector (4).png",
      "badge": "",
    },
    {
      "title": "C++ Team",
      "subtitle": 'In "Face Detection Projects"',
      "icon": "assets/images/Vector (5).png",
      "badge": "",
    },
    {
      "title": "Machine Learning Team",
      "subtitle": 'In "Face Detection Projects"',
      "icon": "assets/images/Vector (6).png",
      "badge": "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("Upper Collabs",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              trailing: MaterialButton(
                onPressed: () {},
                child: Text("Show"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("Subcollabs in this Collab",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              subtitle: Text("Showing in “Face Detection Project” only",
                  style: TextStyle(
                      color: Color(0xff3E3E3E).withOpacity(0.3),
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              trailing: MaterialButton(
                onPressed: () {},
                child: Text("Show deep"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                    hintText: "    Search for a subcollab name",
                    hintStyle: TextStyle(
                        color: Color(0xff3E3E3E).withOpacity(0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ),
          Expanded(
              child: Stack(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(0),
                  separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                  ),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(5)),
                          child: FittedBox(
                              child: Image.asset(data[index]["icon"]))),
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      title: Text(
                        data[index]["title"],
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        data[index]["subtitle"],
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(bottom: 30, right: 20),
                  alignment: Alignment.center,
                  child: SpeedDial(
                    elevation: 10,
                    children: [
                      SpeedDialChild(
                        elevation: 5,
                        onTap: () {
                          Navigator.pushNamed(context, '/viewRequest_1');
                        },
                        label: "View Requests",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        labelBackgroundColor: Color(0xff3e73c1),
                        backgroundColor: Color(0xff3e73c1),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color(0xff48a1ff),
                                style: BorderStyle.solid,
                                width: 3),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(Icons.remove_red_eye),
                      ),
                      SpeedDialChild(
                        elevation: 5,
                        onTap: () {},
                        label: "Create Sub-Collab",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        labelBackgroundColor: Color(0xff3e73c1),
                        backgroundColor: Color(0xff3e73c1),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color(0xff48a1ff),
                                style: BorderStyle.solid,
                                width: 3),
                            borderRadius: BorderRadius.circular(100)),
                        child: SvgPicture.asset(
                          "assets/images/Vector1234.svg",
                          fit: BoxFit.none,
                        ),
                      ),
                    ],
                    backgroundColor: Color(0xff3e73c1),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color(0xff48a1ff),
                            style: BorderStyle.solid,
                            width: 3),
                        borderRadius: BorderRadius.circular(100)),
                    animatedIcon: AnimatedIcons.menu_close,
                    animatedIconTheme: IconThemeData(size: 30),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
