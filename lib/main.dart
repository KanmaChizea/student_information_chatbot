import 'package:flutter/material.dart';
import 'package:student_information_chatbot/core/theme.dart';
import 'package:student_information_chatbot/screens/chat.dart';

import 'screens/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Joe Chatbot',
      routes: {
        '/': (context) => const LandingPage(),
        '/chat': (context) => const ChatPage()
      },
      initialRoute: '/',
    );
  }
}
