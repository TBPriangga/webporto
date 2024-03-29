import 'package:flutter/material.dart';
import 'package:webportofolio/app/sections/about/about_web.dart';
import 'package:webportofolio/core/res/responsive.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: AboutWeb(),
      tablet: AboutWeb(),
      web: AboutWeb(),
    );
  }
}
