import 'package:flutter/material.dart';
import '../core/constants.dart';
import 'service_card.dart';

import '../core/responsive.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('What can Joe help you with?',
            style: isMobile(context)
                ? Theme.of(context).textTheme.headline4
                : Theme.of(context).textTheme.headline2),
        const SizedBox(height: 24),
        Flexible(
            child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          separatorBuilder: (context, index) => const SizedBox(height: 24),
          itemBuilder: (context, index) =>
              ServiceCard(service: serviceList[index]),
        ))
      ],
    );
  }
}
