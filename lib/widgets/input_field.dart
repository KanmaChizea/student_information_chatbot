import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/colors.dart';
import '../core/responsive.dart';
import '../data/message_cubit.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({
    Key? key,
    required this.updateScroll,
  }) : super(key: key);

  final Function updateScroll;
  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  late TextEditingController _controller;
  late Function updatescroll;

  @override
  void initState() {
    _controller = TextEditingController();
    updatescroll = widget.updateScroll;
    super.initState();
  }

  void _handleSubmission(String text) {
    _controller.clear();
    context.read<MessageCubit>().sendMessage(text);
    Future.delayed(const Duration(seconds: 3), () {
      updatescroll();
    });
    context.read<MessageCubit>().getResponse(text);
    Future.delayed(const Duration(seconds: 5), () {
      updatescroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (_) async {
              _handleSubmission(_controller.text);
            },
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
