// To parse this JSON data, do
//
//     final sellReportModel = sellReportModelFromJson(jsonString);

import 'dart:convert';

SellReportModel sellReportModelFromJson(String str) => SellReportModel.fromJson(json.decode(str));

String sellReportModelToJson(SellReportModel data) => json.encode(data.toJson());

class SellReportModel {
    String? status;
    Tickets? tickets;

    SellReportModel({
        this.status,
        this.tickets,
    });

    factory SellReportModel.fromJson(Map<String, dynamic> json) => SellReportModel(
        status: json["status"],
        tickets: json["tickets"] == null ? null : Tickets.fromJson(json["tickets"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "tickets": tickets?.toJson(),
    };
}

class Tickets {
    List<Datum>? data;
    Pagination? pagination;

    Tickets({
        this.data,
        this.pagination,
    });

    factory Tickets.fromJson(Map<String, dynamic> json) => Tickets(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
    };
}

class Datum {
    int? id;
    Title? title;
    String? amount;
    String? total;
    int? quantity;
    DateTime? date;
    dynamic name;
    dynamic phone;
    SellBy? sellBy;

    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: titleValues.map[json["title"]]!,
        amount: json["amount"],
        total: json["total"],
        quantity: json["quantity"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        name: json["name"],
        phone: json["phone"],
        sellBy: sellByValues.map[json["sell_by"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "amount": amount,
        "total": total,
        "quantity": quantity,
        "date": date?.toIso8601String(),
        "name": name,
        "phone": phone,
        "sell_by": sellByValues.reverse[sellBy],
    };
}

enum SellBy { MASUM }

final sellByValues = EnumValues({
    "Masum": SellBy.MASUM
});

enum Title { ENTRY_TICKET, ANY_FIVE_ITEMS_RIDE, PATTLE_BORD, ENTRY_BIG, TRAIN, DORIMON, DOLNA, HALI_CRAFT, RUNNING_HORSE, HORSE_RIDE }

final titleValues = EnumValues({
    "Any five items Ride": Title.ANY_FIVE_ITEMS_RIDE,
    "Dolna": Title.DOLNA,
    "Dorimon": Title.DORIMON,
    "Entry Big": Title.ENTRY_BIG,
    "Entry Ticket": Title.ENTRY_TICKET,
    "Hali craft": Title.HALI_CRAFT,
    "Horse Ride": Title.HORSE_RIDE,
    "Pattle Bord": Title.PATTLE_BORD,
    "Running Horse": Title.RUNNING_HORSE,
    "Train": Title.TRAIN
});

class Pagination {
    int? total;
    int? count;
    int? perPage;
    int? currentPage;
    int? totalPages;

    Pagination({
        this.total,
        this.count,
        this.perPage,
        this.currentPage,
        this.totalPages,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
