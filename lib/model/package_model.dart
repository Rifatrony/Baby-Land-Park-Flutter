// To parse this JSON data, do
//
//     final packageModel = packageModelFromJson(jsonString);

import 'dart:convert';

PackageModel packageModelFromJson(String str) => PackageModel.fromJson(json.decode(str));

String packageModelToJson(PackageModel data) => json.encode(data.toJson());

class PackageModel {
    String? status;
    List<Datum>? data;

    PackageModel({
        this.status,
        this.data,
    });

    factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? title;
    String? amount;

    Datum({
        this.id,
        this.title,
        this.amount,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "amount": amount,
    };
}
