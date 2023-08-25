import 'package:exam_covid/screen/controller/covid_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Container(
              alignment: Alignment.bottomLeft,
              height: 5.h,
              width: 60.w,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextField(
                onChanged: (value) {
                  Covid_Controller.covid_controller.serchData(value);
                },
                cursorColor: Colors.black,
                style: GoogleFonts.play(color: Colors.black, fontSize: 15),
                decoration: InputDecoration(
                    suffix: Icon(CupertinoIcons.search,
                        color: Colors.black, size: 15),
                    hintStyle: GoogleFonts.play(color: Colors.black),
                    hintText: "Search Country",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              )),
        ),
        body: Obx(() => ListView.builder(
            itemCount: Covid_Controller.covid_controller.list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    title: Text(
                        "${Covid_Controller.covid_controller.list[index].country}",
                        style: GoogleFonts.play()),
                    leading: Container(
                      width: 100,
                      height: 80,
                      child: Image.network(
                        "z${Covid_Controller.covid_controller.list[index].countryInfo!.flag}",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
              );
            },
          ),
        ),
      ),
    );
  }
}
