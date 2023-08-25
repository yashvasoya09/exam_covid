import 'package:exam_covid/screen/view/home_screen.dart';
import 'package:exam_covid/screen/view/search_screen.dart';
import 'package:exam_covid/screen/view/second_screeen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(builder: (context, orientation, deviceType) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
      routes: {
          "/":(p0) => homeScreen(),
          "search":(p0) => SearchScreen(),
          "second":(p0) => secondScreen(),
      },
      ),
    ),
  );
}
