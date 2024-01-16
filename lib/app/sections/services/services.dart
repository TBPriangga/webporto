import 'package:flutter/material.dart';
import 'package:webportofolio/app/sections/services/service_web.dart';
import 'package:webportofolio/core/res/responsive.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: Serviceweb(),
      tablet: Serviceweb(),
      web: Serviceweb(),
    );
  }
}
