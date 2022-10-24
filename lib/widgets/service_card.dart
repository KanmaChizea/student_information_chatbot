import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/responsive.dart';

import '../models/service.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.service,
  }) : super(key: key);

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          isThreeLine: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          leading:
              SizedBox(width: 100, child: SvgPicture.asset(service.iconPath)),
          title: Text(service.title,
              style: isMobile(context)
                  ? Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w600)
                  : Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w600)),
          subtitle: Text(
            service.description,
            style: isMobile(context)
                ? Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 10)
                : Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16),
          )),
    );
  }
}
