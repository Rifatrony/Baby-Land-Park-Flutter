// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
    String? status;
    Data? data;

    DashboardModel({
        this.status,
        this.data,
    });

    factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    Today? today;
    Today? total;

    Data({
        this.today,
        this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        today: json["today"] == null ? null : Today.fromJson(json["today"]),
        total: json["total"] == null ? null : Today.fromJson(json["total"]),
    );

    Map<String, dynamic> toJson() => {
        "today": today?.toJson(),
        "total": total?.toJson(),
    };
}

class Today {
    int? tickets;
    int? total;

    Today({
        this.tickets,
        this.total,
    });

    factory Today.fromJson(Map<String, dynamic> json) => Today(
        tickets: json["tickets"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "tickets": tickets,
        "total": total,
    };
}
