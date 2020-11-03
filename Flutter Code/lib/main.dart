import 'package:chat_poc/Pages/MainPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(
        category: "hostels",
      ),
    ),
  );
}

// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (context) => ChatModel(),
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainPage(
//         category: "hostels",
//       ),
//     ),
//   ));
// }

// void main() {
//   runApp(ScopedModel<ChatModel>(
//     model: ChatModel(),
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainPage(
//         category: "hostels",
//       ),
//     ),
//   ));
// }
