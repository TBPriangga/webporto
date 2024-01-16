import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webportofolio/app/sections/main/widgets/_mobile_drawer.dart';
import 'package:webportofolio/app/sections/main/widgets/_navbar_destkop.dart';
import 'package:webportofolio/app/sections/main/widgets/_body.dart';
import 'package:webportofolio/core/res/responsive.dart';
import 'package:webportofolio/widgets/arrow_on_top.dart';
import '../../../core/providers/drawer_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return SafeArea(
      child: Scaffold(
        key: drawerProvider.key,
        extendBodyBehindAppBar: true,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: Responsive(
            mobile: NavbarTablet(),
            tablet: NavbarTablet(),
            web: NavBarWeb(),
          ),
        ),
        drawer: !Responsive.isWeb(context) ? const MobileDrawer() : null,
        body: const Stack(
          children: [
            Body(),
            ArrowOnTop(),
          ],
        ),
      ),
    );
  }
}
