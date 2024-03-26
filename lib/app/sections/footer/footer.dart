import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/core/color/colors.dart';

class FooterWeb extends StatefulWidget {
  const FooterWeb({super.key});

  @override
  State<FooterWeb> createState() => _FooterWebState();
}

class _FooterWebState extends State<FooterWeb> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenWidth < 1300 ? 50.h : 60.h,
      width: 100.w,
      color: textColor,
      child: Stack(
        children: [
          Positioned(
              child: Image.asset(
            'assets/imgs/vector.png',
            scale: 2,
            color: Color(0xFF2c2943),
          )),
          Positioned(
              bottom: 20.h,
              right: 80.w,
              child: Image.asset(
                'assets/imgs/vector.png',
                scale: 2,
                color: Color(0xFF2c2943),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h))
        ],
      ),
    );
  }
}
