
import 'package:baby_land_park/model/sell_report_model.dart';
import 'package:baby_land_park/repository/sale_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SaleController extends GetxController {
  final repository = SaleRepository();
  final saleReport = SellReportModel().obs;
  final loading = false.obs;
  final saleLoading = false.obs;
  final quantityController = TextEditingController().obs;

  
  void setLoading (bool value){
    loading.value = value;
  }
  void setSaleLoading (bool value){
    saleLoading.value = value;
  }

  void setData (SellReportModel value){
    saleReport.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getSaleReport();
  }

  Future getSaleReport() async {
    setLoading(true);
    repository.getSaleReport().then((value) {
      setData(value);
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }

  Future saleTicket(dynamic data) async {
    setSaleLoading(true);
    repository.saleTicket(data).then((value) {
      setSaleLoading(false);
      if(value["status"] == "success"){
        Get.snackbar("Success", "Ticket Sale Successfully");
      }
      
    }).onError((error, stackTrace) {
      setSaleLoading(false);
      Get.snackbar("Error on error", error.toString());
      print(error.toString());
    });
  }
}