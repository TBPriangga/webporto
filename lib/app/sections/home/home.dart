import 'package:flutter/material.dart';
import 'package:webportofolio/app/sections/home/home_mobile.dart';
import 'package:webportofolio/app/sections/home/home_tab.dart';
import 'package:webportofolio/core/res/responsive.dart';

import 'home_web.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeTab(),
      web: HomeWeb(),
    );
  }
}
