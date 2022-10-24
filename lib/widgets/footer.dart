import 'package:flutter/material.dart';
import '../core/colors.dart';
import 'logo.dart';

import '../core/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //   height: 80,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile(context) ? 16 : 80, vertical: 24),
      color: primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppLogo(isHeader: false),
          const SizedBox(height: 20),
          Text(
            'Copyright \u00A9 2022 JoeChatbot, Ltd.',
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 20),
          Text('Legal stuff  |  Privacy policy  |  Security',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Colors.white)),
          const SizedBox(height: 20),
          const SocialMediaIcons()
        ],
      ),
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.facebook_outlined, color: Colors.white),
        SizedBox(width: 12),
        Icon(Icons.email_outlined, color: Colors.white),
        SizedBox(width: 12),
        Icon(Icons.whatsapp_outlined, color: Colors.white),
      ],
    );
  }
}
