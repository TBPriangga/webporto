import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/core/color/colors.dart';
import 'package:webportofolio/widgets/navbar_work_button.dart';

class PortofolioWeb extends StatefulWidget {
  const PortofolioWeb({super.key});

  @override
  State<PortofolioWeb> createState() => _PortofolioWebState();
}

class _PortofolioWebState extends State<PortofolioWeb>
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
          height: screenWidth < 1300 ? 70.h : 80.h,
          width: 100.w,
          color: secondaryColor,
          child: Stack(
            children: [
              Positioned(
                  top: 30.h,
                  left: 80.w,
                  child: Image.asset(
                    'assets/imgs/vector.png',
                    scale: 1.5,
                  )),
              Positioned(
                  bottom: 30.h,
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
              height: 10.h,
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
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Center(
                child: Text(
                  'Check My Portofolio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'JoseFinans',
                      fontSize: screenWidth < 1500 ? 40 : 50,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
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
          ],
        ),
      ],
    );
  }
}
