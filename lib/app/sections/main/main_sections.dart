import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:webportofolio/app/sections/main/widgets/_mobile_drawer.dart';
import 'package:webportofolio/app/sections/main/widgets/_navbar_destkop.dart';
import 'package:webportofolio/app/sections/main/widgets/_body.dart';
import 'package:webportofolio/core/providers/scroll_provider.dart';
import 'package:webportofolio/core/res/responsive.dart';
import 'package:webportofolio/widgets/arrow_on_top.dart';
import '../../../core/providers/drawer_provider.dart';

class MainPage extends StatefulWidget {
  final ScrollProvider scrollProvider;
  MainPage({super.key, required this.scrollProvider});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ItemScrollController itemScrollController = ItemScrollController();
  bool isShow = false;
  late VoidCallback myListener;

  @override
  void initState() {
    super.initState();
    myListener() {
      final positions =
          widget.scrollProvider.itemPositionsListener.itemPositions.value;
      final firstVisible = positions.first.index;
      final lastVisible = positions.last.index;
      setState(() {
        isShow = firstVisible > 0 && lastVisible < 90;
      });
    }

    widget.scrollProvider.itemPositionsListener.itemPositions.addListener(
      myListener,
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollProvider.itemPositionsListener.itemPositions.removeListener(
      myListener,
    );
  }

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
        body: Stack(
          children: [const Body(), if (isShow) const ArrowOnTop()],
        ),
      ),
    );
  }
}
