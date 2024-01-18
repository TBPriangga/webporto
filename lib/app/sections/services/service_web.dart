// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/utils/services_utils.dart';
import 'package:webportofolio/core/animations/entrance_fader.dart';
import 'package:webportofolio/core/color/colors.dart';

class ServiceWeb extends StatefulWidget {
  const ServiceWeb({super.key});

  @override
  State<ServiceWeb> createState() => _ServiceWebState();
}

class _ServiceWebState extends State<ServiceWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<bool> isHovered = List.generate(4, (index) => false);
  late double screenWidth;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: const Text(
              "Provide Wide Range of Digital Services",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontFamily: 'josefinsans',
                fontSize: 50.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: EntranceFader(
              offset: const Offset(0, 0),
              delay: const Duration(seconds: 0),
              duration: const Duration(milliseconds: 800),
              child: GridView.builder(
                padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 8.h),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 35.h,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 40),
                itemBuilder: (context, index) {
                  double rotationAngle = isHovered[index] ? 2 : 0;
                  return ServiceCard(
                      index, servicesUtils[index], rotationAngle);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  ServiceCard(int index, ServicesUtils servicesUtils, double rotationAngle) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered[index] = true;
          _controller.forward();
        });
      },
      onExit: (event) {
        setState(() {
          isHovered[index] = false;
          _controller.reverse();
        });
      },
      child: AnimatedBuilder(
        animation:
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        builder: (context, child) {
          return Transform.rotate(
            angle: -rotationAngle * (3.14159265359 / 180) * _controller.value,
            origin: const Offset(0.5, 0.5),
            child: Container(
              width: 100.w,
              height: 100.h,
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                border: Border.all(
                    color: isHovered[index] ? secondaryColor : Colors.white),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: bgColor,
                      spreadRadius: 60,
                      blurRadius: 70,
                      offset: Offset(10, 50)),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 10.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: bgColor),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      transform: Matrix4.translationValues(
                          0, isHovered[index] ? -20 : 0, 0),
                      child: InkWell(
                        onHover: (value) {
                          setState(() {
                            isHovered[index] = value;
                          });
                        },
                        onTap: () {},
                        child: Image.asset(servicesUtils.icon),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          servicesUtils.name,
                          style: TextStyle(
                              color: textColor,
                              fontFamily: 'josefinsans',
                              fontSize: screenWidth < 1200 ? 20 : 30,
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
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
