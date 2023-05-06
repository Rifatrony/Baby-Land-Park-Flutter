import 'package:baby_land_park/controller/sale_controller.dart';
import 'package:baby_land_park/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaleTicketScreen extends StatefulWidget {
  final String id;
  const SaleTicketScreen({super.key, required this.id});

  @override
  State<SaleTicketScreen> createState() => _SaleTicketScreenState();
}

class _SaleTicketScreenState extends State<SaleTicketScreen> {
  final controller = Get.put(SaleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sale Ticket"),
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.2,
            ),
            TextFormField(
              controller: controller.quantityController.value,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  hintText: "Number of ticket",
                  labelText: "Number of ticket",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(36))),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Obx(
              () => AppButton(
                loading: controller.saleLoading.value,
                title: "Save",
                onPress: () {
                  Map data = {
                    "package": widget.id,
                    "quantity": controller.quantityController.value.text
                  };
                  controller.saleTicket(data);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
