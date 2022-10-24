import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/responsive.dart';

import 'hero_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const HeroText(),
          if (!isMobile(context))
            SizedBox(
                height: MediaQuery.of(context).size.width / 3,
                width: MediaQuery.of(context).size.width / 3,
                child: SvgPicture.asset('hero.svg', fit: BoxFit.contain))
        ],
      ),
    );
  }
}
