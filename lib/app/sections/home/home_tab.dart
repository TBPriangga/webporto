import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/changes/strings.dart';
import 'package:webportofolio/app/sections/home/widgets/animation_text.dart';
import 'package:webportofolio/core/animations/entrance_fader.dart';
import 'package:webportofolio/core/color/colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    animatedTexts: tabList),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              miniDescription,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  color: textColor.withOpacity(0.6)),
            ),
            SizedBox(
              height: 4.h,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.translationValues(0, isHover ? -20 : 0, 0),
              child: InkWell(
                onHover: (value) {
                  setState(() {
                    isHover = value;
                  });
                },
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              height: 4.h,
            ),
            Center(
              child: Image.asset(
                'assets/imgs/oline.png',
                fit: BoxFit.cover,
                height: 50.h,
                width: 40.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
