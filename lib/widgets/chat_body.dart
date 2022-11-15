import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_information_chatbot/data/scroll_controller_cubit.dart';

import '../data/message_cubit.dart';
import 'message_bubble.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      controller: context.read<ScrollControllerCubit>().state,
      padding: const EdgeInsets.all(8.0),
      separatorBuilder: (context, index) => const SizedBox(height: 32),
      itemBuilder: (context, index) =>
          MessageBubble(message: context.watch<MessageCubit>().state[index]),
      itemCount: context.watch<MessageCubit>().state.length,
    ));
  }
}
