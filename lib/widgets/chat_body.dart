import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      padding: const EdgeInsets.all(8.0),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) =>
          MessageBubble(message: context.watch<MessageCubit>().state[index]),
      itemCount: context.watch<MessageCubit>().state.length,
    ));
  }
}
