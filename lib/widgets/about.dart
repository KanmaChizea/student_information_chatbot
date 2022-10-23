import 'package:flutter/material.dart';

import '../core/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('What is Joe?',
          style: isMobile(context)
              ? Theme.of(context).textTheme.headline4
              : Theme.of(context).textTheme.headline2),
      const SizedBox(height: 24),
      Text(
        'Joe is an interactive student information chatbot designed for the students of the University of Benin to get quick answers to their questions on various aspects of the school. It analyzes user\'s queries and understand user\'s message and then uses built in artificial intelligence to answer the queries',
        style: isMobile(context)
            ? Theme.of(context).textTheme.subtitle2
            : Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center,
      )
    ]);
  }
}
