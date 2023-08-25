import 'package:exam_covid/screen/model/covid_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class secondScreen extends StatefulWidget {
  const secondScreen({super.key});

  @override
  State<secondScreen> createState() => _secondScreenState();
}

class _secondScreenState extends State<secondScreen> {
  @override
  Widget build(BuildContext context) {
    CovidModel model = Get.arguments;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
              Container(
              height: 20.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${model.countryInfo!.flag}'),
                  ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${model.country}",
              style: GoogleFonts.play(color: Colors.black, fontSize: 25),

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text("Active Cases",
                  style: GoogleFonts.aBeeZee(fontSize: 18, color: Colors.black),),
                Divider(color: Colors.red),
                Text("${model.active}", style: GoogleFonts.aBeeZee(
                    fontSize: 18, color: Colors.black))],),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                Text("Today Recovered",
                  style: GoogleFonts.aBeeZee(fontSize: 18, color: Colors.black),),
                Divider(color: Colors.black),
                Text("${model.todayRecovered}", style: GoogleFonts.aBeeZee(
                    fontSize: 18, color: Colors.black))],),
            ),
            ],),
                Container(height: 1,color: Colors.black,width: double.infinity,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Text("Deaths",
                          style: GoogleFonts.aBeeZee(fontSize: 18, color: Colors.black),),
                        Divider(color: Colors.red),
                        Text("${model.deaths}", style: GoogleFonts.aBeeZee(
                            fontSize: 18, color: Colors.black))],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Total Cases",
                            style: GoogleFonts.aBeeZee(fontSize: 18, color: Colors.black),),
                          Divider(color: Colors.black),
                          Text("${model.cases}", style: GoogleFonts.aBeeZee(
                              fontSize: 18, color: Colors.black))],),
                    ),
                  ],),
                Container(height: 1,color: Colors.black,width: double.infinity,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Text("Total Test",
                          style: GoogleFonts.aBeeZee(fontSize: 18, color: Colors.black),),
                        Divider(color: Colors.red),
                        Text("${model.tests}", style: GoogleFonts.aBeeZee(
                            fontSize: 18, color: Colors.black))],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Total Recoverd",
                            style: GoogleFonts.aBeeZee(fontSize: 18, color: Colors.black),),
                          Divider(color: Colors.black),
                          Text("${model.recovered}", style: GoogleFonts.aBeeZee(
                              fontSize: 18, color: Colors.black))],),
                    ),
                  ],),
          ],
          ),
        ),
      ),
    );
  }
}
