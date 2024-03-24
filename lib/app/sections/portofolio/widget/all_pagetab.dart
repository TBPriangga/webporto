import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/utils/work_utils.dart';
import 'package:webportofolio/core/color/colors.dart';

class AllPageTab extends StatefulWidget {
  const AllPageTab({super.key});

  @override
  State<AllPageTab> createState() => _AllPageTabState();
}

class _AllPageTabState extends State<AllPageTab> {
  List<bool> isHovered = List.generate(5, (index) => false);
  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _Container(0, worksUtils[0]),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              child: _Container(1, worksUtils[1]),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Expanded(
              child: _Container(2, worksUtils[2]),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              child: _Container(3, worksUtils[3]),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              child: _Container(4, worksUtils[4]),
            ),
          ],
        ),
      ],
    );
  }

  _Container(int index, WorksUtils worksUtils) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 25.w,
          decoration: BoxDecoration(
            color: const Color(0xffddddddd),
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(worksUtils.img),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                  child: Container(
                height: 25.w,
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
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
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                child: Column(
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
