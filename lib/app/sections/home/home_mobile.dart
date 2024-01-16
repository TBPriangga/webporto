import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/changes/strings.dart';
import 'package:webportofolio/app/sections/home/widgets/animation_text.dart';
import 'package:webportofolio/core/animations/entrance_fader.dart';
import 'package:webportofolio/core/color/colors.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  hellotag,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                EntranceFader(
                  offset: const Offset(0, 0),
                  delay: const Duration(seconds: 2),
                  duration: const Duration(milliseconds: 800),
                  child: Image.asset(
                    'assets/gif/hi.gif',
                    height: 10.sp,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              yourname,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                const Text(
                  'A',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: mobileList),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              miniDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  color: textColor.withOpacity(0.6)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 180,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
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
            SizedBox(
              height: 3.h,
            ),
            Center(
              child: Image.asset(
                'assets/imgs/oline.png',
                fit: BoxFit.cover,
                height: 40.h,
                width: 35.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
