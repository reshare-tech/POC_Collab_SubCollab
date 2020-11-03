import 'dart:async';
import 'dart:convert';
import 'package:chat_poc/services/ChatHistory.dart';
import 'package:flutter/material.dart';
import 'package:chat_poc/utilities/Global.dart';
import 'package:chat_poc/models/Message.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

import '../utilities/Global.dart';

class ChatPage extends StatefulWidget {
  final bool isGroup;

  ChatPage({this.isGroup});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  String content;
  String roomID;
  List<Message> localMessages;

  _ChatPageState();

  Future<void> setupChats() async {
    try {
      ChatHistory instance = ChatHistory(
        senderID: Global.loggedInUser.userID,
        recipientID: this.roomID,
      );

      await instance.getChats();

      if (mounted)
        setState(() {
          localMessages = instance.messages;
        });
    } catch (err) {
      print('Error: $err');
      setState(() {
        localMessages = [];
      });
    }
  }

  void onTextChange() {
    setState(() {
      content = textController.text;
    });
  }

  chatListScrollToBottom() {
    Timer(Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 100),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  _sendButtonTap() async {
    if (textController.text.isEmpty) {
      return;
    }
    print('In send button tap');
    print(widget.isGroup);
    Message message = Message(
      recipientID: widget.isGroup == false
          ? Global.toChatUser.userID
          : Global.toGroup.groupID,
      senderID: Global.loggedInUser.userID,
      content: textController.text,
      time: DateFormat.jm().format(DateTime.now()),
      isGroup: widget.isGroup,
    );

    addMessage(message);
    Global.socketUtils.sendMessage(message);
  }

  onChatMessageReceived(data) {
    print('onChatMessageReceived $data');
    if (null == data || data.toString().isEmpty) {
      return;
    }
    processMessage(data);
  }

  processMessage(data) {
    Message message = Message.fromJson(json.decode(data));
    print('In process message $message');
    addMessage(message);
  }

  addMessage(Message message) async {
    print('Adding Message to UI ${message.content}');
    if (localMessages.contains(message) == false)
      setState(() {
        localMessages.add(message);
      });
    print('Total Messages: ${localMessages.length}');
    chatListScrollToBottom();
  }

  initSocketListeners() {
    Future.delayed(Duration(seconds: 2), () async {
      Global.socketUtils
          .setOnChatMessageReceivedListener(onChatMessageReceived);
    });
  }

  connectSocket() async {
    Global.initSocket();
    await Global.socketUtils.initSocket(Global.loggedInUser);
    Global.socketUtils.connectToSocket();
  }

  @override
  void initState() {
    roomID = (widget.isGroup == false)
        ? Global.toChatUser.userID
        : Global.toGroup.groupID;
    // localMessages = List();
    connectSocket();
    initSocketListeners();
    textController.addListener(onTextChange);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setupChats();
    });
    print('RECEIVER ROOM ID: $roomID');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      chatListScrollToBottom();
      // scrollController.jumpTo(scrollController.position.maxScrollExtent);
      // scrollController.animateTo(
      //   scrollController.position.maxScrollExtent,
      //   duration: const Duration(milliseconds: 300),
      //   curve: Curves.easeOut,
      // );
    });

    return SafeArea(
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: getMessagesInChat(),
          ),
          buildChatArea(),
        ],
      ),
    );
  }

  Widget generateMessage(Message message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: Icon(
            Icons.account_circle,
            size: 40,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: message.senderID == Global.loggedInUser.userID
                ? const Color(0x0f1f6b9c)
                : const Color(0xee0a6da8),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    message.senderID == Global.loggedInUser.userID
                        ? Text(
                            'You',
                            style: TextStyle(color: const Color(0xee0a6da8)),
                          )
                        : Text(
                            message.senderID,
                            style: TextStyle(color: Colors.amber[800]),
                          ),
                    Text(message.time),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text(message.content)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getMessagesInChat() {
    if (localMessages == null)
      return Center(
          child: Text(
        'Loading...',
        style: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 13,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w600,
        ),
      ));

    print('LENGTH in getMessages ${localMessages.length}');
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: ListView.builder(
        cacheExtent: 100,
        controller: scrollController,
        reverse: false,
        shrinkWrap: true,
        itemCount: null == localMessages ? 0 : localMessages.length,
        itemBuilder: (BuildContext context, int index) =>
            generateMessage(localMessages[index]),
      ),
    );
  }

  Widget buildChatArea() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.attach_file),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: textController,
              ),
            ),
          ),
          Icon(Icons.mic_none),
          IconButton(
            // iconSize: 0,
            icon: Icon(Icons.send),
            onPressed: () async {
              _sendButtonTap();
              setState(() {
                textController.text = '';
              });
            },
          ),
        ],
      ),
    );
  }
}
