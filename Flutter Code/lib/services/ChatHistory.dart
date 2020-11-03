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
  ChatHistory({this.senderID, this.recipientID});

  Future<void> getChats() async {
    String url = 'calm-savannah-01592.herokuapp.com';
    String path = '/individualChats';
    Map<String, String> params = {
      'senderChatID': senderID,
      'receiverChatID': recipientID,
    };
    var uri = Uri.https(url, path, params);

    var response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    chats = jsonDecode(response.body);
    for (var c in chats) {
      var m = Message.fromJson(c);
      messages.add(m);
    }

    print('In ChatHistory: Length of Messages = ${messages.length}');
    // print(chats);
  }
}
