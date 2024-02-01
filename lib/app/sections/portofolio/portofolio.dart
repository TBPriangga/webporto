import 'package:flutter/material.dart';
import 'package:webportofolio/app/sections/portofolio/portofolio_web.dart';
import 'package:webportofolio/core/res/responsive.dart';

class Portofolio extends StatelessWidget {
  const Portofolio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: PortofolioWeb(),
      tablet: PortofolioWeb(),
      web: PortofolioWeb(),
    );
  }
}
