import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/changes/img.dart';
import 'package:webportofolio/app/utils/work_utils.dart';
import 'package:webportofolio/core/color/colors.dart';

class AllPageMobile extends StatefulWidget {
  const AllPageMobile({super.key});

  @override
  State<AllPageMobile> createState() => _AllPageMobileState();
}

class _AllPageMobileState extends State<AllPageMobile> {
  List<String> images = [
    portfolioImg2,
    portfolioImg3,
    portfolioImg4,
    portfolioImg5,
  ];
  List<bool> isHovered = List.generate(5, (index) => false);
  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SizedBox(
        height: 100.h,
        child: Column(
          children: [
            _Container(screenWidth, 0, 20.h, worksUtils[0]),
            ...List.generate(4, (index) {
              return _Container(
                  screenWidth, index + 1, 35.h, worksUtils[index + 1]);
            })
          ],
        ),
      ),
    );
  }

  _Container(double width, int index, double height, WorksUtils worksUtils) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          setState(() => isHovered[index] = value);
        });
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 2.h),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: const Color(0xffddddddd),
            borderRadius: BorderRadius.circular(22),
            image: DecorationImage(
              image: AssetImage(worksUtils.img),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                  child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.8)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 0, 0.2, 1],
                  ),
                ),
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                worksUtils.titel,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                worksUtils.description,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
