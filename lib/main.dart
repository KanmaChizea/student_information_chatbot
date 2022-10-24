import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme.dart';
import 'screens/chat.dart';

import 'data/dialogflow_service.dart';
import 'data/message_cubit.dart';
import 'screens/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageCubit(dialogFlowService: DialogFlowService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        title: 'Joe Chatbot',
        routes: {
          '/': (context) => const LandingPage(),
          '/chat': (context) => const ChatPage()
        },
        initialRoute: '/',
      ),
    );
  }
}
