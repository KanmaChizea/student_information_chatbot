import 'package:flutter/material.dart';

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 960;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 960;
