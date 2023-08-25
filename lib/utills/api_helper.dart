
  import 'dart:convert';

  import 'package:exam_covid/screen/model/covid_model.dart';
import 'package:http/http.dart' as http;


  class Covid_helper
  {
  static final Covid_helper covid_helper = Covid_helper._();
  Covid_helper._();

  Future<List<CovidModel>> getCovid_data()
  async {
  String? covid1 = "https://corona.lmao.ninja/v2/countries/";
  var response = await http.get(Uri.parse(covid1));

  List jsondata = jsonDecode(response.body);
  List<CovidModel> coviddata = [];

  coviddata = jsondata.map((e) => CovidModel.fromJson(e)).toList();
  return coviddata;
  }

}