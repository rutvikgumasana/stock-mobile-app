import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:laplace/controller/home_controller.dart';
import 'package:laplace/widgets/app_bar_widget.dart';
import 'model/chartDataModelClass.dart';
import 'model/drop_down_model.dart';
import 'widgets/chart_view_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //getx home controller
  HomeController homeController = Get.put(HomeController());

  //store api res.
  Data? graphData = Data();

//selected chart timeframe data
  RxList<CandleData> selectedData = <CandleData>[].obs;

  init() async {
    //api call for getting data from backend
    graphData = await homeController.fetchData();

    //storing intial timeframe data
    selectedData.value = homeController.H1;

    //refresh list
    selectedData.refresh();
  }

  @override
  void initState() {
    super.initState();
    homeController.timeFrameList.clear();

//intial api call and data storing
    init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          //custom appbar
          appBar: appBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                //chart timeframe selection
                Obx(
                  () => homeController.timeFrameList.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: homeController.timeFrameList.map((e) {
                            return GestureDetector(
                              onTap: () {
                                // selectedindex = ind;
                                selectedData.value = e.candleList;
                                selectedData.refresh();
                                log("message$selectedData");
                                setState(() {});
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 14),
                                height: 35,
                                decoration: BoxDecoration(
                                  color: selectedData == e.candleList
                                      ? const Color(0XFF000025)
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: Center(
                                    child: Text(
                                  e.name,
                                  style: TextStyle(
                                      color: selectedData == e.candleList
                                          ? Colors.white
                                          : Colors.grey),
                                )),
                              ),
                            );
                          }).toList(),
                        )
                      : SizedBox(),
                ),
                const SizedBox(
                  height: 90,
                ),

                //chart view custom Widget
                Obx(() {
                  return ChartView(
                      selectedData: selectedData.value, H1: homeController.H1);
                }),
              ],
            ),
          )),
    );
  }
}
