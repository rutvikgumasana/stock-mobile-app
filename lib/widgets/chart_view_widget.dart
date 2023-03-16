import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';

class ChartView extends StatelessWidget {
  //data argument for get data from selected timeframe
  //H1 is default if any value
  const ChartView({
    Key? key,
    required this.selectedData,
    required this.H1,
  }) : super(key: key);

  final List<CandleData>? selectedData;
  final List<CandleData> H1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 200,
          child: selectedData != null && selectedData!.isNotEmpty
              ? InteractiveChart(
                  key: UniqueKey(),
                  //chart style (color,lable height ,etc.)
                  style: ChartStyle(
                    priceGainColor: Colors.teal[200]!,
                    priceLossColor: Colors.blueGrey,
                    volumeColor: Colors.teal.withOpacity(0.8),

                    priceGridLineColor: Colors.grey.withOpacity(0.5),
                    priceLabelStyle: TextStyle(color: Color(0XFF000025)),
                    timeLabelStyle: TextStyle(color: Color(0XFF000025)),
                    timeLabelHeight: 32,
                    volumeHeightFactor:
                        0.2, // volume area is 20% of total height
                  ),

                  //candle data
                  candles: selectedData != null && selectedData!.isNotEmpty
                      ? selectedData!
                      : H1,
                )
              //until data not set in selecteddata loader on screen
              : const CupertinoActivityIndicator()),
    );
  }
}
