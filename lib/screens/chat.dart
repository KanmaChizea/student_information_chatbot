import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_information_chatbot/data/scroll_controller_cubit.dart';
import '../core/colors.dart';

import '../data/message_cubit.dart';

import '../core/responsive.dart';
import '../widgets/chat_body.dart';
import '../widgets/input_field.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScrollControllerCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFECE5DD),
        appBar: AppBar(
            title: Column(
              children: [
                const Text('JOE'),
                if (context.watch<MessageCubit>().isTyping)
                  Text('...typing', style: Theme.of(context).textTheme.caption)
              ],
            ),
            backgroundColor: primary),
        body: Padding(
          padding: isMobile(context)
              ? const EdgeInsets.symmetric(vertical: 24, horizontal: 16)
              : const EdgeInsets.symmetric(vertical: 24, horizontal: 80),
          child: Column(
            children: const [
              ChatBody(),
              SizedBox(height: 16),
              ChatInputField(),
            ],
          ),
        ),
      ),
    );
  }
}
