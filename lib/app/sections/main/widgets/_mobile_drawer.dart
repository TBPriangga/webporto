import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webportofolio/app/utils/navbar_utils.dart';
import 'package:webportofolio/widgets/navbar_logo.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: Column(
            children: [
              const Center(
                child: NavBarLogo(),
              ),
              const Divider(),
              ...NavBarUtils.names.asMap().entries.map((e) => MaterialButton(
                    onPressed: () {},
                    child: ListTile(
                      leading: Icon(
                        NavBarUtils.icons[e.key],
                        color: Colors.black,
                      ),
                      title: Text(e.value),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
