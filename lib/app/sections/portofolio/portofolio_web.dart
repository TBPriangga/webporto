import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/core/color/colors.dart';

class PortofolioWeb extends StatefulWidget {
  const PortofolioWeb({super.key});

  @override
  State<PortofolioWeb> createState() => _PortofolioWebState();
}

class _PortofolioWebState extends State<PortofolioWeb> {
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
            )
          ],
        ),
      ],
    );
  }
}
