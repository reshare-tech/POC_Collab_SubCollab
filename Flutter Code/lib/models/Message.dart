class Message {
  final String content;
  final String senderID;
  final String recipientID;
  final String time;
  final bool isGroup; // usage conditional upon requirement

  Message(
      {this.content, this.senderID, this.recipientID, this.time, this.isGroup});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        recipientID: json["receiverChatID"] as String,
        senderID: json["senderChatID"] as String,
        content: json["content"] as String,
        time: json["time"] as String,
        isGroup: json["isGroup"] as bool,
      );
}
