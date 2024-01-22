// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/utils/services_utils.dart';

import '../../../core/color/colors.dart';

class ServiceMobile extends StatefulWidget {
  ServiceMobile({super.key});

  @override
  State<ServiceMobile> createState() => _ServiceMobileState();
}

class _ServiceMobileState extends State<ServiceMobile> {
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
          SizedBox(
            height: 4.h,
          ),
          ...List.generate(4, (index) {
            return ServiceCard(servicesUtils[index]);
          }),
        ],
      ),
    );
  }

  ServiceCard(ServicesUtils servicesUtils) {
    return Container(
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.only(bottom: 5.h),
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
            width: 30.w,
            decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
            child: Image.asset(
              servicesUtils.icon,
            ),
          ),
          SizedBox(
            height: 2.w,
          ),
          Text(
            servicesUtils.name,
            style: TextStyle(
                color: textColor,
                fontFamily: 'josefinsans',
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 2.h),
          Text(
            servicesUtils.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              color: textColor.withOpacity(0.6),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "Read More",
            style: TextStyle(
              color: primaryColor,
              fontFamily: 'josefinsans',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
