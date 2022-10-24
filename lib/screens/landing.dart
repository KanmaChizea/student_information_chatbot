import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/responsive.dart';
import '../widgets/footer.dart';

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
  final _controller = ScrollController();
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RawKeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKey: _handleOnKey,
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

  void _handleOnKey(RawKeyEvent event) {
    var offset = _controller.offset;
    const duration = Duration(milliseconds: 30);
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
          _controller.animateTo(offset - 100,
              duration: duration, curve: Curves.ease);
        } else {
          _controller.animateTo(offset - 100,
              duration: duration, curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        if (kReleaseMode) {
          _controller.animateTo(offset + 100,
              duration: duration, curve: Curves.ease);
        } else {
          _controller.animateTo(offset + 100,
              duration: duration, curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.pageDown) {
      setState(() {
        if (kReleaseMode) {
          _controller.animateTo(offset + 300,
              duration: duration, curve: Curves.ease);
        } else {
          _controller.animateTo(offset + 300,
              duration: duration, curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.pageUp) {
      setState(() {
        if (kReleaseMode) {
          _controller.animateTo(offset - 300,
              duration: duration, curve: Curves.ease);
        } else {
          _controller.animateTo(offset - 300,
              duration: duration, curve: Curves.ease);
        }
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
