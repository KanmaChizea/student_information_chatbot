import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    this.isHeader = true,
  }) : super(key: key);
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'logo.svg',
          color: isHeader ? primary : Colors.white,
          width: 42,
          height: 42,
        ),
        const SizedBox(width: 12),
        Container(
          color: isHeader ? primary : Colors.white,
          width: 2,
          height: 40,
        ),
        const SizedBox(width: 12),
        Text('JOE',
            style: TextStyle(
                fontSize: 36,
                color: isHeader ? primary : Colors.white,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
