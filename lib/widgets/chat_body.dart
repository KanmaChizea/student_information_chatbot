import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_information_chatbot/models/chat.dart';

import '../data/message_cubit.dart';
import 'message_bubble.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Flexible(child: BlocBuilder<MessageCubit, List<ChatMessage>>(
      builder: (context, state) {
        return ListView.separated(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: controller,
          padding: const EdgeInsets.all(8.0),
          separatorBuilder: (context, index) => const SizedBox(height: 32),
          itemBuilder: (context, index) {
            return MessageBubble(message: state[index]);
          },
          itemCount: state.length,
        );
      },
    ));
  }
}
