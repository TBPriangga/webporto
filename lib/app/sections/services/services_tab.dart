import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/utils/services_utils.dart';

import '../../../core/color/colors.dart';

class ServiceTab extends StatefulWidget {
  ServiceTab({super.key});

  @override
  State<ServiceTab> createState() => _ServiceTabState();
}

class _ServiceTabState extends State<ServiceTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: Colors.white,
      padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
      child: Column(
        children: [
          Text(
            "My Expertise",
            style: TextStyle(
                color: secondaryColor,
                fontFamily: 'josefinsans',
                fontSize: 22.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Provide Wide Range of Digital Services",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontFamily: 'josefinsans',
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.all(5.h),
            crossAxisSpacing: 5.h,
            mainAxisSpacing: 5.h,
            crossAxisCount: 2,
            children: List.generate(4, (index) {
              return ServiceCard();
            }),
          ),
        ],
      ),
    );
  }

  ServiceCard() {
    return Container(
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: bgColor,
              spreadRadius: 60,
              blurRadius: 70,
              offset: Offset(10, 50),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
            child: Image.asset(
              servicesUtils.icon,
              scale: 2,
            ),
          ),
        ],
      ),
    );
  }
}
