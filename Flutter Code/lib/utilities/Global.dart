import 'package:chat_poc/models/Examples.dart';
import 'package:chat_poc/models/Group.dart';
import 'package:chat_poc/models/User.dart';
import 'SocketUtils.dart';

class Global {
  // Socket
  static SocketUtils socketUtils;
  static List<User> dummyUsers;
  static List<Group> dummyGroups;

  // Logged In User
  static User loggedInUser;

  // Single Chat - To Chat User
  static User toChatUser;

  //Group Chat - To Group
  static Group toGroup;

  static initSocket() {
    if (null == socketUtils) {
      socketUtils = SocketUtils();
    }
  }

  static void initDummyUsers() {
    dummyUsers = List<User>();
    dummyUsers = Examples.users;
  }

  static void initDummyGroups() {
    dummyGroups = List<Group>();
    dummyGroups = [Examples.group];
  }

  static List<User> getUsersFor(User user) {
    List<User> filteredUsers = dummyUsers
        .where((u) => (!u.name.toLowerCase().contains(user.name.toLowerCase())))
        .toList();
    return filteredUsers;
  }
}
