import 'package:interactive_chart/interactive_chart.dart';

class DropDownModel {
  String name;
  List<CandleData> candleList;
  DropDownModel(this.name, this.candleList);
}

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final double y;
}
