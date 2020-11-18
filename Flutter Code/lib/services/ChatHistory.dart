import 'dart:io';
import 'package:chat_poc/models/Message.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Message.dart';

class ChatHistory {
  List<Message> messages = [];
  var chats;
  String senderID;
  String recipientID;
  String groupID;
  ChatHistory({this.senderID, this.recipientID, this.groupID});

  Future<void> getIndividualChats() async {
    // print("HEYYYYY");
    String url = 'tranquil-dusk-46955.herokuapp.com';
    String path = '/individualChats';
    Map<String, String> params = {
      'senderChatID': senderID,
      'receiverChatID': recipientID,
    };
    var uri = Uri.https(url, path, params);

    var response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    // print(response.body);
    chats = jsonDecode(response.body);
    for (var c in chats) {
      var m = Message.fromJson(c);
      messages.add(m);
    }

    print('In ChatHistory: Length of Messages = ${messages.length}');
    // print(chats);
  }

  Future<void> getGroupChats() async {
    // print("HELLLLOOOOO");
    String url = 'tranquil-dusk-46955.herokuapp.com';
    String path = '/groupChats';
    Map<String, String> params = {
      'groupID': groupID,
    };
    var uri = Uri.https(url, path, params);

    var response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    // print(response.body);
    chats = jsonDecode(response.body);
    for (var c in chats) {
      var m = Message.fromJson(c);
      messages.add(m);
    }

    print('In ChatHistory: Length of Messages = ${messages.length}');
    // print(chats);
  }
}
