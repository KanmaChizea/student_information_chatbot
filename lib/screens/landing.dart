import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_information_chatbot/core/responsive.dart';
import 'package:student_information_chatbot/widgets/footer.dart';

import '../widgets/about.dart';
import '../widgets/help.dart';
import '../widgets/hero.dart';
import '../widgets/service.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();
  static const Duration _duration = Duration(milliseconds: 30);

  void _handleKeyEvent(RawKeyEvent event) {
    var offset = _controller.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
          _controller.animateTo(offset - 200,
              duration: _duration, curve: Curves.ease);
        } else {
          _controller.animateTo(offset - 200,
              duration: _duration, curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        if (kReleaseMode) {
          _controller.animateTo(offset + 200,
              duration: _duration, curve: Curves.ease);
        } else {
          _controller.animateTo(offset + 200,
              duration: _duration, curve: Curves.ease);
        }
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RawKeyboardListener(
        autofocus: true,
        focusNode: _focusNode,
        onKey: _handleKeyEvent,
        child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                Padding(
                  padding: isMobile(context)
                      ? const EdgeInsets.symmetric(vertical: 36, horizontal: 16)
                      : const EdgeInsets.symmetric(
                          vertical: 36, horizontal: 80),
                  child: Column(
                    children: [
                      const HeroSection(),
                      SizedBox(height: isDesktop(context) ? 48 : 28),
                      const AboutSection(),
                      SizedBox(height: isDesktop(context) ? 48 : 28),
                      const ServiceSection(),
                      SizedBox(height: isDesktop(context) ? 48 : 28),
                      const HelpSection(),
                      SizedBox(height: isDesktop(context) ? 96 : 48),
                    ],
                  ),
                ),
                const Footer()
              ],
            )),
      ),
    );
  }
}
