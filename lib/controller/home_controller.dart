import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:interactive_chart/interactive_chart.dart';

import '../model/chartDataModelClass.dart';
import '../model/drop_down_model.dart';

class HomeController extends GetxController {
  ///var.s for storing timeframe data
  ///
  ///
  ///

  List<CandleData> H1 = [];
  List<CandleData> G1 = [];
  List<CandleData> A1 = [];
  List<CandleData> A3 = [];
  List<CandleData> Y1 = [];
  List<CandleData> Y5 = [];

  ///
  ///
  ///
  ///--------------------------------

//timeframe row List
  RxList<DropDownModel> timeFrameList = <DropDownModel>[].obs;

  Future<Data?> fetchData() async {
    try {
      //fetching chart data from api
      var response = await Dio().get("https://finfree.app/demo",
          options: Options(headers: {"Authorization": "R29vZCBMdWNr"}));

//converting json data into modelcalss
      var apiData =
          ChartDataModelClass.fromMap({"data": jsonDecode(response.data)})
              .data!;

      ///storing data into difrent timeframes
      ///
      apiData.the1G?.forEach((e) {
        G1.add(CandleData(
            timestamp: e.d!,
            open: e.o,
            close: e.c,
            high: e.h,
            low: e.l,
            volume: e.v?.toDouble()));
      });

      apiData.the1H?.forEach((e) {
        H1.add(CandleData(
            timestamp: e.d!,
            open: e.o,
            close: e.c,
            high: e.h,
            low: e.l,
            volume: e.v?.toDouble()));
      });

      apiData.the1A?.forEach((e) {
        A1.add(CandleData(
            timestamp: e.d!,
            open: e.o,
            close: e.c,
            high: e.h,
            low: e.l,
            volume: e.v?.toDouble()));
      });

      apiData.the3A?.forEach((e) {
        A3.add(CandleData(
            timestamp: e.d!,
            open: e.o,
            close: e.c,
            high: e.h,
            low: e.l,
            volume: e.v?.toDouble()));
      });

      apiData.the1Y?.forEach((e) {
        Y1.add(CandleData(
            timestamp: e.d!,
            open: e.o,
            close: e.c,
            high: e.h,
            low: e.l,
            volume: e.v?.toDouble()));
      });

      apiData.the5Y?.forEach((e) {
        Y5.add(CandleData(
            timestamp: e.d!,
            open: e.o,
            close: e.c,
            high: e.h,
            low: e.l,
            volume: e.v?.toDouble()));
      });

//adding data into timeFrame List
      timeFrameList.add(DropDownModel("H1", H1));
      timeFrameList.add(DropDownModel("G1", G1));
      timeFrameList.add(DropDownModel("A1", A1));
      timeFrameList.add(DropDownModel("A3", A3));
      timeFrameList.add(DropDownModel("Y1", Y1));
      timeFrameList.add(DropDownModel("Y5", Y5));
      timeFrameList.refresh();
    } catch (error, stacktrace) {
      throw Exception("Exception : $error stackTrace: $stacktrace");
    }
    return null;
  }
}
