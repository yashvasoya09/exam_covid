import 'package:exam_covid/screen/model/covid_model.dart';
import 'package:exam_covid/utills/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu, color: Colors.red),
          title: Text(
            "Tech Blaze",
            style: GoogleFonts.openSans(color: Colors.green),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                  onTap: () {
                    Get.toNamed('search');
                  }, child: Icon(Icons.search_outlined, color: Colors.orange)),
            ),
          ],
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              List<CovidModel>? covidData = snapshot.data as List<CovidModel>?;
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          CovidModel model = CovidModel(
                            active: covidData[index].active,
                            activePerOneMillion: covidData[index]
                                .activePerOneMillion,
                            cases: covidData[index].cases,
                            casesPerOneMillion: covidData[index]
                                .casesPerOneMillion,
                            continent: covidData[index].continent,
                            country: covidData[index].country,
                            countryInfo: covidData[index].countryInfo,
                            critical: covidData[index].critical,
                            criticalPerOneMillion: covidData[index]
                                .criticalPerOneMillion,
                            deaths: covidData[index].deaths,
                            deathsPerOneMillion: covidData[index]
                                .deathsPerOneMillion,
                            oneCasePerPeople: covidData[index]
                                .oneCasePerPeople,
                            oneDeathPerPeople: covidData[index]
                                .oneDeathPerPeople,
                            oneTestPerPeople: covidData[index].oneTestPerPeople,
                            population: covidData[index].population,
                            recovered: covidData[index].recovered,
                            recoveredPerOneMillion: covidData[index]
                                .recoveredPerOneMillion,
                            tests: covidData[index].tests,
                            testsPerOneMillion: covidData[index]
                                .testsPerOneMillion,
                            todayCases: covidData[index].todayCases,
                            todayDeaths: covidData[index].todayDeaths,
                            todayRecovered: covidData[index].todayRecovered,
                            updated: covidData[index].updated,
                          );
                          Get.toNamed('second', arguments: model);
                        },
                          child: ListTile(
                            title: Text("${covidData![index].country}",
                                style: GoogleFonts.play()),
                            leading: Container(
                                width: 100,
                                height: 80,
                                child: Image.network(
                                  "${covidData[index].countryInfo!.flag}",
                                  fit: BoxFit.fitWidth,
                                )),
                          ),
                      ),
                    );
                  },
                  itemCount: covidData!.length);
            }
            return Center(
              child: SizedBox(
                height: 10.h,
                width: 10.w,
                child: LoadingIndicator(
                  indicatorType: Indicator.lineSpinFadeLoader,
                  colors: const [Colors.green, Colors.red, Colors.orange],

                ),
              ),
            );
          },
          future: Covid_helper.covid_helper.getCovid_data(),
        ),
      ),
    );
  }
}
