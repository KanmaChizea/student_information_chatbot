import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_information_chatbot/data/scroll_controller_cubit.dart';
import '../data/message_cubit.dart';

import '../core/colors.dart';
import '../core/responsive.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  void _handleSubmission(String text) {
    _controller.clear();
    context.read<MessageCubit>().sendMessage(text);
    context.read<ScrollControllerCubit>().updateScrollPosition();
    context.read<MessageCubit>().getResponse(text);
    context.read<ScrollControllerCubit>().updateScrollPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (_) => _handleSubmission(_controller.text),
            autofocus: true,
            showCursor: true,
            style: isMobile(context)
                ? Theme.of(context).textTheme.subtitle2
                : Theme.of(context).textTheme.bodyText2,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Type your message',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(width: 2, color: primary)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(width: 2, color: primary))),
          ),
        ),
        IconButton(
          color: primary,
          iconSize: 30,
          icon: const Icon(Icons.send),
          onPressed: () => _handleSubmission(_controller.text),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
