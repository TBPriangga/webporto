// ignore_for_file: non_constant_identifier_names

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
          const Text(
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
            child: const Text(
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
            padding: EdgeInsets.all(2.h),
            crossAxisSpacing: 5.h,
            mainAxisSpacing: 5.h,
            crossAxisCount: 2,
            children: List.generate(4, (index) {
              return ServiceCard(servicesUtils[index]);
            }),
          ),
        ],
      ),
    );
  }

  ServiceCard(ServicesUtils servicesUtils) {
    return Container(
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
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
            width: 10.w,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: bgColor),
            child: Image.asset(
              servicesUtils.icon,
              scale: 2,
            ),
          ),
          SizedBox(
            height: 2.w,
          ),
          Text(
            servicesUtils.name,
            style: const TextStyle(
                color: textColor,
                fontFamily: 'josefinsans',
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 2.h),
          Text(
            servicesUtils.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              color: textColor.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          const Text(
            "Read More",
            style: TextStyle(
              color: primaryColor,
              fontFamily: 'josefinsans',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
