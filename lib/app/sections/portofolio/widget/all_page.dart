import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/utils/work_utils.dart';

class AllPage extends StatefulWidget {
  AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  List<bool> isHovered = List.generate(5, (index) => false);

  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Column(
        children: [
          Row(
            children: [
              _Container(48.w, 0, worksUtils[0]),
              SizedBox(
                width: 2.w,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _Container(double width, int index, WorksUtils worksUtils) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          setState(() => isHovered[index] = value);
        });
      },
      child: Container(
        height: screenWidth < 1300 ? 35.h : 45.h,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage(worksUtils.img),
            fit: BoxFit.cover,
          ),
        ),
        child: isHovered[index]
            ? Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    height: screenWidth < 1300 ? 35.h : 45.h,
                    width: width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
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
                  ))
                ],
              )
            : null,
      ),
    );
  }
}
