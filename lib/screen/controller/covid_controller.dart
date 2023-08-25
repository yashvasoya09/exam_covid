import 'package:exam_covid/screen/model/covid_model.dart';
import 'package:exam_covid/utills/api_helper.dart';
import 'package:get/get.dart';

class Covid_Controller extends GetxController
{
  static final covid_controller = Covid_Controller ._();
  Covid_Controller._();
  List<CovidModel> covidList=[];
  void loadApiData()
  {
    covidList = Covid_helper.covid_helper.getCovid_data() as List<CovidModel>;
  }

  RxList<CovidModel> list=<CovidModel>[].obs;
  List<CovidModel> fiterlist=[];

  void serchData(String search)
  {
    if(search.isEmpty)
    {
      list.value=List.from(covidList);
      print("==============================${list.length}");
    }
    else
    {
      print("://////////////////````````````````````````````/////////////////////////````````````````````````````/////////////////````````````````````");
      for(var x in covidList)
      {
        print("``````````````````````````````````````*****************************************************`````````````````````````````````````````***************************************```````````````");

        if(x.country!.toLowerCase().contains(search!.toLowerCase()) )
        {
          fiterlist.add(x);
        }
      }
      list.value=List.from(fiterlist);
    }
  }

}