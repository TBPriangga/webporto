// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/utils/navbar_utils.dart';
import 'package:webportofolio/core/color/colors.dart';
import 'package:webportofolio/core/res/responsive.dart';
import 'package:webportofolio/widgets/navbar_actions_button.dart';
import 'package:webportofolio/widgets/navbar_logo.dart';

import '../../../../core/providers/drawer_provider.dart';

class NavBarWeb extends StatefulWidget {
  const NavBarWeb({super.key});

  @override
  State<NavBarWeb> createState() => _NavBarWebState();
}

class _NavBarWebState extends State<NavBarWeb> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: bgColor,
      padding: EdgeInsets.symmetric(horizontal: 60.w / 12, vertical: 10),
      child: Row(
        children: [
          const NavBarLogo(),
          const Expanded(child: SizedBox()),
          ...NavBarUtils.names
              .asMap()
              .entries
              .map((e) => NavBarActionButton(label: e.value, index: e.key)),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.translationValues(0, isHover ? -15 : 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: isHover ? secondaryColor : primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: InkWell(
                onHover: (value) {
                  setState(() {
                    isHover = value;
                  });
                },
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'Contect',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavbarTablet extends StatefulWidget {
  const NavbarTablet({super.key});

  @override
  State<NavbarTablet> createState() => _NavbarTabletState();
}

class _NavbarTabletState extends State<NavbarTablet> {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return Container(
      color: bgColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context) ? 5.w : 10, vertical: 20),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                drawerProvider.key.currentState!.openDrawer();
              },
              icon: const Icon(Icons.menu)),
          const Expanded(child: SizedBox()),
          const NavBarLogo()
        ],
      ),
    );
  }
}
