// To parse this JSON data, do
//
//     final chartDataModelClass = chartDataModelClassFromMap(jsonString);

import 'dart:convert';

class ChartDataModelClass {
  ChartDataModelClass({
    this.data,
  });

  Data? data;

  ChartDataModelClass copyWith({
    Data? data,
  }) =>
      ChartDataModelClass(
        data: data ?? this.data,
      );

  factory ChartDataModelClass.fromJson(String str) =>
      ChartDataModelClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChartDataModelClass.fromMap(Map<String, dynamic> json) =>
      ChartDataModelClass(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}

class Data {
  Data({
    this.the1G,
    this.the1H,
    this.the1A,
    this.the3A,
    this.the1Y,
    this.the5Y,
    this.symbol,
  });

  List<The1A>? the1G;
  List<The1A>? the1H;
  List<The1A>? the1A;
  List<The1A>? the3A;
  List<The1A>? the1Y;
  List<The1A>? the5Y;
  String? symbol;

  Data copyWith({
    List<The1A>? the1G,
    List<The1A>? the1H,
    List<The1A>? the1A,
    List<The1A>? the3A,
    List<The1A>? the1Y,
    List<The1A>? the5Y,
    String? symbol,
  }) =>
      Data(
        the1G: the1G ?? this.the1G,
        the1H: the1H ?? this.the1H,
        the1A: the1A ?? this.the1A,
        the3A: the3A ?? this.the3A,
        the1Y: the1Y ?? this.the1Y,
        the5Y: the5Y ?? this.the5Y,
        symbol: symbol ?? this.symbol,
      );

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        the1G: json["1G"] == null
            ? []
            : List<The1A>.from(json["1G"]!.map((x) => The1A.fromMap(x))),
        the1H: json["1H"] == null
            ? []
            : List<The1A>.from(json["1H"]!.map((x) => The1A.fromMap(x))),
        the1A: json["1A"] == null
            ? []
            : List<The1A>.from(json["1A"]!.map((x) => The1A.fromMap(x))),
        the3A: json["3A"] == null
            ? []
            : List<The1A>.from(json["3A"]!.map((x) => The1A.fromMap(x))),
        the1Y: json["1Y"] == null
            ? []
            : List<The1A>.from(json["1Y"]!.map((x) => The1A.fromMap(x))),
        the5Y: json["5Y"] == null
            ? []
            : List<The1A>.from(json["5Y"]!.map((x) => The1A.fromMap(x))),
        symbol: json["symbol"],
      );

  Map<String, dynamic> toMap() => {
        "1G": the1G == null
            ? []
            : List<dynamic>.from(the1G!.map((x) => x.toMap())),
        "1H": the1H == null
            ? []
            : List<dynamic>.from(the1H!.map((x) => x.toMap())),
        "1A": the1A == null
            ? []
            : List<dynamic>.from(the1A!.map((x) => x.toMap())),
        "3A": the3A == null
            ? []
            : List<dynamic>.from(the3A!.map((x) => x.toMap())),
        "1Y": the1Y == null
            ? []
            : List<dynamic>.from(the1Y!.map((x) => x.toMap())),
        "5Y": the5Y == null
            ? []
            : List<dynamic>.from(the5Y!.map((x) => x.toMap())),
        "symbol": symbol,
      };
}

class The1A {
  The1A({
    this.d,
    this.c,
    this.o,
    this.h,
    this.l,
    this.v,
  });

  int? d;
  double? c;
  double? o;
  double? h;
  double? l;
  int? v;

  The1A copyWith({
    int? d,
    double? c,
    double? o,
    double? h,
    double? l,
    int? v,
  }) =>
      The1A(
        d: d ?? this.d,
        c: c ?? this.c,
        o: o ?? this.o,
        h: h ?? this.h,
        l: l ?? this.l,
        v: v ?? this.v,
      );

  factory The1A.fromJson(String str) => The1A.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory The1A.fromMap(Map<String, dynamic> json) => The1A(
        d: json["d"],
        c: json["c"]?.toDouble(),
        o: json["o"]?.toDouble(),
        h: json["h"]?.toDouble(),
        l: json["l"]?.toDouble(),
        v: json["v"],
      );

  Map<String, dynamic> toMap() => {
        "d": d,
        "c": c,
        "o": o,
        "h": h,
        "l": l,
        "v": v,
      };
}
