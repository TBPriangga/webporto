import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/sections/portofolio/widget/all_pagemobile.dart';
import 'package:webportofolio/core/color/colors.dart';
import 'package:webportofolio/widgets/navbar_work_button.dart';

class PortofolioMobile extends StatefulWidget {
  const PortofolioMobile({super.key});

  @override
  State<PortofolioMobile> createState() => _PortofolioMobileState();
}

class _PortofolioMobileState extends State<PortofolioMobile>
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: 50.h,
          width: 100.w,
          color: secondaryColor,
          child: Stack(
            children: [
              Positioned(
                  top: 15.h,
                  left: 80.w,
                  child: Image.asset(
                    'assets/imgs/vector.png',
                    scale: 2.5,
                  )),
              Positioned(
                  bottom: 15.h,
                  right: 80.w,
                  child: Image.asset(
                    'assets/imgs/vector.png',
                    scale: 2.5,
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
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: const Center(
                child: Text(
                  'Check My Portofolio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'JoseFinans',
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 50,
              child: TabBar(
                tabs: _tabs,
                controller: _tabController,
                labelPadding: const EdgeInsets.all(4),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.white,
                indicatorColor: primaryColor,
                indicatorWeight: 4,
                tabAlignment: TabAlignment.center,
                unselectedLabelColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 170.h,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ...List.generate(5, (index) {
                    return const AllPageMobile();
                  })
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
