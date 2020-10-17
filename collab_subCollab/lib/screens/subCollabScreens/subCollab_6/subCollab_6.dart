import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubCollab_6 extends StatefulWidget {
  SubCollab_6({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SubCollab_6State createState() => _SubCollab_6State();
}

class _SubCollab_6State extends State<SubCollab_6> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body:
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            Stack(
          children: <Widget>[
            Container(
              child: Stack(
                children: [
                  Positioned(
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 15.37,
                          color: Color(0xfffdfdfd),
                        ),
                        onPressed: () => Navigator.pop(context)),
                    top: 44,
                    left: 16,
                  ),
                  Positioned(
                    child: IconButton(
                        icon: SvgPicture.asset(
                          "assets/images/search.svg",
                          color: Color(0xfffdfdfd),
                        ),
                        onPressed: () {}),
                    top: 44,
                    right: 40,
                  ),
                  Positioned(
                    child: IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Color(0xfffdfdfd),
                        ),
                        onPressed: () {}),
                    top: 44,
                    right: 0,
                  ),
                  Positioned(
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
                                  "assets/images/head.jpg",
                                )),
                          ))),
                  Positioned(
                      left: (width / 2 - 15),
                      top: 146,
                      child: Text(
                        "Dart",
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
                          "LAYER is a strategic design agency working across industrial design, digital, UI/UX, brand, packaging and installation design. ",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xfffdfdfd)),
                        ),
                        constraints:
                            BoxConstraints.expand(height: 60, width: 315)),
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
                    top: 295,
                    left: 43,
                  ),
                  Positioned(
                    child: Container(
                      constraints:
                          BoxConstraints.expand(height: 34, width: 146),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          "View Members",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xfffdfdfd)),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, "/subCollab_7"),
                        color: Color(0xff48A1FF),
                      ),
                    ),
                    top: 295,
                    left: 170,
                  )
                ],
              ),
              constraints: BoxConstraints.expand(height: height, width: width),
              decoration: BoxDecoration(color: Color(0xff075AAD)),
              padding: EdgeInsets.all(0),
            ),
            Positioned(
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
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
                            height: height / 2 -
                                kBottomNavigationBarHeight -
                                kTextTabBarHeight,
                            width: width,
                            child: TabBarView(children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        title: Text("Upper Collabs",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)),
                                        trailing: MaterialButton(
                                          onPressed: () {},
                                          child: Text("Show"),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        title: Text("Subcollabs in this Collab",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)),
                                        subtitle: Text(
                                            "Showing in “Face Detection Project” only",
                                            style: TextStyle(
                                                color: Color(0xff3E3E3E)
                                                    .withOpacity(0.3),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                        trailing: MaterialButton(
                                          onPressed: () {},
                                          child: Text("Show deep"),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 0),
                                      child: Transform(
                                        transform: Matrix4.translationValues(
                                            0, -10, 0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xff3e3e3e)
                                                      .withOpacity(0.1),
                                                ),
                                              ),
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                      minHeight: 20,
                                                      minWidth: 20),
                                              prefixIcon: SvgPicture.asset(
                                                "assets/images/mysearch.svg",
                                              ),
                                              hintText:
                                                  "    Search for a subcollab name",
                                              hintStyle: TextStyle(
                                                  color: Color(0xff3E3E3E)
                                                      .withOpacity(0.3),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      child: Text(
                                          "There are no sub-collabs created",
                                          style: TextStyle(
                                              color: Color(0xff3E3E3E)
                                                  .withOpacity(0.3),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                      padding: EdgeInsets.all(20),
                                    )
                                  ],
                                ),
                              ),
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
                constraints:
                    BoxConstraints.expand(height: (height / 2), width: width),
                decoration: BoxDecoration(
                    color: Color(0xfffdfdfd),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
              top: (height / 2),
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
            )));
  }
}
