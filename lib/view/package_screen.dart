import 'package:baby_land_park/controller/package_controller.dart';
import 'package:baby_land_park/view/sale_ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({super.key});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  final packageController = Get.put(PackageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Packages"),
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent.shade400,
      ),
      body: Obx(() => packageController.loading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
                itemCount: packageController.package.value.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 3,  
                  crossAxisSpacing: 16.0,  
                  mainAxisSpacing: 16.0  
              ), 
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(SaleTicketScreen(id: packageController.package.value.data![index].id.toString()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade100
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(packageController.package.value.data![index].title.toString(), textAlign: TextAlign.center,),
                          SizedBox(height: Get.height * 0.01,),
                          Text(packageController.package.value.data![index].amount.toString()),
                        ],
                      ),
                    ),
                  );
                }),
          )),
    );
  }
}
