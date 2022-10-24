import 'package:flutter/material.dart';
import '../core/responsive.dart';
import 'logo.dart';

class HeroText extends StatelessWidget {
  const HeroText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppLogo(),
        const Spacer(),
        SizedBox(
          width: isMobile(context)
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width / 2,
          child: Text(
            'Your Friendly Neighbourhood Chatbot',
            style: isMobile(context)
                ? Theme.of(context).textTheme.headline3
                : Theme.of(context).textTheme.headline1,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
            width: isMobile(context)
                ? MediaQuery.of(context).size.width / 2
                : MediaQuery.of(context).size.width / 3,
            child: Text(
              'Get answers to your questions an inquiries about major aspects of the school quickly and easily.',
              style: isMobile(context)
                  ? Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.grey.shade900)
                  : Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.grey.shade900),
            )),
        const SizedBox(height: 36),
        ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed('/chat'),
            child: Text('TALK TO JOE',
                style: TextStyle(
                    fontSize: isMobile(context) ? 16 : 18,
                    color: Colors.white))),
        const Spacer(),
      ],
    );
  }
}
