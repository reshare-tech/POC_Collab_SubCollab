import 'package:chat_poc/utilities/Global.dart';
import 'package:flutter/material.dart';
import 'package:chat_poc/components/CustomTabBar.dart';
import 'package:chat_poc/components/CustomBottomBar.dart';
import 'package:chat_poc/components/CustomAppBar.dart';
import 'package:chat_poc/models/Examples.dart';
import 'package:chat_poc/pages/ChatPage.dart';
import 'package:chat_poc/pages/ChatList.dart';

class MainPage extends StatefulWidget {
  final String category;

  MainPage({this.category});

  @override
  _MainPageState createState() => _MainPageState(category: category);
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController _tabController;
  String category;

  _MainPageState({this.category});

  setLoggedInUser() async {
    Global.loggedInUser = Global.dummyUsers[5];
    Global.toChatUser = Global.dummyUsers[0];
    Global.toGroup = Global.dummyGroups[0];
  }

  @override
  void initState() {
    print('Category $category');
    _tabController = TabController(length: Examples.myTabs.length, vsync: this);
    _tabController.addListener(() {
      print('Tab Controller index ${_tabController.index}');
    });
    super.initState();
    Global.initDummyUsers();
    Global.initDummyGroups();
    setLoggedInUser();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.085,
        child: CustomBottomBar(),
      ),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.15),
        child: SafeArea(
          child: Container(
            color: const Color(0xff0f4d83),
            child: Column(
              children: [
                CustomAppBar(
                  title: Examples.directory[category]["title"],
                  subtitle: Examples.directory[category]["subtitle"],
                ),
                CustomTabBar(
                  tabs: Examples.myTabs,
                  controller: _tabController,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.765,
        child: TabBarView(
          children: [
            ChatList(category: category),
            //change to true to test group chats, false to test individual chats
            ChatPage(isGroup: true),
            Center(child: Text('This is the Plugins tab')),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
