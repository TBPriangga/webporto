import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'core/configs/connection/bloc/connected_bloc.dart';
import 'core/configs/connection/network_check.dart';
import 'core/providers/drawer_provider.dart';
import 'core/providers/scroll_provider.dart';

class MySite extends StatelessWidget {
  const MySite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectedBloc>(create: (context) => ConnectedBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DrawerProvider()),
          ChangeNotifierProvider(create: (_) => ScrollProvider()),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My Portfolio',
            initialRoute: "/",
            routes: {"/": (context) => const NChecking()},
          );
        }),
      ),
    );
  }
}
