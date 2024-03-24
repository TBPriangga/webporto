import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/sections/portofolio/widget/all_pagetab.dart';
import 'package:webportofolio/core/color/colors.dart';
import 'package:webportofolio/widgets/navbar_work_button.dart';

class PortofolioTab extends StatefulWidget {
  const PortofolioTab({super.key});

  @override
  State<PortofolioTab> createState() => _PortofolioTabState();
}

class _PortofolioTabState extends State<PortofolioTab>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _tabs = [
    const Tab(
      child: NavBarWorkButton(
        label: 'All',
      ),
    ),
    const Tab(child: NavBarWorkButton(label: 'Mobile App')),
    const Tab(child: NavBarWorkButton(label: 'Web App')),
    const Tab(child: NavBarWorkButton(label: 'UI/UX Design')),
    const Tab(child: NavBarWorkButton(label: 'Back End')),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 32.h,
          width: 100.w,
          color: secondaryColor,
          child: Stack(
            children: [
              Positioned(
                  top: 15.h,
                  left: 80.w,
                  child: Image.asset(
                    'assets/imgs/vector.png',
                    scale: 1.5,
                  )),
              Positioned(
                  bottom: 15.h,
                  right: 80.w,
                  child: Image.asset(
                    'assets/imgs/vector.png',
                    scale: 1.5,
                  )),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            const Center(
              child: Text(
                'Creative Works',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'josefinsans',
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Center(
                child: Text(
                  'Check My Portofolio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'JoseFinans',
                      fontSize: 40,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: SizedBox(
                height: 50.0,
                child: TabBar(
                  tabs: _tabs,
                  controller: _tabController,
                  labelPadding: const EdgeInsets.all(0),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.white,
                  indicatorColor: primaryColor,
                  indicatorWeight: 4,
                  unselectedLabelColor: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: SizedBox(
                height: 60.w,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ...List.generate(5, (index) {
                      return const AllPageTab();
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
