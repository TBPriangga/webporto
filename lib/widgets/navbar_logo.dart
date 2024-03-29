import 'package:flutter/material.dart';

import '../core/res/responsive.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // theme

    return SizedBox(
      width: Responsive.isWeb(context) ? 300 : 150,
      child: Image.asset('assets/imgs/tbp_logo.png'),
    );
  }
}
