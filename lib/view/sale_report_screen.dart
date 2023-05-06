import 'package:baby_land_park/controller/sale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaleReportScreen extends StatefulWidget {
  const SaleReportScreen({super.key});

  @override
  State<SaleReportScreen> createState() => _SaleReportScreenState();
}

class _SaleReportScreenState extends State<SaleReportScreen> {
  final saleController = Get.put(SaleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sell Report"),
        backgroundColor: Colors.deepOrangeAccent.shade400,
        elevation: 0,
      ),
      body: Obx(
        () => saleController.loading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    height: Get.height * 0.07,
                    width: Get.width,
                    color: Colors.deepOrangeAccent.shade400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Text("Ticket ID",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("Date",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text("Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("Total",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.82,
                    child: ListView.builder(
                        itemCount: saleController
                            .saleReport.value.tickets!.data!.length,
                        itemBuilder: (context, index) {
                          DateTime dateTime = DateTime.parse(saleController
                              .saleReport.value.tickets!.data![index].date
                              .toString());
                          int day = dateTime.day;
                          int month = dateTime.month;
                          int year = dateTime.year;
                          String formattedDate = "$day-$month-$year";
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: InkWell(
                              onTap: () {
                                // Get.to(() => OrderDetailsScreen(
                                //       id: orderViewModel.order.value.data![index].id
                                //           .toString(),
                                //     ));
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 5, right: 5, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Ticket #${saleController.saleReport.value.tickets!
                                            .data![index].id}",
                                        style: TextStyle(
                                            color: Colors.blue.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        formattedDate,
                                        style: TextStyle(fontSize: 13,
                                        color: Colors.grey.shade700),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        saleController.saleReport.value.tickets!.data![index].title.toString(),
                                        style: TextStyle(fontSize: 12, 
                                        color: Colors.grey.shade800),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(saleController.saleReport.value
                                          .tickets!.data![index].total
                                          .toString(),
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400
                                          ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}
