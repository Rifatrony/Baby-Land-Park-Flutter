import 'package:baby_land_park/controller/dashboard_controller.dart';
import 'package:baby_land_park/view/package_screen.dart';
import 'package:baby_land_park/view/sale_report_screen.dart';
import 'package:baby_land_park/view/sale_ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => dashboardController.loading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 120,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Total Ticket"),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Text(dashboardController
                                  .dashboard.value.data!.total!.tickets
                                  .toString()),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Total Ticket Sell"),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Text(dashboardController
                                  .dashboard.value.data!.total!.total
                                  .toString()),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 120,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Today Sell Ticket"),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Text(dashboardController
                                  .dashboard.value.data!.today!.tickets
                                  .toString()),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Today Sell Amount"),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Text(dashboardController
                                  .dashboard.value.data!.today!.total
                                  .toString()),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                
                  SizedBox(
                    height: Get.height * 0.05,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(const PackageScreen());
                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 36,
                                backgroundColor: Colors.grey.shade200,
                                backgroundImage: const NetworkImage("https://thsblog.s3.amazonaws.com/wp-content/uploads/2015/11/08013423/where-to-sell-tickets-online.jpg"),
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Text("Sell Ticket"),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(const SaleReportScreen());
                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 36,
                                backgroundColor: Colors.grey.shade200,
                                backgroundImage: const NetworkImage("https://c8.alamy.com/comp/H2NCT1/sales-increasing-representing-progress-report-and-infochart-H2NCT1.jpg"),
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Text("Sales Report"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                
                  
                
                ],
              ),
      ),
    );
  }
}
