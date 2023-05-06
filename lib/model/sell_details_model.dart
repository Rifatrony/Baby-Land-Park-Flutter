// To parse this JSON data, do
//
//     final sellDetailsModel = sellDetailsModelFromJson(jsonString);

import 'dart:convert';

SellDetailsModel sellDetailsModelFromJson(String str) => SellDetailsModel.fromJson(json.decode(str));

String sellDetailsModelToJson(SellDetailsModel data) => json.encode(data.toJson());

class SellDetailsModel {
    String? status;
    Data? data;

    SellDetailsModel({
        this.status,
        this.data,
    });

    factory SellDetailsModel.fromJson(Map<String, dynamic> json) => SellDetailsModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? title;
    String? amount;
    String? total;
    int? quantity;
    DateTime? date;
    String? name;
    String? phone;
    String? sellBy;

    Data({
        this.id,
        this.title,
        this.amount,
        this.total,
        this.quantity,
        this.date,
        this.name,
        this.phone,
        this.sellBy,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        amount: json["amount"],
        total: json["total"],
        quantity: json["quantity"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        name: json["name"],
        phone: json["phone"],
        sellBy: json["sell_by"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "amount": amount,
        "total": total,
        "quantity": quantity,
        "date": date?.toIso8601String(),
        "name": name,
        "phone": phone,
        "sell_by": sellBy,
    };
}
