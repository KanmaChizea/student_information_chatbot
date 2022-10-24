import 'package:flutter/material.dart';

import '../core/colors.dart';
import '../core/responsive.dart';
import '../models/chat.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.isSender ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: message.isSender ? primary100 : Colors.white,
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            message.text,
            style: isMobile(context)
                ? Theme.of(context).textTheme.subtitle2
                : Theme.of(context).textTheme.bodyText2,
          )),
    );
  }
}
