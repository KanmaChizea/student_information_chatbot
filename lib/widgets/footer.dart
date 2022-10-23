import 'package:flutter/material.dart';
import 'package:student_information_chatbot/core/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      // padding: const EdgeInsets.symmetric(vertical: 16),
      color: primary,
      child: Image.asset('logo_white.png'),
    );
  }
}
