import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/changes/strings.dart';
import 'package:webportofolio/app/sections/home/widgets/animation_text.dart';
import 'package:webportofolio/core/animations/entrance_fader.dart';
import 'package:webportofolio/core/color/colors.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 100.h,
      color: bgColor,
      child: Stack(
        children: [
          SizedBox(
            width: 60.w,
            child: Padding(
              padding: EdgeInsets.only(
                  top: screenWidth < 1200 ? 30.h : 50.h, left: 10.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        hellotag,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      EntranceFader(
                        offset: const Offset(0, 0),
                        delay: const Duration(seconds: 2),
                        duration: const Duration(milliseconds: 800),
                        child: Image.asset(
                          'assets/gif/hi.gif',
                          height: 40,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    yourname,
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'A',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      AnimatedTextKit(
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          animatedTexts: webList),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Text(
                      miniDescription,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: textColor.withOpacity(0.6)),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    transform:
                        Matrix4.translationValues(0, isHover ? -20 : 0, 0),
                    child: InkWell(
                      onHover: (value) {
                        setState(() {
                          isHover = value;
                        });
                      },
                      onTap: () {},
                      child: Container(
                        height: 65,
                        width: 250,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: isHover ? secondaryColor : primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            "Download CV",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: screenWidth - 55.w,
            child: SizedBox(
              height: 100.h,
              child: Image.asset(
                'assets/imgs/oline.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
