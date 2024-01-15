import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/providers/scroll_provider.dart';
import '../../../utils/utils.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(
        context); //Mengakses instance ScrollProvider dari provider untuk mengelola state scrolling.
    return ScrollablePositionedList.builder(
      //Membuat daftar yang dapat discroll dengan fitur-fitur berikut:
      itemScrollController: scrollProvider
          .itemScrollController, //Mengontrol posisi scroll dari item tertentu dalam daftar.
      scrollOffsetListener: scrollProvider
          .scrollOffsetListener, //Trigger untuk mengetahui perubahan posisi scroll secara keseluruhan.
      itemPositionsListener: scrollProvider
          .itemPositionsListener, //Trigger untuk mengetahui perubahan posisi item individu.
      scrollOffsetController: scrollProvider
          .scrollOffsetController, //Trigger untuk Mengontrol posisi scroll secara keseluruhan.
      itemCount: BodyUtils.views(scrollProvider)
          .length, //Mengambil jumlah widget untuk menentukan jumlah item dalam daftar.
      itemBuilder: (context, index) {
        //Fungsi yang membangun setiap item dalam daftar.
        return BodyUtils.views(scrollProvider)[
            index]; // Mengambil widget yang sesuai untuk ditampilkan pada posisi index.
      },
    );
  }
}
