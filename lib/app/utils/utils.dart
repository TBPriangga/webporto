import 'package:flutter/material.dart';
import 'package:webportofolio/app/sections/home/home.dart';
import 'package:webportofolio/app/sections/services/services.dart';

import '../../core/providers/scroll_provider.dart';

class BodyUtils {
  static List<Widget> views(ScrollProvider scrollProvider) {
    return [const Home(), const Services()];
  }
}
