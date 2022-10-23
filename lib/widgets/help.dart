import 'package:flutter/material.dart';

import '../core/responsive.dart';

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('How to use Joe',
            style: isMobile(context)
                ? Theme.of(context).textTheme.headline4
                : Theme.of(context).textTheme.headline2),
        const SizedBox(height: 24),
        Text(
          '\u2022 Ask straightforward questions',
          style: isMobile(context)
              ? Theme.of(context).textTheme.subtitle2
              : Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 24),
        Text(
          '\u2022 Be clear and unambiguous',
          style: isMobile(context)
              ? Theme.of(context).textTheme.subtitle2
              : Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 24),
        ElevatedButton(onPressed: () {}, child: const Text('GET STARTED'))
      ],
    );
  }
}
