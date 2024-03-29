import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:webportofolio/app/sections/main/main_sections.dart';
import '../../providers/scroll_provider.dart';
import 'bloc/connected_bloc.dart';

class NChecking extends StatelessWidget {
  const NChecking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectedBloc, ConnectedState>(
      listener: (context, state) {},
      builder: (context, state) {
        final scrollProvider = Provider.of<ScrollProvider>(context);
        if (state is ConnectedSucessState) {
          return MainPage(
            scrollProvider: scrollProvider,
          );
        } else {
          return MainPage(
            scrollProvider: scrollProvider,
          );
        }
        // return Container();
      },
    );
  }
}

class NoConnectionErorr extends StatelessWidget {
  const NoConnectionErorr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Connection failed!"),
          ],
        ),
      ),
    );
  }
}
// TODO
